%Reset workspace
close all;
clear all;

%Load input image
trui = imread('../images/trui.tif');

%Show image and its gradient
figure;
colormap(gray(256));
subplot(1,3,1);
imshow(trui);
title('trui');
subplot(1,3,2);
imshow(IPgradient(trui, 1));
title('Prewitt Gradient');
subplot(1,3,3);
imshow(IPgradient(trui, 2));
disp(IPgradient(trui, 2))
title('Sobel Gradient');