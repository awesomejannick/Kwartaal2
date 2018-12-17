%Performs a hough transform on an edgemap
function [H, theta, rho] = myhough(edges)
    %Find all points belonging to an edge
    points = (find(edges==1))';
    r = zeros(length(points), 180);
    
    %Determine the angles used
    theta = -90:89;
    
    %Calculate distances
    for i = 1:length(points)
        point = [mod(points(i),size(edges,1)) floor(points(i)/size(edges,1))];
        r(i,:) = round(point(2)*cosd(theta) + point(1)*sind(theta));
    end
    
    %Create hough matrix
    rho = min(r,[],'all'):max(r,[],'all');
    r = r - min(r,[],'all') + 1;
    m = max(r,[],'all');
    H = zeros(m, 180);
    for t = 1:180
        H(:,t) = sum(r(:,t)==1:m);
    end
end