close all;

load('cluster_data.mat');
%func = "single";
%func = "complete";
func = "average";
L = linkage(cluster_data, func);
T = cluster(L, 'maxclust', 4);
D = dendrogram(L);
title("Dendrogram of average linkage algorithm");

% Plot results
figure; hold on;
if func == "single"
    title("Single Linkage Algorithm");
else if func == "complete"
        title("Complete Linkage Algorithm");
    else
        title("Average Linkage Algorithm");
    end
end

ts = ['b' 'r' 'k' 'g'];
leg = [];
for i = 1:k
    scatter(cluster_data(T==i, 1), cluster_data(T==i, 2), 50, [ts(i) '.']);
    p = sum(cluster_data(T==i, :)) / size(cluster_data(T==i, :), 1);
    scatter(p(1), p(2), 50, [ts(i) 'o']);
    leg = [leg sprintf("Data class %d", i) sprintf("Prototype class %d", i)];
end
legend(leg);