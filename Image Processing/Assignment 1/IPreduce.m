%Reduces the number of intensity levels in Image from 256 to N
function out = IPreduce(Image, N)
    out = floor(N/256 * double(Image));
    out = uint8(out / ((N-1)/256));
end