%Denoise an image using Haar wavelets
function out = IPwaveletdenoise(image, scale, thres)
    %Compute DWT of image
    w = IPdwt2(image, scale);
    
    %Apply soft thresholding
    w((w>-thres) & (w<thres)) = 0;
    w(w>thres) = w(w>thres) - thres;
    w(w<-thres) = w(w<-thres) + thres;
    
    %Get image back with inverse DWT
    out = IPidwt2(w, scale);
end