clear all;
close all;

% Load data
load('data_lvq_A.mat');
load('data_lvq_B.mat');

% Determine prototype positions using lvq1
data = [matA; matB];
labels = [zeros(length(matA), 1)+1; zeros(length(matB), 1)+2];
a_prots = 4; b_prots = 2;
[prots, error_rate] = mylvq1(0.01, 1000, [a_prots b_prots], data, labels);

% Plot results
figure; hold on;
scatter(matA(:, 1), matA(:, 2), 10, 'b.');
scatter(matB(:, 1), matB(:, 2), 10, 'rs');
scatter(prots(1:a_prots, 1), prots(1:a_prots, 2), 100, 'bo');
scatter(prots(a_prots+1:end, 1), prots(a_prots+1:end, 2), 100, 'rd');
legend(['matA'; 'matB'; 'proA'; 'proB']);
title(['Error rate: ' num2str(error_rate(end))]);

% Plot error rate
figure; hold on;
for a_prots = 1:2
    for b_prots = 1:2
        [prots, error_rate] = mylvq1(0.01, 1000, [a_prots b_prots], data, labels);
        plot(1:length(error_rate), error_rate);
        title(['Training error curve for A' num2str(a_prots) ' and B' num2str(b_prots)]);
    end
end
legend('A1B1', 'A1B2', 'A2B1', 'A2B2');
