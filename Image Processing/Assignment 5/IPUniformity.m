%Computes the texture uniformity of z
function out = IPUniformity(z)
    u = unique(z);
    h = hist(z,u);
    h = h(h>0) / length(z);
    out = sum(h.^2);
end