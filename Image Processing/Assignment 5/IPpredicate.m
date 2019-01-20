%Defines a region predicate to distinguish a tiger from the sky
function flag = IPpredicate(region)
    %Preprocess input region
    region = region(:);
    region = double(region(region > 0));
    
    %Distinguish regions based on mean and standard deviation
    if mean(region) > 100 && std(region) < 4
        flag = true;
    else
        flag = false;
    end
end