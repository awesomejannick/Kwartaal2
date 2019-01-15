close all;
clear all;

load("kmeans1.mat");
tmax = 10;

% Q 4-5
iters = 10;
kmax = 6;
J = zeros(1, kmax);
for k = 1:kmax
    for i = 1:iters
        [~, error, ~] = mykmeans(kmeans1, k, tmax, 0);
        J(k) = J(k) + sum(error);
    end
end
d = 2;
J = J ./ iters;
R = J(1) * [1:kmax].^(-2/d);
D = R./J;
[~, k_opt] = max(D);

figure;
subplot(2, 1, 1); hold on;
plot(J);
plot(R);
title("Average quantization error")
xlabel("K");
legend(["Quantization error" "Reference function"]);
subplot(2, 1, 2); hold on;
plot(D);
scatter(k_opt, D(k_opt), 20, 'ro');
xlabel("K");
ylabel("D");
legend(["D" "Optimum of D"]);