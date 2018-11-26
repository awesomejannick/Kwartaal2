%Reduces the number of intensity levels in Image from 256 to N
function out = IPreduce(Image, N)
    out = uint8(((N * double(Image)) / 256));
end