% Maximizes the contrast of Im through linear stretching
function Im2 = IPcontraststretch(Im)
    M = max(Im(:));
    m = min(Im(:));
    c = 256.0 / double(M-m);
    Im2 = c * (Im - m);
end