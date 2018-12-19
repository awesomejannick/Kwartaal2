clear all;
close all;

load('data_lvq_A.mat');
load('data_lvq_B.mat');

figure; hold on;
scatter(matA(:, 1), matA(:, 2), 10, 'b.');
scatter(matB(:, 1), matB(:, 2), 10, 'rs');

data = [matA; matB];
labels = [zeros(length(matA), 1); ones(length(matB), 1)];

prots = mylvq1(0.001, 1000, 4, data, labels);

scatter(prots(1:end/2, 1), prots(1:end/2, 2), 100, 'bo');
scatter(prots(end/2+1:end, 1), prots(end/2+1:end, 2), 100, 'rd');
legend(['matA'; 'matB'; 'proA'; 'proB']);