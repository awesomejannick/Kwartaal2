%Reset workspace
close all;
clear all;

%Load input images
bubbles = imread('../images/bubbles.tif');
bubbles = bubbles(end-99:end, end-99:end);
board = imread('../images/cktboard.tif');
board = board(end-99:end, end-99:end);
cereal = imread('../images/cereal.tif');
cereal = cereal(end-99:end, end-99:end);

%Perform statistical texture measure
[M1,D1,R1,S1,U1,E1] = IPtexturemeasures(bubbles);
[M2,D2,R2,S2,U2,E2] = IPtexturemeasures(board);
[M3,D3,R3,S3,U3,E3] = IPtexturemeasures(cereal);

figure;
subplot(1,3,1);
imshow(bubbles);
title('bubbles');
subplot(1,3,2);
imshow(board);
title('board');
subplot(1,3,3);
imshow(cereal);
title('cereal');

Name = {'Bubbles';'Board';'Cereal'};
Mean = [M1; M2; M3];
Std = [D1; D2; D3];
R = [R1; R2; R3];
Skewness = [S1; S2; S3];
Uniformity = [U1; U2; U3];
Entropy = [E1; E2; E3];
T = table(Name, Mean, R, Skewness, Uniformity, Entropy);
disp(T);