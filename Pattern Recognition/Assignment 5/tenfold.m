s = 200;
data = zeros(s,2);
labels = zeros(s,1);
labels(2:2:end) = 1;
data(1:2:end,:) = matA(randperm(s/2),:);
data(2:2:end,:) = matB(randperm(s/2),:);
figure;hold on;
for i = 1:10
    test  = s*(i-1)/10+1:s*i/10;
    train = [1:s*(i-1)/10 s*i/10+1:s];
    [prots error] = mylvq1(0.001, 1000, 4, data(train,:),labels(train));
    bar(i,error);
end