close all;
clear all;

vase = imread('../images/blobs.tif');

figure;
colormap('gray');
imshow(IPdwt2scale(vase,2));

figure;
colormap('gray');
[a,b,c,d] = haart2(vase,1);
imagesc([a,b;c,d]);

disp(vase - IPidwt2(IPdwt2(vase,2),2));