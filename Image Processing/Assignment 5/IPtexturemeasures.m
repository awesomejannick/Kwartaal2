function [M,D,R,S,U,E] = IPtexturemeasures(tex)
    tex = double(tex(:));
    M = mean(tex);
    D = std(tex);
    R = 1 - 1 / (1 + var(tex) / (255^2));
    S = IPmoment(tex,3) / (255^3);
    U = IPUniformity(tex);
    E = IPEntropy(tex);
end