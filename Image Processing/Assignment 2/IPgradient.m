function out = IPgradient(image)
    image = double(image);
    image = padarray(image, [1,1], 'replicate');
    %mask = [-1,0,1;-1,0,1;-1,0,1]; %Prewitt
    mask = [-1,0,1;-2,0,2;-1,0,1]; %Sobel
    Gx = IPfilter(mask, image);
    Gy = IPfilter(rot90(mask), image);
    out = sqrt(Gx.*Gx + Gy.*Gy);
    out = out(2:size(out,1)-1, 2:size(out,2)-1);
end