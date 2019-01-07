clear all;
close all;

% Load data
load('data_lvq_A.mat');
load('data_lvq_B.mat');

% Determine prototype positions using lvq1
data = [matA; matB];
labels = [zeros(length(matA), 1)+1; zeros(length(matB), 1)+2];
a_prots = 2; b_prots = 2;
[prots, error_rate] = mylvq1(0.01, 1000, [a_prots b_prots], data, labels);

% Plot results
figure; hold on;
scatter(matA(:, 1), matA(:, 2), 10, 'b.');
scatter(matB(:, 1), matB(:, 2), 10, 'rs');
legend(['matA'; 'matB']);
title('Data from matrix A and B');

figure; hold on;
plot(1:length(error_rate), error_rate);
title(['Training error curve for A: ' num2str(a_prots) ' and B: ' num2str(b_prots) ' prototypes']);
xlabel('Epoch');
ylabel('Error rate');

% Plot error rate
legend_names = [];
for a_prots = 1:2
    for b_prots = 1:2
        [prots, error_rate] = mylvq1(0.01, 1000, [a_prots b_prots], data, labels);
        
        figure(3); hold on;
        plot(1:length(error_rate), error_rate);
        legend_names = [legend_names; 'A: ' num2str(a_prots) ' and B: ' num2str(b_prots) ' prototypes'];
        
        figure(4);
        subplot(2, 2, (a_prots-1)*2 + b_prots); hold on;
        for d = 1:length(data)
            dp = data(d, :);
            [min_a, ~] = closest_prot(dp, prots, 1:a_prots);
            [min_b, ~] = closest_prot(dp, prots, a_prots+1:a_prots+b_prots);
            if min_a > min_b
                scatter(dp(:,1), dp(:,2), 10, 'b.');
            else
                scatter(dp(:,1), dp(:,2), 10, 'rs');
            end
        end
        scatter(prots(1:a_prots, 1), prots(1:a_prots, 2), 50, 'rd');
        scatter(prots(a_prots+1:end, 1), prots(a_prots+1:end, 2), 50, 'bo');
        title(['A: ' num2str(a_prots) ', B: ' num2str(b_prots) ' prototypes']);
    end
end

figure(3);
title(['Training error curve']);
legend(legend_names);
xlabel('Epoch');
ylabel('Error rate');