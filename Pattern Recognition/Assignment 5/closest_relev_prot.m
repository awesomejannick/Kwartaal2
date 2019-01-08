function [m, j] = closest_relev_prot(dp, prots, indices, relevance)
    [m, j] = min(arrayfun(@(x) sum((relevance .* (prots(x, :) - dp)).^2, 2), indices));
end