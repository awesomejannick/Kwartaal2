mu1 = [3 5];
covmat1 = [1 0; 0 4];
mu2 = [2 1];
covmat2 = [2 0; 0 1];

[x, y] = meshgrid(-20:0.1: 20);
z1 = zeros(size(x, 1));
z2 = zeros(size(x, 1));
z3 = zeros(size(x, 1));
z4 = zeros(size(x, 1));
for i = 1: size(x, 1)
    for j = 1: size(x, 2)
        z1(i, j) = log(mvnpdf([x(i, j) y(i, j)], mu1, covmat1));
        z2(i, j) = log(mvnpdf([x(i, j) y(i, j)], mu2, covmat2));
    end
end

figure;hold on;
mesh(x, y, z1);
mesh(x, y, z2);
title('2D Gaussian Mesh');