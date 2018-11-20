function Im2 = IPcontraststretch(Im)
    N = 8; %Number of bits
    Im2 = Im;
    
    %Determine max and min intensities:
    m = 2^N-1;
    M = 0;
    for i = 1:size(Im, 1)
        for j = 1:size(Im, 2)
            if Im(i, j) > M
                M = Im(i, j);
            elseif Im(i,j) < m
                m = Im(i, j);
            end
        end
    end
    
    %Perform linear contrast stretching:
    c = 2.0^N / double(M-m);
    for i = 1:size(Im, 1)
        for j = 1:size(Im, 2)
            Im2(i, j) = c * (Im(i, j) - m);
        end
    end
end