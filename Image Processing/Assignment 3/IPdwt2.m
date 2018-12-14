%Computes the 2D Discrete Wavelet Transform on f with the specified scale
function w = IPdwt2(f, scale)
    %Sanitize input
    f = double(f);
    if ~exist('scale', 'var')
        scale = 1;
    end
    
    %Recursively compute the DWT
    w = IPdwt2rec(f, scale);
end

%The recursive par of IPdwt2
function w = IPdwt2rec(f, scale)
    %Basecase of the recursion
    if length(f) == 1 || scale == 0
        w = f;
        return;
    end
    
    %Compute the sums and differences of f
    sums = (f(1:2:end,1:2:end) + f(2:2:end,1:2:end) + f(1:2:end,2:2:end) + f(2:2:end,2:2:end)) / 2;
    dif1 = (-f(1:2:end,1:2:end) + f(2:2:end,1:2:end) - f(1:2:end,2:2:end) + f(2:2:end,2:2:end)) / 2;
    dif2 = (-f(1:2:end,1:2:end) - f(2:2:end,1:2:end) + f(1:2:end,2:2:end) + f(2:2:end,2:2:end)) / 2;
    dif3 = (f(1:2:end,1:2:end) - f(2:2:end,1:2:end) - f(1:2:end,2:2:end) + f(2:2:end,2:2:end)) / 2;
    
    %Recursively transform the set of sums
    sums = IPdwt2rec(sums, scale-1);
    w = [sums dif1; dif2 dif3];
end