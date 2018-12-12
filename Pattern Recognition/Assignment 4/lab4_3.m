close all;clear all;

% Q2
chess = imread('chess.jpg');
l = rgb2gray(chess);
BW = edge(l, 'canny');
figure;hold on;
[H, T, R] = hough(BW);
P = houghpeaks(H, 15, 'threshold', ceil(0.3*max(H(:))));
x = T(P(:, 2));
y = R(P(:, 1));
% Q3
imagesc(H, 'XData', T, 'YData', R);
plot(x, y, 's', 'color', 'white');
xlim([-90 90]);
ylim([-300 490]);
% Q4
figure; hold off;
imagesc(chess);
for i = 1:size(x, 2)
    myhoughline(chess, y(i), x(i));
end