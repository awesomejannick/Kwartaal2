%Computes KNN for point c with k neighbours
function out = KNN(c, k, data, class_labels)
    dists = sqrt(sum((data - c).^2, 2));
    [~, order] = sort(dists);
    class_labels = class_labels(order);
    out = mode(class_labels(1:k));
end