%Extracts the boundaries of img using SE
function out = IPboundary(img, SE)
    out = IPdilate(img, SE) - img;
end