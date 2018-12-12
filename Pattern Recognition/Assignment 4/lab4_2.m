img = imread('Cameraman.tiff');
edges = edge(img);
H1 = hough(edges);
H2 = myhough(edges);
figure;
subplot(1,2,1);
imagesc(H1);
subplot(1,2,2);
imagesc(H2);