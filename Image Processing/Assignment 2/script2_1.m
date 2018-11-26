close all;
clear all;

trui = imread('../images/trui.tif');
figure;
colormap(gray(256));
imagesc(IPgradient(trui));