function [data, labels] = getMinoverData(P, N, wstar)
    data = randn(P, N);
    labels = zeros(size(data, 1), 1);
    for i = 1:size(data, 1)
       labels(i) = sign(dot(wstar, data(i, :)));
    end
end