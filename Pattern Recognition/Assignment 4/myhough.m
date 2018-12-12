function [H, theta, rho] = myhough(edges)
    points = (find(edges==1))';
    r = zeros(length(points), 180);
    theta = -90:89;
    
    for i = 1:length(points)
        point = [mod(points(i),size(edges,1)) floor(points(i)/size(edges,1))];
        r(i,:) = round(point(2)*cosd(theta) + point(1)*sind(theta));
    end
    
    rho = min(r,[],'all'):max(r,[],'all');
    r = r - min(r,[],'all') + 1;
    m = max(r,[],'all');
    H = zeros(m, 180);
    for t = 1:180
        H(:,t) = sum(r(:,t)==1:m);
    end
end