function out = KNN(c, k, data, class_labels)
    dists = sqrt(sum(((data - c).^2)'));
    [dists, order] = sort(dists);
    class_labels = class_labels(order);
    out = mode(class_labels(1:k));
end