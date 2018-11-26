% Computes the normalized hamming distance between 2 rows
function h = hamm(row1, row2)
    h = 0;
    for i = 1:length(row1)
        if row1(i) == 2 || row2(i) == 2
            h = h + 0.5; %unknown value => 50%chance of match
        else
            h = h + abs(row1(i) - row2(i));
        end
    end
    h = h / length(row1);
end