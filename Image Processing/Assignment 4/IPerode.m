%Computes morphological erosion of img with structuring element SE
function out = IPerode(img, SE)
    %Erosion is the inverted dilation of the inverted image
    out = ~IPdilate(~img,SE);
end