%Performs spacial filtering on image with the specified mask
function out = IPfilter(mask, image)
    [N, M] = size(mask);
    out = zeros(size(image));
    
    for n = -floor(N/2): floor(N/2)
        for m = -floor(M/2): floor(M/2)
            %Use wrapping to shift image
            copy = image;
            if n > 0
                copy = [copy(n+1:end, :) ; copy(1:n,:)];
            end
            if m > 0
                copy = [copy(:, m+1:end) copy(:, 1:m)];
            end
            if n < 0
                copy = [copy(end+n+1:end, :) ; copy(1:end+n, :)];
            end
            if m < 0
                copy = [copy(:, end+m+1:end) copy(:, 1:end+m)];
            end
            
            %Add weighted copy to result
            out = out + mask(n + (N+1)/2, m + (M+1)/2) * copy;
        end
    end
end