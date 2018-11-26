function out = IPfilter(mask, image)
    N = size(image);
    M = size(mask);
    out = zeros(N);
    
    for i = 1:N(1)
        for j = 1:N(2)
            a = i-(M(1)+1)/2;
            b = j-(M(2)+1)/2;
            for k = 1:M(1)
                for l = 1:M(2)
                    if a+k >= 1 && a+k <= N(1) && b+l >= 1 && b+l <= N(2)
                        out(i,j) = out(i,j) + mask(k,l) * image(a+k, b+l);
                    end
                end
            end
        end
    end
end