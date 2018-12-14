%Reset workspace
close all;
clear all;

%Load input image
mri = imread('../images/noisymri.tif');

%Display results
for i = 1:4
    figure;
    subplot(3,2,1);
    imagesc(mri);
    subplot(3,2,2);
    imagesc(IPwaveletdenoise(mri, i, 50));
    subplot(3,2,3);
    imagesc(IPwaveletdenoise(mri, i, 100));
    subplot(3,2,4);
    imagesc(IPwaveletdenoise(mri, i, 150));
    subplot(3,2,5);
    imagesc(IPwaveletdenoise(mri, i, 200));
    subplot(3,2,6);
    imagesc(IPwaveletdenoise(mri, i, 250));
end