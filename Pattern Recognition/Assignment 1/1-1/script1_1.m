%Clear workspace
close all;
clear all;

%Load data
load('lab1_1.mat');
data = lab1_1;
N = size(data, 2);
max = 0; max2 = 0;
i1=0; i2=0; j1=0; j2=0;
coeffs = zeros(N,N);

%Compute Cool Correlation Coefficients
for i = 1:N
    for j = 1:(i-1)
        c = correlation(data(:,i), data(:,j));
        coeffs(i,j) = c;
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


%Produce nice output
disp(coeffs);

figure;
scatter(data(:,j1), data(:,i1), 15, 'ro')
title(['The largest correlation is ' num2str(max)]);
xlabel(['feature ' num2str(j1)])
ylabel(['feature ' num2str(i1)])

figure;
scatter(data(:,j2), data(:,i2), 20, 'gs')
title(['The second largest correlation is ' num2str(max2)]);
xlabel(['feature ' num2str(j2)])
ylabel(['feature ' num2str(i2)])