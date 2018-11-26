% Maximizes the contrast of Im (N-byte image) through linear stretching
function Im2 = IPcontraststretch(Im, N)
    M = max(Im(:));
    m = min(Im(:));
    c = (2.0^N - 1) / double(M-m);
    Im2 = c * (Im - m);
end