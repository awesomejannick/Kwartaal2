%Clean up workspace
clear all;
close all;
format long;

%Set up normal distributions
mu1 = [3 5];
cov1 = [1 0; 0 4];
mu2 = [2 1];
cov2 = [2 0; 0 1];

%Initialize variables
[x, y] = meshgrid(-20:0.1: 20);
z1 = zeros(size(x, 1));
z2 = zeros(size(x, 1));
xp = -20:0.1:20;
yp = zeros(size(x, 1), 1);

%Compute probability density function and boundary coordinates
for i = 1: size(x, 1)
    for j = 1: size(y, 2)
        x1 = x(i,j);
        x2 = y(i,j);
        a = 1 / (2*pi*sqrt(det(cov1)));
        z1(i, j) = exp(-0.5*x1^2 + 3*x1 - 0.125*x2^2 + 1.25*x2 - (7.625-log(a)));
        
        a = 1 / (2*pi*sqrt(det(cov2)));
        z2(i, j) = exp(-0.25*x1^2 + x1 -0.5*x2^2 + x2 - (1.5-log(a)));
    end
    A = 0.375;
    B = 0.25;
    C = -0.25*xp(i)^2 + 2*xp(i) -6.47157359028;
    r = roots([A B C]);
    yp(i) = r(2);
end

%Plot distribution
figure;hold on;
mesh(x, y, z1);
mesh(x, y, z2);
title('2D Gaussian Mesh');

%Plot decision boundary
zp = zeros(length(xp), 1);
for i = 1:length(xp)
    a = 1 / (2*pi*sqrt(det(cov2)));
    zp(i) = exp(-0.25*xp(i)^2 + xp(i) -0.5*yp(i)^2 + yp(i) - (1.5-log(a))) + 0.003;
end
plot3(xp, yp, zp, 'LineWidth', 2, 'color', 'red');