%Reset workspace
close all;
clear all;

%Initialize data
chars = imread('../images/characters.tif');
D0 = [0.5,1,3,8,10,20,50,100];
c = 3;

%Show original image
figure;hold on;
colormap(gray(256));
subplot(ceil((length(D0)+1) / c), c, 1);
imshow(chars);
title('characters.tif');

%Show filtered images for several values of D0
for i = 1:length(D0)
    H = IPgaussian(D0(i), 80, 80);
    r = IPftfilter(chars, H);
    subplot(ceil((length(D0)+1) / c), c, i+1);
    imshow(r);
    title(['D0=' num2str(D0(i)) ', M=80, N=80']);
end