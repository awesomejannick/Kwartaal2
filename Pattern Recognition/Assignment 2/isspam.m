function p = isspam(ps,pns)
    a = 0.9*prod(ps);
    b = 0.1*prod(pns);
    evidence = a+b;
    p  =  a / evidence;
    np = b / evidence;
    r = a/b;
    
    disp('The nominator of spam is:');
    disp(a);
    disp('The nominator of not spam is:');
    disp(b);
    disp('The ratio between spam and non-spam is:');
    disp(r);
end