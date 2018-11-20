close all; 
clear all;
         
trui=imread('images/trui.tif');
trui_stretched = IPcontraststretch(trui);
imwrite(trui_stretched, 'output/trui_stretched.tif');

% Plot the input image
figure;
colormap(gray(256));
imagesc(trui);
title('trui.tif')

% Plot the input image
figure;
colormap(gray(256));
imagesc(trui_stretched);
title('trui_stretched.tif')