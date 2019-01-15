close all;
clear all;

load("kmeans1.mat");
tmax = 10;

% Q 1-3
ks = [2 4 8];
graph_type = ["r+" "bs" "gd" "m*" "rx" "b^" "kv" "ko"];
hor_plots = 3;
for n = 1:length(ks)
    k = ks(n);
    % Get results
    [p, distances, closest_prot] = mykmeans(kmeans1, k, tmax, 0);
    ind = size(p, 1) - k + 1:size(p, 1);

    % Plot data
    figure(1); 
    subplot(ceil(length(ks)/hor_plots), hor_plots, n); hold on;
    title(sprintf("Kmeans with k=%s", num2str(n)));
    for i = 1:k
        scatter(kmeans1(closest_prot==i, 1), kmeans1(closest_prot==i, 2), 5, graph_type(i));
        scatter(p(i, 1), p(i, 2), 25, graph_type(i));
        scatter(p(ind(i), 1), p(ind(i), 2), 40, "ko", 'MarkerFaceColor', 'flat');
    end
    
    % Plot prototypes and arrows
    figure(2);
    subplot(ceil(length(ks)/hor_plots), hor_plots, n); hold on;
    scatter(kmeans1(:, 1), kmeans1(:, 2), 4, "b.");
    leg = [];
    plt = [];
    for i = 1:size(p, 1) / k-1
        new = i*k + 1:(1+i)*k;
        pl = scatter(p(new,1), p(new, 2), 40, graph_type(1+mod(i, size(graph_type, 2))));
        leg = [leg;sprintf("Iteration %s", num2str(i))];
        plt = [plt;pl];
        for j = new
            plot_arrow(p(j-k, 1), p(j-k, 2), p(j, 1), p(j, 2));
        end
    end
    legend(plt, leg);
    title(sprintf("k=%s, quantization error=%s", num2str(k), num2str(sum(distances))));
end