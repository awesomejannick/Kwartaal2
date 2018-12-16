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
    title(['Original image']);
    
    for j = 1:5
        subplot(3,2,j+1);
        imshow(IPwaveletdenoise(mri, i, 50*j));
        title(['scale: ' num2str(i) ', threshold: ' num2str(j*50)]);
    end
    
    imshow(uint8(wdenoise(double(mri), i)));
end