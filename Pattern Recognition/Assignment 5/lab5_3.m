clear all;
close all;

% Load and display data
load('data_lvq_A.mat');
load('data_lvq_B.mat');

figure; hold on;
scatter(matA(:, 1), matA(:, 2), 10, 'rs');
scatter(matB(:, 1), matB(:, 2), 10, 'bo');

% Determine prototype positions using lvq1
data = [matA; matB];
labels = [zeros(length(matA), 1)+1; zeros(length(matB), 1)+2];
a_prots = 2; b_prots = 1;
[prots, error_rate, relevances] = myrlvq(0.01, 1000, [a_prots b_prots], data, labels);

figure;
subplot(1, 2, 1);hold on;
plot(1:length(error_rate), error_rate);
legend("Error rate");
title("Error rate of 2 A and 1 B prototype");
subplot(1, 2, 2);hold on;
plot(1:length(relevances), relevances(:, 1));
plot(1:length(relevances), relevances(:, 2));
legend(["Relevance 1"; "Relevance 2"]);
title("Relevances of 2 A and 1 B prototype");


figure; hold on;
scatter(prots(1:a_prots, 1), prots(1:a_prots, 2), 50, 'rd');
scatter(prots(a_prots+1:end, 1), prots(a_prots+1:end, 2), 50, 'bo');
for d = 1:length(data)
    dp = data(d, :);
    [~, closest] = closest_relev_prot(dp, prots, 1:length(prots), relevances(end, :));
    if closest <= a_prots
        scatter(dp(:,1), dp(:,2), 10, 'rs');
    else
        scatter(dp(:,1), dp(:,2), 10, 'bo');
    end
end
scatter(prots(1:a_prots, 1), prots(1:a_prots, 2), 50, 'rd');
scatter(prots(a_prots+1:end, 1), prots(a_prots+1:end, 2), 50, 'bo');
legend(["Class A"; "Class B"]);