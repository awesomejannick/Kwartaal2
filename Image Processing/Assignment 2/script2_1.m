%Reset workspace
close all;
clear all;

%Load input image
moon = imread('../images/blurrymoon.tif');

%Show image and its gradient
figure;
colormap(gray(256));
subplot(1,3,1);
imshow(moon);
title('Blurry moon');
subplot(1,3,2);
imshow(IPgradient(moon, 1));
title('Prewitt Gradient');
subplot(1,3,3);
imshow(IPgradient(moon, 2));
title('Sobel Gradient');