%Empty workspace
clear all;
close all;

%Define settings
Pmax = 20;
Nmax = 20;
its = 100;

%Initialize results
results = zeros(Pmax, Nmax);
plotx = [];
ploty = [];
totals = [];

%Generate results
for P = 1:Pmax
    for N = 1:Nmax
        for i = 1:its
            if seqTraining(P,N,100)
                results(P, N) = results(P, N) + 1;
            end
        end
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
xlabel("P/N");
ylabel("Fraction of succesfull runs")

figure;
mesh(1:Pmax, 1:Nmax, results ./ its);
xlabel("Number of examples P");
ylabel("Number of features N");
zlabel("Fraction of succesfull runs");