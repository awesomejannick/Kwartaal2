%Performs sequential training on a Rosenblatt Perceptron
%with P feature vectors of length N and nmax epochs
function done = seqTraining(P, N, nmax)
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
    
    %figure;hold on;
    %scatter(data(labels== 1, 1), data(labels== 1, 2), 10, 'b');
    %scatter(data(labels==-1, 1), data(labels==-1, 2), 10, 'r');
    %scatter([0], [0], 20, 'g');
    %line([-3*w(2), 3*w(2)], [3*w(1), -3*w(1)]);
end