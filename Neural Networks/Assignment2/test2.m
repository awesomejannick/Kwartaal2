%Empty workspace
close all;

%Define settings
Rmin = 0;
Rmax = 40000;
Pmax = 10;
Nmax = 10;
epochs = 150;
its = 1000;

%Initialize results
results = ones(Pmax, Nmax);
plotx = [];
ploty = [];
totals = [];

%Generate results in parallel
parfor N = 1:Nmax
    wstar = randn(N, 1);
    wstar = wstar * sqrt(N) / norm(wstar);
    
    generalization_errors = zeros(Pmax, 1);
    PR = min(floor(Rmin*N), Pmax);
    for P = 1:PR
        generalization_errors(P) = its;
    end
    for P = (PR+1):min(Rmax*N, Pmax)
        for i = 1:its
            [done, w, data, labels] = minover(P, N, epochs, wstar);
            generalization_errors(P) = generalization_errors(P) + generalization_error(w, wstar);
        end
    end
    results(:, N) = generalization_errors;
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