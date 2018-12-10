%Perform frequency domain filtering on image x with mask H
function y = IPftfilter(x,H)
    H = rot90(H,2);
    
    %Pad image and mask to same size
    s = size(x) + size(H) - 1;
    xp = x; xp(s(1),s(2)) = 0;
    Hp = H; Hp(s(1),s(2)) = 0;
    Hp = double(Hp); xp = double(xp);
    
    %Perform multiplication in frequency domain
    y = ifft2(fft2(Hp) .* fft2(xp));
    
    %Remove padding
    y = uint8(real(y));
    b = ceil((s - size(x)) / 2);
    y = y(b(1):s(1)-b(1), b(2):s(2)-b(2));
end