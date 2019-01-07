%Performs morphological opening on img
function out = IPopening(img, SE)
    out = IPdilate(IPerode(img, SE), SE);
end