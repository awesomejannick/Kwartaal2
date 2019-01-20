%Computes the nth moment of z
function out = IPmoment(z, n)
    u = unique(z)';
    h = hist(z,u);
    h = h(h>0) / length(z);
    out = sum((u-mean(z)).^n .* h);
end