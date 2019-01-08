function [prots, error_rates, relevances] = myrlvq(mu, max_iters, num_prots, data, labels)
    % Initialization of the prototypes for each class
    prots = zeros(sum(num_prots), 2); % Assuming 2d data
    prot_labs = zeros(sum(num_prots), 1);
    
    for c = 1:length(num_prots)
        cstart = sum(num_prots(1:c-1))+1; cend = cstart + num_prots(c) -1;
        prots(cstart:cend, :) = datasample(data(labels==c, :), num_prots(c));
        prot_labs(cstart:cend, :) = zeros(num_prots(c), 1) + c;
    end
    
    % Initialization for relevances
    relevances = ones(1, size(data, 2));
    relevances = relevances / sum(relevances);
    
    % Iterative learning
    error_rates = [];
    for i = 1:max_iters
        relevances = [relevances; zeros(1, size(data, 2))];
        for d = 1:length(data)
            [~, j] = closest_relev_prot(data(d, :), prots, 1:length(prots), relevances(i, :));
            change = mu*(prots(j, :) - data(d));
            if prot_labs(j) == labels(d)
                % Closest prototype is of the same class
                relevances(i+1, :) = relevances(i, :) - change;
                prots(j, :) = prots(j, :) - change;
            else
                % Closest prototype is from another class
                relevances(i+1, :) = max(0, relevances(i, :) + change);
                prots(j, :) = prots(j, :) + change;
            end
        end
        
        % Enforce sum(relavances) == 1
        relevances(i+1, :) = relevances(i+1, :) / sum(relevances(i+1, :));
        
        % Calculate error rate for current epoch
        faults = 0;
        for d = 1:length(data)
            [~, closest_num] = closest_relev_prot(data(d, :), prots, 1:length(prots), relevances(i, :));
            if prot_labs(closest_num) ~= labels(d)
                faults = faults + 1;
            end
        end
        
        % Abort if error rate change < 0.00001
        error_rates = [error_rates; faults / length(data)];
        if (i>1) && (abs(error_rates(i-1) - error_rates(i)) < 0.0001)
            break;
        end
    end
end