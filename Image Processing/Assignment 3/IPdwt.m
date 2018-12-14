%Computes the 1D Discrete Wavelet Transform on f with the specified scale
function w = IPdwt(f, scale)
    %Basecase of the recursion
    if scale == 0 || length(f) == 1
        w = f;
        return;
    end
    
    %Compute sums and differences of f
    sums = f(1:2:end) + f(2:2:end);
    difs = f(1:2:end) - f(2:2:end);
    
    %Recursively transform the sums and then append the differences
    w = [IPdwt(sums, scale-1), difs] / sqrt(2);
end