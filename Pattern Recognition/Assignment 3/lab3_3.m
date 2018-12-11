k1 = load('lab3_3_cat1.mat'); k1 = k1.x_w1;
k2 = load('lab3_3_cat2.mat'); k2 = k2.x_w2;
k3 = load('lab3_3_cat3.mat'); k3 = k3.x_w3;
u = [0.5, 1.0, 0.0];
v = [0.31, 1.51, -0.5];
w = [-1.7, -1.7, -1.7];
for i = 1:2
    u1 = GaussianSphere(u, k1, i);
    u2 = GaussianSphere(u, k2, i);
    u3 = GaussianSphere(u, k3, i);
    v1 = GaussianSphere(v, k1, i);
    v2 = GaussianSphere(v, k2, i);
    v3 = GaussianSphere(v, k3, i);
    w1 = GaussianSphere(w, k1, i);
    w2 = GaussianSphere(w, k2, i);
    w3 = GaussianSphere(w, k3, i);

    disp([u1/(u1+u2+u3) u2/(u1+u2+u3) u3/(u1+u2+u3)])
    disp([v1/(v1+v2+v3) v2/(v1+v2+v3) v3/(v1+v2+v3)])
    disp([w1/(w1+w2+w3) w2/(w1+w2+w3) w3/(w1+w2+w3)])
end

data = [k1;k2;k3];
labels = [ones(10,1),ones(10,1)+1,ones(10,1)+2];
for k = [1,5]
    disp([KNN(u,k,data,labels) KNN(v,k,data,labels) KNN(w,k,data,labels)]);
end