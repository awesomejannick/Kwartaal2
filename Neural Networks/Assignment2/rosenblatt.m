%Performs sequential training on a Rosenblatt Perceptron
%with P feature vectors of length N and nmax epochs
function [w, data, labels] = rosenblatt(P, N, nmax, wstar)
    w = zeros(1, N);
    [data, labels] = getMinoverData(P, N, wstar);
    
    %Precompute data
    ldata = data; ndata = data;
    for mu = 1:P
        ldata(mu,:) = data(mu,:)*labels(mu);
        ndata(mu,:) = ldata(mu,:) ./ N;
    end
    
    %Do epochs
    for n = 1:nmax
        done = true;
        for mu = 1:P
            if dot(w,ldata(mu,:)) <= 0
                w = w + ndata(mu,:);
                done = false;
            end
        end
        if done
            break;
        end
    end
end