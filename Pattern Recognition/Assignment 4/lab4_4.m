close all;
clear all;

% Q1
image = double(imread('HeadTool0002.bmp'));
% Q2
image = image;
% Q3
[centers, radii] = imfindcircles(image, [20 40], 'Sensitivity', 0.99);
disp(centers(1:6, :));

colormap('gray');
imagesc(image);
viscircles(centers(1:6, :), radii(1:6, :), 'EdgeColor','b');