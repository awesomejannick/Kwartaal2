figure;hold on;
x = -10:0.1:25;
y1 = normpdf(x, 5, 4);
y2 = normpdf(x, 7, 4);

plot(x, y1, x, y2);
line([10, 10], [0, 0.15]);

p1 = normcdf([0, 10], 5, 4);
p1 = 1 - p1(2);

p2 = normcdf([0, 10], 7, 4);
p2 = 1 - p2(2);

disp([p1 / (p1+p2), p2 / (p1+p2)]);

disp(abs(7-5)/sqrt(4));

a = load('lab3_1.mat', 'outcomes');
a = a.outcomes;

h = 0;
fa = 0;

for i = 1:size(a,1)
    h = h + (a(i,1) && a(i,2));
    fa = fa + (~a(i,1) && a(i,2));
end

disp(h/size(a,1));
disp(fa/size(a,1));