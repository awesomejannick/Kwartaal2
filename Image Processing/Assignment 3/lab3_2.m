%Reset workspace
close all;
clear all;

%Load input image
vase = imread('../images/vase.tif');

%Show vase and its 2-scale DWT
scale = 1;
figure;
subplot(1,2,1);
imshow(vase);
title('vase.tif');
subplot(1,2,2);
imshow(IPdwt2scale(vase,scale));
title('2-scale DWT of vase.tif')

%Show reconstructed vase
figure;
subplot(1,2,1);
imshow(vase);
title('Original vase.tif')
subplot(1,2,2);
wavelet = IPdwt2(vase, scale);
imshow(IPidwt2(wavelet, scale));
title('Reconstructed vase.tif');