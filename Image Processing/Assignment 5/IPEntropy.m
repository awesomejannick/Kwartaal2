%Computes the texture entropy of z
function out = IPEntropy(z)
    u = unique(z);
    h = hist(z,u);
    h = h(h>0) / length(z);
    out = - sum(h .* log2(h));
end