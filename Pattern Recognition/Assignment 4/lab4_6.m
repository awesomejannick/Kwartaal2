%Clean workspace
close all;
clear all;

%Read input image;
img = imread('dogGrayRipples.png');

%Convert to frequency domain
f = fft2(img);
f = fftshift(f);
imagesc(abs(real(f))+abs(imag(f)));
[x, y] = getpts;
x = [167 167];
y = [120 180];
mask = question3(f, x, y, 10);
disp(mask);
f(logical(mask)) = 0;
f = fftshift(f);

%Show images
figure;
imshow(uint8(ifft2(f)));
title('s2774100');