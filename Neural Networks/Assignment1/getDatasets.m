%Randomly generates a dataset of P feature vectors of length N
function [data, labels] = getDatasets(P, N)
    data = randn(P, N);
    labels = round(rand(1,P)) .* 2 - 1;
end