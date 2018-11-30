%Performs sequential training on a Rosenblatt Perceptron
%with P feature vectors of length N and nmax epochs
function [done, w, data, labels] = seqTraining(P, N, nmax)
    w = zeros(1, N);
    [data, labels] = getDatasets(P,N);
    for n = 1:nmax
        done = true;
        for mu = 1:P
            if dot(w,data(mu,:))*labels(mu) <= 0
                w = w + data(mu,:)*labels(mu) ./ N;
                done = false;
            end
        end
        if done
            break;
        end
    end
end