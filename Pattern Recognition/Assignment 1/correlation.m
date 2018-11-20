% Computes the correlation coefficient of two variables
function c = correlation(var1, var2)
    c = covariance(var1, var2) / sqrt(covariance(var1, var1) * covariance(var2, var2));
end

% Computes the covariance of two variables
function c = covariance(var1, var2)
    N = length(var1);
    m1 = mean(var1);
    m2 = mean(var2);
    c = 0;
    for i=1:N
        c = c + (var1(i) - m1) * (var2(i) - m2) / N;
    end
end