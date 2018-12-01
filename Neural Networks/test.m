%Empty workspace
close all;

%Define settings
Rmin = 1;
Rmax = 5;
Pmax = 40;
Nmax = 40;
epochs = 50;
its = 1000;

%Initialize results
results = ones(Pmax, Nmax);
plotx = [];
ploty = [];
totals = [];

%Generate results in parallel
parfor N = 1:Nmax
    success = zeros(Pmax, 1);
    PR = min(floor(Rmin*N), Pmax);
    for P = 1:PR
        success(P) = its;
    end
    for P = (PR+1):min(Rmax*N, Pmax)
        for i = 1:its
            success(P) = success(P) + seqTraining(P,N,epochs);
        end
    end
    results(:, N) = success;
end

%Order results by ratio P/N
for P = 1:Pmax
    for N = 1:Nmax
        r = P/N;
        if ismember(r, plotx)
            i = plotx == r;
            ploty(i) = ploty(i) + results(P, N);
            totals(i) = totals(i) + its;
        else
            plotx = [plotx, r];
            ploty = [ploty, results(P, N)];
            totals = [totals, its];
        end
    end
end

%Plot results
figure;hold on;
[plotx, order] = sort(plotx);
ploty = ploty ./ totals;
ploty = ploty(order);
plot(plotx, ploty, 'color', 'black');
xlim([0, Rmax]);
xlabel("P/N");
ylabel("Fraction of succesfull runs");
title("Succes rate of Rosenblatts perceptron");

figure;hold off;
mesh(1:Pmax, 1:Nmax, results ./ its);
xlabel("Number of examples P");
ylabel("Number of features N");
zlabel("Fraction of succesfull runs");
title("Succes rate of Rosenblatts perceptron");
xlim([0 Pmax]);
ylim([0 Nmax]);