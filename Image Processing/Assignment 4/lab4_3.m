%Reset workspace
close all;
clear all;

%Load input images
angio = imread('../images/angio.tif');
angio_noise = imread('../images/angio_noise.tif');
SE = logical([1,1,1;1,1,1;1,1,1]);

%Compute opening and difference of image
angio_open = IPopening(angio_noise, SE);
angio_diff = angio ~= angio_open;
angio_recon = IPopen_reconstruction(angio_noise, SE);
angio_diff2 = angio ~= angio_recon;

%Plot results
figure;
subplot(3,2,1);
imshow(angio);
title('angio.tif');
subplot(3,2,2);
imshow(angio_noise);
title('angio with noise');
subplot(3,2,3);
imshow(angio_open);
title('opening of noisy angio');
subplot(3,2,4);
imshow(angio_diff);
title('difference between opening and original');
subplot(3,2,5);
imshow(angio_recon);
title('opening by reconstruction');
subplot(3,2,6);
imshow(angio_diff2);
title('difference between reconstruction and original');

disp(['The number of different elements is ' num2str(sum(angio_diff, 'all'))]);
disp(['The number of different elements is ' num2str(sum(angio_diff2, 'all'))]);