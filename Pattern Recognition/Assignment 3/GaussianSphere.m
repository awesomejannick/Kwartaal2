%Computes the probability density of a sperical Gaussian in point x
function y = GaussianSphere(x, data, h)
    y = 0;
    for j = 1:length(data)
        s = sum((x-data(j,:)).^2);
        y = y + exp(-s/(2*h^2));
    end
    y = y / length(data) / (h*sqrt(2*pi))^3;
end