close all;
clear all;

load("kmeans1.mat");
tmax = 10;

% Q 1-3
figure; 
ks = [2 4 8];
graph_type = ["bd" "rd" "gd" "kd" "bo" "ro" "go" "ko"];
hor_plots = 3;
for n = 1:length(ks)
    k = ks(n);
    % Get results
    [p, distances, closest_prot] = mykmeans(kmeans1, k, tmax);
    ind = size(p, 1) - k + 1:size(p, 1);

    % Plot data
    subplot(ceil(length(ks)/hor_plots), hor_plots, n); hold on;
    for i = 1:k
        scatter(kmeans1(closest_prot==i, 1), kmeans1(closest_prot==i, 2), 5, graph_type(i));
        scatter(p(i, 1), p(i, 2), 25, graph_type(i));
    end
    % Plot prototypes and arrows
    for i = 1:size(p, 1) / k-1
        new = i*k + 1:(1+i)*k;
        scatter(p(new,1), p(new, 2), 25, 'ro');
        for j = new
            plot_arrow(p(j-k, 1), p(j-k, 2), p(j, 1), p(j, 2));
        end
    end
    title(["k=" num2str(k) ", quantization error=" num2str(sum(distances))]);
end