close all;
clear all;

%Fix random number seed
rng(3.14159);

%Determine hamming distances and decision criterion
rate = 0.0005;
[S, D] = computeSets(10000);
d = getDecisionCriterion(D, rate);

%Calculate mean, std and var of both sets
muS = mean(S);
sS = std(S);
vS = var(S);
muD = mean(D);
sD = std(D);
vD = var(D);

%Plot histograms, normal distributions and disicion boundary
figure;
hold on;

edges = (-1/60):(1/30):(59/60);
hist1 = histogram(S, edges);
hist2 = histogram(D, edges);

xn = 300;
x = 0:(1/xn):1;
y1 = normpdf(x, muS, sS);
y1 = max(hist1.BinCounts) / y1(round(muS*xn)) * y1;
y2 = normpdf(x, muD, sD);
y2 = max(hist2.BinCounts) / y2(round(muD*xn)) * y2;
plot(x, y1, x, y2, [d d], [0 max([hist1.BinCounts hist2.BinCounts])]);

xlim([0 1]);
xlabel('Normalized Hamming Distance');
ylabel('Number of Samples');
legend('Same Person', 'Different Person', 'Same Person', 'Different Person', 'Decision boundary');
title('Hamming distances of iris samples');

%Display miscelaneous data
disp(['mean(S) = ' num2str(muS) ', var(S)' num2str(vS) ', std(S) = ' num2str(sS)]);
disp(['mean(D) = ' num2str(muD) ', var(D)' num2str(vD) ', std(D) = ' num2str(sD)]);
disp(['The number of binary degrees of freedom is ' num2str(muD*(1-muD) / vD)]);

rate2 = normcdf([0 d], muS, sS);
rate2 = 1 - rate2(2);
disp(['The decision criterium is ' num2str(d)]);
disp(['The false acceptance rate is ' num2str(rate) ' and the false rejection rate is ' num2str(rate2)]);