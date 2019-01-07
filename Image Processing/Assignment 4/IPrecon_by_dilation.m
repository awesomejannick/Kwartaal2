%Performs reconstruction by dilation on image f
function out = IPrecon_by_dilation(f, mask, se)
    out = IPgeodilate(f, mask, se);
    while ~isequal(f, out)
        f = out;
        out = IPgeodilate(f, mask, se);
    end
    out = f;
end

%Performs geodesic dilation on image f
function out = IPgeodilate(f, mask, se)
    out = IPdilate(f, se) & mask;
end