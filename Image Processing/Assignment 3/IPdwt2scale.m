%Computes the DWT of f and then scale its contrast to the range 0-255
function w = IPdwt2scale(f, scale)
    w = IPdwt2(f, scale);
    M = max(w(:));
    m = min(w(:));
    c = (2.0^8 - 1) / double(M-m);
    w = uint8(c * (w - m));
end