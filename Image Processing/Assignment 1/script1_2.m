close all; 
clear all;
         
% Load trui image
trui = imread('../images/trui.tif');

% Stretch contrast of image
trui_stretched = IPcontraststretch(trui, 8);
imwrite(trui, 'output/trui.png');
imwrite(trui_stretched, 'output/trui_stretched.png');

% Plot the input image
figure;
colormap(gray(256));
imshow(trui);
title('trui')

% Plot the stretched image
figure;
colormap(gray(256));
imshow(trui_stretched);
title('trui\_stretched')

% Plot histograms of the original and the stretched image
figure;hold on;
histogram(trui);
histogram(trui_stretched);
title('histograms of trui and trui\_stretched');
legend('trui', 'trui\_stretched');
saveas(gcf, 'output/histogram.png');