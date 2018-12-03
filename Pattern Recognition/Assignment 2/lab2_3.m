mu = [3 4];
covmat = [1 0; 0 2];
disp(mu);
disp(covmat);

% ---- 1

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

% ---- 2
stddev = sqrt([covmat(1,1), covmat(2,2)]);
disp(stddev);

qs = [10 10; 0 0; 3 4; 6 8];

for i = 1: size(qs, 1)
    a = sqrt((qs(i,:) - mu)*inv(covmat)*(qs(i,:)-mu)');
    disp([qs(i,:), a]);
end

x = mvnrnd(mu,covmat,100000);
disp(sqrt(mahal(qs,x)));