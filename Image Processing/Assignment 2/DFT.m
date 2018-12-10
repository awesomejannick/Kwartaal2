function out = DFT(im, inv)
    N = size(im);
    disp(N);
    out = zeros(N(1), N(2));
    inv = exist('inv', 'var');

    for i = 0:(N(1)-1)
        P = zeros(N(2),1);
        for j = 0:(N(2)-1)
            for k = 0:(N(1)-1)
                if inv
                    P(j+1) = P(j+1) + im(k+1,j+1)*real(exp(1i*2*pi*i*k/N(1)));
                else
                    P(j+1) = P(j+1) + im(k+1,j+1)*real(exp(-1i*2*pi*i*k/N(1)));
                end
            end
        end
        for j = 0:(N(2)-1)
            for k = 0:(N(1)-1)
                if inv
                    out(i+1,j+1) = out(i+1,j+1) + P(k+1)*real(exp(1i*2*pi*j*k/N(2)));
                else
                    out(i+1,j+1) = out(i+1,j+1) + P(k+1)*real(exp(-1i*2*pi*j*k/N(2)));
                end
            end
        end
    end
    
    out = real(out ./ sqrt(prod(N)));
end