%Reset workspace
close all;
clear all;

%Load input image
mri = imread('../images/noisymri.tif');

%Display results
for i = 1:4
    figure;
    colormap('gray');
    subplot(3,2,1);
    imshow(mri);
    title('Original image');
    
    %Use IPwaveletdenoise for various parametes and add them to the subplot
    for j = 1:5
        subplot(3,2,j+1);
        t = 10*j;
        imshow(IPwaveletdenoise(mri, i, t));
        title(['scale: ' num2str(i) ', threshold: ' num2str(t)]);
    end
end