%2
function myhoughline(image, r, theta)
    %3    
    [x, y] = size(image);
    angle=pi*theta/180;
    %4
    if sin(angle)==0
        line([r, r], [0, y], 'Color', 'red')
    %5
    else
        disp([r/sin(angle), (r-y*cos(angle))/sin(angle)]);
        line([0, y], [r/sin(angle), (r-y*cos(angle))/sin(angle)], 'Color', 'red')
    end
%1
end