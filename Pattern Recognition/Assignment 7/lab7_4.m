close all;

X = importdata('provinces.mat');
X = zscore(X);
Y = pdist(X,'Euclidean');
D = squareform(Y);