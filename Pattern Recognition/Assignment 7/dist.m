function d = dist(a, b, k)
    d = (sum(abs(a-b).^k))^(1/k);
end