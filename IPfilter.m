function out = IPfilter(image, mask)
    N = size(image) + [2 2];
    M = size(mask);
    image = rot90(image, 2);
    out = zeros(N);
    for i = 1:N(1)
        for j = 1:N(2)
            for k = 1:M(1)
                for l = 1:M(2)
                    if 1 <= i-k+1 && i-k+3 <= N(1) && 1 <= j-l+1 && j-l+3 <= N(2)
                        out(i,j) = out(i,j) + image(i-k+1, j-l+1) * mask(k, l);
                    end
                end
            end
        end
    end
end