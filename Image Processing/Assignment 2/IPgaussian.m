%Creates a MxN lowpass Gaussian mask with cutoff frequency D0
function H = IPgaussian(D0, M, N)
    H = zeros(M, N);
    middle = [(M+1)/2, (N+1)/2];
    
    for i = 1: M
        for j = 1: N
            d = abs(i - middle(1)) + abs(j - middle(2));
            H(i, j) = exp((-d) / (2 * D0));
        end
    end
    
    %Normalize mask
    H = H / sum(sum(H));
end