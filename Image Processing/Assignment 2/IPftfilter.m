function y = IPftfilter(x,H)
    H = rot90(H,2);
    s = size(x) + size(H) - 1;
    xp = x; xp(s(1),s(2)) = 0;
    Hp = H; Hp(s(1),s(2)) = 0;
    y = DFT(DFT(Hp) .* DFT(xp), 1);
    y = y(2:(size(x,1)+1), 2:(size(x,2)+1));
end