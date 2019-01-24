x = [0 0; 2 3; 1 4; 4 2; 3 0];
scatter(x(:, 1), x(:, 2));
calcJE(x, [1 2 3], [4 5])
calcJE(x, [2 3 5], [1 4])
calcJE(x, 4, [1 2 3 5])
calcJE(x, [3 5], [1 2 4])