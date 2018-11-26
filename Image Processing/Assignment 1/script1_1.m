close all; 
clear all;
         
% Load skull image
skull = imread('images/ctskull-256.tif');

% Reduce number of intensity levels
Ncol = 2;
skull_reduced = IPreduce(skull, Ncol);
imwrite(skull_reduced, 'output/ctskull_reduced.tif');

% Plot the input image
figure;
colormap(gray(256));
imagesc(skull);
title('ctskull-256.tif')

% Plot the reduced image
figure;
colormap(gray(Ncol));
imagesc(skull_reduced);
title('ctskull\_reduced.tif')