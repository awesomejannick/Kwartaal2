close all;
clear all;
figure;
image = imread('HeadTool0002.bmp');

% Q1
imaged = double(image);

% Q2
imagec = adapthisteq(image);
subplot(2, 2, 1);
imshow(image);
title('Original HeadTool0002.bmp');
subplot(2, 2, 2);
imshow(imagec);
title('Contrast-limited Adaptive Histogram Equalization on HeadTool0002.bmp');

% Q3
[centers, radii] = imfindcircles(imagec, [20 40], 'Sensitivity', 0.9);
disp(centers);

colormap('gray');
subplot(2, 2, 3);
imshow(imagec);
title('Sensitivity: 0.9, all circles');
viscircles(centers, radii, 'EdgeColor','b');

% Q4
subplot(2, 2, 4);
imshow(imagec);
title('Sensitivity: 0.9, best 2 circles');
amount = 2;
viscircles(centers(1:amount, :), radii(1:amount, :), 'EdgeColor','b');



