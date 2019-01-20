%Reset workspace
close all;
clear all;

%Load input images
tiger = imread('../images/tiger.tif');
figure;
imshow(tiger);

%Apply the split-and-merge algorithm
figure;
for i = 1:4
    subplot(2,2,i);
    g = splitmerge(tiger, 2^i, @IPpredicate);
    imshow(g);
    title(['dim = ' num2str(2^i)]);
end