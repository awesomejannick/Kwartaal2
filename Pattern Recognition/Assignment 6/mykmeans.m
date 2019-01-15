function [history, distances, closest] = mykmeans(fv, k, tmax, kpp)
    if kpp
        prots = zeros(k, size(fv, 2));
        distances = zeros(size(fv, 1), 1);
        
        % Determine prototypes iteratively
        prots(1, :) = fv(randsample(1:size(fv, 1), 1), :);
        for i = 2:k
            for j = 1:size(fv, 1)
                [distances(j), ~] = closest_prototype(prots, fv(j, :));
            end
            prots(i, :) = fv(randsample(1:size(fv, 1), 1, true, distances), :);
        end
    else
        prots = fv(randsample(1:size(fv, 1), k), :);
    end
    history = prots;
    
    for t = 1:tmax
        % Determine closest prototypes
        closest = zeros(size(fv, 1), 1);
        for i = 1:size(fv, 1)
            [~, closest(i)] = closest_prototype(prots, fv(i, :));
        end
        
        % Update means
        for i = 1:size(prots, 1)
            prots(i, :) = sum(fv(closest==i, :))./ sum(closest==i);
        end
        
        % Append to history and check whether there is change
        ind = size(history, 1) - k + 1:size(history, 1);
        if (history(ind, :) == prots)
            break;
        end
        history = [history; prots];
    end
    
    distances = zeros(k, 1);
    for i = 1:k
        arr = fv(closest==i, :);
        distances(i) = sum(arrayfun(@(x) closest_prototype(prots, arr(x, :)), 1:size(arr, 1)));
    end
end