%Load input and get its edges
img = imread('Cameraman.tiff');
edges = edge(img);

%Perform hough transform with 2 implementations
H1 = hough(edges);
H2 = myhough(edges);

%Plot results
figure;
subplot(1,2,1);
imagesc(H1);
subplot(1,2,2);
imagesc(H2);