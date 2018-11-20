close all;
clear all;

load('lab1_1.mat');
data = lab1_1;
N = size(data, 2);
max = 0; max2 = 0;
i1=0; i2=0; j1=0; j2=0;
for i = 1:N
    for j = 1:(i-1)
        c = correlation(data(:,i), data(:,j));
        disp(['The correlation between ' num2str(j) ' and ' num2str(i) ' is ' num2str(c)]);
        c = abs(c);
        if c > max
            max2 = max; i2 = i1; j2 = j1;
            max = c; i1 = i; j1 = j;
        elseif c > max2
            max2 = c; i2=i; j2=j;
        end
    end
end

figure;
scatter(data(:,i1), data(:,j1))
title(['The correlation between ' num2str(j1) ' and ' num2str(i1) ' is ' num2str(max)]);

figure;
scatter(data(:,i2), data(:,j2))
title(['The correlation between ' num2str(j2) ' and ' num2str(i2) ' is ' num2str(max2)]);