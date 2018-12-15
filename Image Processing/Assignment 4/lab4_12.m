%Reset workspace
close all;
clear all;

%Load input images
wire = imread('../images/wirebondmask.tif');
lincoln = imread('../images/lincoln.tif');
SE = logical([1,1,1;1,1,1;1,1,1]);

%Dilate and erode image
figure;
subplot(1,3,1);
imshow(wire);
title('Wire.tif');
subplot(1,3,2);
imshow(IPdilate(wire, SE));
title('Dilation of wire');
subplot(1,3,3);
imshow(IPerode(wire, SE));
title('Erosion of wire');

%Extract image
figure;
subplot(1,2,1);
imshow(lincoln);
title('Lincoln.tif');
subplot(1,2,2);
imshow(IPboundary(lincoln, SE));
title('Extracted boundaries');