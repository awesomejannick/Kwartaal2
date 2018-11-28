%Determines the score a player of random walk has after turns
function score = randomWalk(turns)
    score = 0;
    for i = 1:turns
        score = score + round(rand());
    end
end