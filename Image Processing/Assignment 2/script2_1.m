close all;
clear all;

trui = imread('../images/characters.tif');
figure;
colormap(gray(256));
imagesc(IPgradient(trui));