k1 = load('lab3_3_cat1.mat'); k1 = k1.x_w1;
k2 = load('lab3_3_cat2.mat'); k2 = k2.x_w2;
k3 = load('lab3_3_cat3.mat'); k3 = k3.x_w3;
u = [0.5, 1.0, 0.0];
v = [0.31, 1.51, -0.5];
w = [-1.7, -1.7, -1.7];
h = 1;
disp(GaussianSphere(u, k1, 1));
disp(GaussianSphere(u, k2, 1));
disp(GaussianSphere(u, k3, 1));
disp(GaussianSphere(v, k1, 1));
disp(GaussianSphere(v, k2, 1));
disp(GaussianSphere(v, k3, 1));
disp(GaussianSphere(w, k1, 1));
disp(GaussianSphere(w, k2, 1));
disp(GaussianSphere(w, k3, 1));