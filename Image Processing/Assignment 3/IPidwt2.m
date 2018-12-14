%Computes the inverse 2D Discrete Wavelet Transform on f with the specified scale
function f = IPidwt2(w, scale)
    %Basecase of the recursion
    if scale == 0 || length(w) == 1
        f = w;
        return;
    end
    
    %Split w in quarters and recursively get the inverse DWT of the topleft
    wa = IPidwt2(w(1:end/2, 1:end/2), scale-1);
    wb = w(end/2+1:end, 1:end/2);
    wc = w(1:end/2, end/2+1:end);
    wd = w(end/2+1:end, end/2+1:end);
    
    %Compute the inverse DWT
    d = (wa+wb+wc+wd) ./ 2;
    f = zeros(length(w));
    f(1:2:end,1:2:end) = wa+wd-d;
    f(1:2:end,2:2:end) = wa+wb-d;
    f(2:2:end,1:2:end) = wa+wc-d;
    f(2:2:end,2:2:end) = d;
end

