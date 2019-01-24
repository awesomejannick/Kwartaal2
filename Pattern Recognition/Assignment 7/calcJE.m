function je = calcJE(x, xs, ys)
    m = 1/size(xs, 2) * sum(x(xs, :));
    je = 0;
    for i = xs
        je = je + norm(x(i, :) - m)^2;
    end
    m = 1/size(ys, 2) * sum(x(4:5, :));
    for i = ys
        je = je + norm(x(i, :) - m)^2;
    end
end