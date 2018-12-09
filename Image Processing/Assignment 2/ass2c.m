close all;
clear all;

chars = imread('../images/characters_0.tif');
figure;
colormap(gray(256));
H = IPgaussian(0.5, 3, 3);
%H = [-1,0,1;-2,0,2;-1,0,1];
disp(H);
r = IPftfilter(chars, H);
disp(r);
imagesc(r);