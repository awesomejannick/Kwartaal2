clear all;
close all;

load("checkerboard.mat");
k = 100;
tmax = 1000;

%batchNG(checkerboard, k, tmax);

[h, ~, ~] = mykmeans(checkerboard, k, tmax, 0);

figure; hold on;
scatter(checkerboard(:, 1), checkerboard(:, 2), 3, 'bo');
scatter(h(end-k+1:end, 1), h(end-k+1:end, 2), 10, 'ro', 'linewidth',3);
voronoi(h(end-k+1:end, 1), h(end-k+1:end, 2));
title("Kmeans with k=100");