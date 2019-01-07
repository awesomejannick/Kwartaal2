function [m, j] = closest_prot(dp, prots, indices)
    [m, j] = min(arrayfun(@(x) dist(prots(x, :), dp), indices));
end