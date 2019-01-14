function [history, distances, closest] = mykmeans(fv, k, tmax, kplusplus)
    if kplusplus
        prots = fv(randsample(1:size(fv, 1), 1), :);
    else
        prots = fv(randsample(1:size(fv, 1), k), :);
        history = prots;
    end
    
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