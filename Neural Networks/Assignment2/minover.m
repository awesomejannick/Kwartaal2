%Performs sequential training on a Rosenblatt Perceptron
%with P feature vectors of length N and nmax epochs
function [done, w, data, labels] = minover(P, N, nmax, wstar)
    w = zeros(1, N);
    [data, labels] = getMinoverData(P, N, wstar);
    
    %Do epochs
    unchanged = [0, w];
    done = false;
    
    for n = 1:nmax*P
        % Determine stabilities
        r = zeros(P, 1);
        for i = 1:P
            r(i) = (dot(w, data(i, :)) * labels(i));
        end
        [~, minimum] = min(r);
        
        % Update
        w = w + 1/N * data(minimum, :) * labels(minimum);
        
        % Stop when w stops changing
        if norm(w - unchanged(2)) < 0.001
            unchanged(1) = unchanged(1) + 1;
            if unchanged(1) == P
                done = 1;
                break;
            end
        else
            unchanged = [0, w];
        end
    end
end