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

figure; hold on;
plot(J);
plot(R);
scatter(k_opt, J(k_opt), 20, 'bo');
scatter(k_opt, R(k_opt), 20, 'ro');
title(sprintf("Optimum at K=%s", num2str(k_opt)));
xlabel("K");
legend(["Quantization error J" "Reference function R"]);
figure; hold on;
plot(D);
scatter(k_opt, D(k_opt), 20, 'ro');
title(sprintf("Optimum at K=%s", num2str(k_opt)));
xlabel("K");
ylabel("D");
legend(["D" "Optimum of D"]);