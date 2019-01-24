close all;
load('cluster_data.mat');

k = 2;
ts = [0.05 0.1 0.15 0.2 0.25];

figure; 
for i = 1:5
    subplot(3, 2, i); hold on;
    scatter(cluster_data(:, 1), cluster_data(:, 2), 20, 'b.');
    title(sprintf("T=%.2f", ts(i)));
    for a = 1:size(cluster_data, 1)
        for b = a:size(cluster_data, 1)
            x = cluster_data(a, :);
            y = cluster_data(b, :);
            if dist(x, y, k) < ts(i)
                plot([x(1) y(1)], [x(2) y(2)], 'color', 'black');
            end
        end
    end
end