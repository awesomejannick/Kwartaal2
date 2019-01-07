%Performs opening by reconstruction on image f
function out = IPopen_reconstruction(f, se)
    out = IPrecon_by_dilation(IPerode(f, se), f, se);
end