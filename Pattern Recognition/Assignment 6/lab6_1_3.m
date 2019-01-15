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
errors = zeros(iters, 2);
parfor i = 1:iters
    [~, e0, ~] = mykmeans(checkerboard, k, tmax, 0);
    [~, e1, ~] = mykmeans(checkerboard, k, tmax, 1);
    errors(i, :) = [sum(e0), sum(e1)];
end

% Plot results
figure; hold on;
plot(errors(:, 1), 'color', 'red');
plot(errors(:, 2), 'color', 'blue');
legend(["K-means"; "K-means++"]);
s1 = sprintf("Kmeans: min=%s avg=%s", num2str(min(errors(:, 1))), num2str(sum(errors(:, 1)) / size(errors(:, 1), 1)));
s2 = sprintf("Kmeans++: min=%s avg=%s", num2str(min(errors(:, 2))), num2str(sum(errors(:, 2)) / size(errors(:, 2), 1)));
[~, wtt] = ttest2(errors(:, 1), errors(:, 2));
title([s1;s2;sprintf("Welch t-test=%s", num2str(wtt))]);
