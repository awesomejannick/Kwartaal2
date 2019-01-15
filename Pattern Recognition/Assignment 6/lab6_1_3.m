close all;
clear all;

load("checkerboard.mat");
tmax = 10;

% Q 6-8
k = 100;
iters = 20;

% Plot single solution
%{
[h0, e0, ~] = mykmeans(checkerboard, k, tmax, 0);
[h1, e1, ~] = mykmeans(checkerboard, k, tmax, 1);
figure; hold on;
scatter(checkerboard(:, 1), checkerboard(:, 2), 5, 'b.');
scatter(h0(end-k+1:end, 1), h0(end-k+1:end, 2), 25, 'gd');
scatter(h1(end-k+1:end, 1), h1(end-k+1:end, 2), 25, 'rd');
%}

% Generate results
runs = 10;
minima = zeros(runs, 2);
parfor r = 1:runs
    errors = zeros(iters, 2);
    for i = 1:iters
        [~, e0, ~] = mykmeans(checkerboard, k, tmax, 0);
        [~, e1, ~] = mykmeans(checkerboard, k, tmax, 1);
        errors(i, :) = [sum(e0), sum(e1)];
    end
    minima(r, :) = [min(errors(:, 1)) min(errors(:, 2))];
end

% Plot results
disp("Minima, avg, std");
disp([min(minima(:, 1)), sum(minima(:, 1)) / size(minima(:, 1), 1) std(minima(:, 1))]);
disp([min(minima(:, 2)), sum(minima(:, 2)) / size(minima(:, 2), 1) std(minima(:, 2))]);
disp("Welch t-test");
[~, wtt] = ttest2(minima(:, 1), minima(:, 2));
disp(wtt);