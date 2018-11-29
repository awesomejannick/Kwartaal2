vs = [4 5 6; 6 3 9; 8 7 3; 7 4 8; 4 6 5];
mu = mean(vs);
disp('vs');
disp(vs);
disp('mu');
disp(mu);

covmat = zeros(3, 3);
for i = 1: size(vs, 2)
   for j = 1: size(vs, 2)
       c = 0;
       for k = 1: size(vs, 1)
            c = c + (vs(k, i) - mu(i)) * (vs(k, j) - mu(j));
       end 
       covmat(i, j) = c / (size(vs, 1));
   end 
end

disp('covmat');
disp(covmat);

sigma = cov(vs);

x = [5 5 6; 3 5 7; 4 6.5 1];
disp('x');
disp(x);
m = mvnpdf(x, mu, covmat);
format long;
disp(m);