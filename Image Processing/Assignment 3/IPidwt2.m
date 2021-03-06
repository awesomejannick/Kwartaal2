%Computes the inverse 2D Discrete Wavelet Transform on f with the specified scale
function f = IPidwt2(w, scale)
    %Sanitize input
    w = double(w);
    if ~exist('scale', 'var')
        scale = 1;
    end
    
    %Recursively compute the inverse DWT
    f = uint8(IPidwt2rec(w, scale));
end

%The recursive par of IPidwt2
function f = IPidwt2rec(w, scale)
    %Basecase of the recursion
    if scale == 0 || length(w) == 1
        f = w;
        return;
    end
    
    %Split w in quarters and recursively get the inverse DWT of the topleft
    ws = IPidwt2rec(w(1:end/2, 1:end/2), scale-1);
    wh = w(end/2+1:end, 1:end/2);
    wv = w(1:end/2, end/2+1:end);
    wd = w(end/2+1:end, end/2+1:end);
    
    %Compute the inverse DWT
    d = (ws+wh+wv+wd) ./ 2;
    f = zeros(length(w));
    f(1:2:end,1:2:end) = ws+wd-d;
    f(1:2:end,2:2:end) = ws+wh-d;
    f(2:2:end,1:2:end) = ws+wv-d;
    f(2:2:end,2:2:end) = d;
end

