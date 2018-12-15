%Performs morphological dilation of image img with structuring element SE
function out = IPdilate(img, SE)
    %Add zero-padding along boundaries
    N = size(img,1);
    M1 = size(SE,1) - 1;
    M2 = size(SE,2) - 1;
    out = padarray(img, [M1/2 M2/2], 0, 'both');
    
    %Dilate img
    for i = 1:numel(img)
        if img(i)
            x = mod(i-1,N)+1;
            y = ceil(i/N);
            out(x:x+M1, y:y+M2) = out(x:x+M1, y:y+M2) | SE;
        end
    end
    
    %Remove padding
    out = out(M1/2+1:end-M1/2, M2/2+1:end-M2/2);
end