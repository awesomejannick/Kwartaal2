function mask = question3(f, x, y, r)
    [rows, cols] = size(f);
    [xMat, yMat] = meshgrid(1:cols, 1:rows);
    mask = zeros(size(f));
    for i = 1:length(x)
        dist = sqrt((xMat-x(i)) .^ 2 + (yMat-y(i)) .^ 2);
        mask(dist <= r) = 1;
    end
    figure;
    imagesc(mask);
end