close all;
clear all;

% Q1
c = imread('Cameraman.tiff');
% Q2
edges = edge(c, 'canny');
hc = hough(edges);
% Q3
figure;
imagesc(hc);
title('s2775832, s');
xlabel('\phi (degrees)');
ylabel('\rho');
ylim([0 725]);
% Q4
hcTc = hc;
hcTc(hcTc < 0.999 * max(hcTc(:))) = 0;

figure;
imagesc(hcTc);
title('Top 0.1% s2775832, s');
xlabel('\phi (degrees)');
ylabel('\rho');
ylim([0 725]);

% Q5
peaks = houghpeaks(hc, 5);

figure; hold on;
imagesc(hc);
title('s2775832, s');
xlabel('\phi (degrees)');
ylabel('\rho');
disp(peaks(:, 1));
scatter(peaks(:, 2), peaks(:, 1), 50, 'rO');
ylim([0 725]);
xlim([0 180]);

% Q6
[H, T, R] = hough(edges);
P = houghpeaks(H, 15);
x = T(P(:, 2));
y = R(P(:, 1));
figure; hold off;
colormap('gray');
imagesc(c);hold on;
disp(P(1,:));
myhoughline(c, y(1), x(1));
title('s2775832, s');
