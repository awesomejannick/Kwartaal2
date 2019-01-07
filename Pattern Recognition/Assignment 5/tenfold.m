% Reset workspace
clear all;
close all;

% Load class data
load('data_lvq_A.mat')
load('data_lvq_B.mat')

% Initialize variables
s = 200;
data = zeros(s,2);
labels = ones(s,1);
labels(2:2:end) = 2;
data(1:2:end,:) = matA(randperm(s/2),:);
data(2:2:end,:) = matB(randperm(s/2),:);
figure;hold on;
errors = [];

% Compute each fold
for i = 1:10
    test  = s*(i-1)/10+1:s*i/10;
    train = [1:s*(i-1)/10 s*i/10+1:s];
    [prots, error] = mylvq1(0.01, 1000, [4 4], data(train,:),labels(train));
    bar(i,error(end));
    errors = [errors ; convertCharsToStrings([num2str(round(error(end)*100)) '%'])];
end

xlabel("Fold");
ylabel("Error rate");
title("10-fold cross validation with 4 prototypes per class");
legend(errors);