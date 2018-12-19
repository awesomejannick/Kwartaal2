function prots = mylvq1(mu, iters, number_prototypes, data, labels)
    % Initialization of the prototypes for each class
    prots = zeros(number_prototypes*size(data, 2), 2); % Assuming 2d data
    classes = length(unique(labels));
    
    for c = 0:classes-1
        for p = 1:number_prototypes
            pn = c*number_prototypes + p;
            prots(pn, :) = datasample(data(labels==c, :), 1);
        end
    end
    % Iterative learning
    for i = 1:iters
        for d = 1:length(data)
            [m, j] = min(arrayfun(@(x) dist(prots(x, :), data(d, :)), 1:length(prots)));
            if mod(j, classes) == labels(d)
                % Closest prototype is of the same class
                prots(j, :) = prots(j, :) + mu*(prots(j, :) - data(d));
            else
                % Closest prototype is from another class
                prots(j, :) = prots(j, :) - mu*(prots(j, :) - data(d));
            end
        end
    end
end