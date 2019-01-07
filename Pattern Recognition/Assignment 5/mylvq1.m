function [prots, error_rates] = mylvq1(mu, max_iters, num_prots, data, labels)
    % Initialization of the prototypes for each class
    prots = zeros(sum(num_prots), 2); % Assuming 2d data
    prot_labs = zeros(sum(num_prots), 1);
    
    for c = 1:length(num_prots)
        cstart = sum(num_prots(1:c-1))+1; cend = cstart + num_prots(c) -1;
        prots(cstart:cend, :) = datasample(data(labels==c, :), num_prots(c));
        prot_labs(cstart:cend, :) = zeros(num_prots(c), 1) + c;
    end
    
    % Iterative learning
    error_rates = [];
    for i = 1:max_iters
        for d = 1:length(data)
            [~, j] = closest_prot(data(d, :), prots, 1:length(prots));
            if prot_labs(j) == labels(d)
                % Closest prototype is of the same class
                prots(j, :) = prots(j, :) + mu*(prots(j, :) - data(d));
            else
                % Closest prototype is from another class
                prots(j, :) = prots(j, :) - mu*(prots(j, :) - data(d));
            end
        end
        
        % Calculate error rate for current epoch
        faults = 0;
        for d = 1:length(data)
            [min_a, ~] = closest_prot(data(d, :), prots, 1:num_prots(1));
            [min_b, ~] = closest_prot(data(d, :), prots, num_prots(1)+1:num_prots(1)+num_prots(2));
            if (labels(d) == 1 && min_a <= min_b) || (labels(d) == 2 && min_a > min_b)
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