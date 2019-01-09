function e = generalization_error(w, wstar)
    e = 1/pi * acos(dot(w, wstar) / (norm(w)*norm(wstar)));
end