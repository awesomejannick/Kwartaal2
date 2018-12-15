%Computes the inverse 1D Discrete Wavelet Transform on f with the specified scale
function f = IPidwt(w, scale)
    %Basecase of the recursion
    if scale == 0 || length(w) == 1
        f = w;
        return;
    end
    
    %Recursively get the inverse DWT the left half of w
    f1 = IPidwt(w(1:end/2), scale-1);
    f2 = w(end/2+1:end);
    
    %Compute the inverse of w
    f = zeros(1, length(f1) * 2);
    f(1:2:end) = (f1+f2) / sqrt(2);
    f(2:2:end) = (f1-f2) / sqrt(2);
end