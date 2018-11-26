function out = IPgradient(image)
    N = size(image) - [1 1];
    out = zeros(N);
    for i = 1:N(1)
        for j = 1:N(2)
            gx = image(i, j+1) - image(i, j);
            gy = image(i+1, j) - image(i, j);
            out(i,j) = sqrt(gx*gx + gy*gy);
        end
    end
end