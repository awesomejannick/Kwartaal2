mu = [3 4];
covmat = [1 0; 0 2];
disp(mu);
disp(covmat);

[x, y] = meshgrid(-10:0.1: 10);
z = zeros(size(x, 1));
for i = 1: size(x, 1)
    for j = 1: size(x, 2)
        z(i, j) = mvnpdf([x(i, j) y(i, j)], mu, covmat);
    end
end

figure;
m = mesh(x, y, z);
title('2D Gaussian Mesh');

disp(z);
disp(mahal(z, [10 10]));