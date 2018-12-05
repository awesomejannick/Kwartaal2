close all;
clear all;

std = 4;
figure; hold on;

for d = [0,1,1.85,2,3,4]
    x = [];
    y = [];
    m2 = std*d;
    for i = -19:0.5:25
        p1 = normcdf([-20, i], 0, std);
        p1 = 1 - p1(2);

        p2 = normcdf([-20, i], m2, std);
        p2 = 1 - p2(2);

        x = [x, p1];
        y = [y, p2];
    end
        
    disp([x(length(x)), y(length(y))]);
    plot(x,y);
end

scatter([0.44], [0.955], 'bd');
legend('0', '1', '1.85', '2', '3', '4', '(0.44,0.955)');
xlabel('False positive rate');
ylabel('True positive rate');
title('ROC curves');