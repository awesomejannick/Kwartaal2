%Performs sequential training on a Rosenblatt Perceptron
%with P feature vectors of length N and nmax epochs
function [done, w, data, labels] = seqTraining(P, N, nmax)
    w = zeros(1, N);
    [data, labels] = getDatasets(P,N);
    
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