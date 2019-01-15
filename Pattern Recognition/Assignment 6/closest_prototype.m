function [x, y] = closest_prototype(prots, dp)
    [x, y] = min(arrayfun(@(x) (sum((prots(x, :) - dp).^2)), 1:size(prots, 1)));
end