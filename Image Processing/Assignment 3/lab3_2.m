%Reset workspace
close all;
clear all;

%Load input image
vase = imread('../images/vase.tif');

%Show vase and its 2-scale DWT
figure;
subplot(1,2,1);
imshow(vase);
title('vase.tif');
subplot(1,2,2);
imshow(IPdwt2scale(vase,2));
title('2-scale DWT of vase.tif')