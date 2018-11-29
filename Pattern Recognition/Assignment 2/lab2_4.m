%Clear up workspace
close all;
clear all;

%Determine scores of random walk
n = 1000000;
scores = zeros(1,n);
for i = 1:n
    scores(i) = randomWalk(100);
end

%Plot scores in histogram
figure;hold on;
histogram(scores);
xlim([0 100]);
title('The scores of 1000000 players of random walk (100 turns)');
xlabel('Score');
ylabel('Number of players');