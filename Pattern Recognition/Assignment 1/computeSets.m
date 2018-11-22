function [S,D] = computeSets(N)
    S = zeros(1, N);
    D = zeros(1, N);

    % Set S:
    data = load(sprintf('person%02d.mat', rand20()));
    for i = 1:N
        row1 = data.iriscode(rand20(),:);
        row2 = data.iriscode(rand20(),:);
        S(i) = hamm(row1, row2);
    end

    % Set D:
    for i = 1:N
        while true
            a = rand20();
            b = rand20();
            if a ~= b
                break;
            end
        end
        data = load(sprintf('person%02d.mat', a));
        row1 = data.iriscode(rand20(),:);
        data = load(sprintf('person%02d.mat', b));
        row2 = data.iriscode(rand20(),:);
        D(i) = hamm(row1, row2);
    end
end

% Computes a random integer from 1 to 20
function r = rand20()
    r = floor(rand()*20 + 1);
end