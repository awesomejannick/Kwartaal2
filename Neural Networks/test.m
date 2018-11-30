%Empty workspace
clear all;
close all;

%Define settings
Rmin = 1.2;
Rmax = 5;
Pmax = 50;
Nmax = 50;
epochs = 50;
its = 1000;

%Initialize results
results = ones(Pmax, Nmax) .*10;
plotx = [];
ploty = [];
totals = [];

%Generate results in parallel
parfor N = 1:Nmax
    success = zeros(Pmax, 1);
    for P = 1:min(ceil(Rmin*N)-1, Pmax)
        success(P) = its;
    end
    for P = ceil(Rmin*N):min(Rmax*N, Pmax)
        for i = 1:its
            success(P) = success(P) + seqTraining(P,N,epochs);
        end
    end
    results(:, N) = success;
end

%Order results by ratio P/N
for P = 1:Pmax
    for N = 1:Nmax
        if ismember(P/N, plotx)
            ploty(plotx == P/N) = ploty(plotx == P/N) + results(P, N);
            totals(plotx == P/N) = totals(plotx == P/N) + its;
        else
            plotx = [plotx, P/N];
            ploty = [ploty, results(P, N)];
            totals = [totals, its];
        end
    end
end

%Plot results
figure;
[plotx, order] = sort(plotx);
ploty = ploty ./ totals;
ploty = ploty(order);
plot(plotx, ploty);
xlim([0, Rmax]);
xlabel("P/N");
ylabel("Fraction of succesfull runs")
title("Succes rate of Rosenblatts perceptron");

figure;
mesh(1:Pmax, 1:Nmax, results ./ its);
xlabel("Number of examples P");
ylabel("Number of features N");
zlabel("Fraction of succesfull runs");
title("Succes rate of Rosenblatts perceptron");
xlim([0 Pmax]);
ylim([0 Nmax]);