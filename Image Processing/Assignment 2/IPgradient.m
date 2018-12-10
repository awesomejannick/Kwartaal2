%Computes the gradient magnitude of image using the specified method (1=Prewitt, 2=Sobel)
function out = IPgradient(image, method)
    image = double(image);
    image = padarray(image, [1,1], 'replicate');
    
    %Create mask
    if method == 1
        mask = [-1,0,1;-1,0,1;-1,0,1]; %Prewitt
    else
    	mask = [-1,0,1;-2,0,2;-1,0,1]; %Sobel
    end
    
    %Calculate gradient along axes
    Gx = IPfilter(mask, image);
    Gy = IPfilter(rot90(mask), image);
    
    %Calculate gradient magnitude
    out = sqrt(Gx.*Gx + Gy.*Gy);
    out = uint8(out(2:size(out,1)-1, 2:size(out,2)-1));
end