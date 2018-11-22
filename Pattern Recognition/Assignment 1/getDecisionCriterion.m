function d = getDecisionCriterion(D, rate)
    mu = mean(D);
    s = std(D);
    d1 = 0;
    d2 = 1;
    
    while d2 > d1+0.01
        d = (d2+d1)/2;
        p = normcdf([d 1], mu, s);
        if p(1) > rate
            d2 = d;
        else
            d1 = d;
        end
    end
    
    d = (d2+d1)/2;
end