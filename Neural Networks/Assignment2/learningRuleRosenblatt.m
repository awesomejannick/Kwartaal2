%Empty workspace
close all;

%Define settings
Rmin = 0;
Rmax = 8;
Pmax = 40;
Nmax = 40;
epochs = 150;
its = 1000;

% Show example solution of the algorithm
N = 2; P = 10;
wstar = randn(1, N);
wstar = wstar * sqrt(N) / norm(wstar);
[w, data, labels] = rosenblatt(P, N, epochs, wstar);
% Show data
figure; hold on;
scatter(data(labels==1, 1), data(labels==1, 2), 15, 'bo');
scatter(data(labels==-1, 1), data(labels==-1, 2), 15, 'ro');
scatter(0, 0, 25, 'go');
% Show w and wstar
th = 90*pi/180 ;
R = [cos(th) -sin(th) ;sin(th) cos(th)];
w = w/norm(w)*5 * R;
wstar = wstar/norm(wstar)*5 * R;
plot([-wstar(1) wstar(1)], [-wstar(2) wstar(2)], 'color', 'red');
plot([w(1) -w(1)], [w(2) -w(2)], 'color', 'blue');
title(["Generalization error: " num2str(generalization_error(w, wstar))]);
legend(["label=1"; "label=-1"; "origin"; "wstar"; "w"]);

%Initialize results
results = ones(Nmax, Pmax);
plotx = [];
ploty = [];
totals = [];

%Generate results in parallel
parfor N = 1:Nmax
    generalization_errors = zeros(Pmax, 1);
    PR = min(floor(Rmin*N), Pmax);
    for P = 1:PR
        generalization_errors(P) = its;
    end
    for P = (PR+1):min(Rmax*N, Pmax)
        for i = 1:its
            wstar = randn(1, N);
            wstar = wstar * sqrt(N) / norm(wstar);
            [w, data, labels] = rosenblatt(P, N, epochs, wstar);
            generalization_errors(P) = generalization_errors(P) + generalization_error(w, wstar);
        end
    end
    results(N, :) = generalization_errors;
end

disp('Done calculating');

%Order results by ratio P/N
for P = 1:Pmax
    for N = 1:Nmax
        r = P/N;
        if ismember(r, plotx)
            i = plotx == r;
            ploty(i) = ploty(i) + results(N, P);
            totals(i) = totals(i) + its;
        else
            plotx = [plotx, r];
            ploty = [ploty, results(N, P)];
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
ylabel("Average generalization error");
title("Generalization error of the Rosenblatt algorithm");

figure;hold off;
mesh(1:Pmax, 1:Nmax, results ./ its);
xlabel("Number of examples P");
ylabel("Number of features N");
zlabel("Average generalization error");
title("Generalization error of the Rosenblatt algorithm");
xlim([0 Pmax]);
ylim([0 Nmax]);