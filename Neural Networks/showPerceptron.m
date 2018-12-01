%Displays a 2D or 3D plot of a perceptron with the specified settings
function showPerceptron(P, N, nmax)
    %Try perceptrons until one is solved
    done = false;tries = 1000;
    while ~done && tries > 0
        [done, w, data, labels] = seqTraining(P, N, nmax);
        tries = tries - 1;
    end
    if ~done
        disp("No solvable perceptron could be found with these settings.");
        return;
    end
    
    figure;hold on;
    if N == 2 %Display 2D perceptron
        scatter(data(labels== 1, 1), data(labels== 1, 2), 25, 'b', 'filled');
        scatter(data(labels==-1, 1), data(labels==-1, 2), 25, 'r', 'filled');
        scatter(0, 0, 100, [0,0.3,0], 'filled');
        limx = xlim(gca);limy = ylim(gca);
        line([-100*w(2), 100*w(2)], [100*w(1), -100*w(1)], 'color', 'green');
        xlim(limx);ylim(limy);
        disp(dot(w, 2*[-w(2),w(1)]));
    elseif N == 3 %Display 3D perceptron
        scatter3(data(labels== 1, 1), data(labels== 1, 2), data(labels== 1, 3), 25, 'b', 'filled');
        scatter3(data(labels==-1, 1), data(labels==-1, 2), data(labels==-1, 3), 25, 'r', 'filled');
        scatter3(0, 0, 0, 100, [0,0.3,0], 'filled');
        x = xlim(gca);x = x([1,2,2,1]);
        y = ylim(gca);y = y([2,2,1,1]);
        w = w ./ norm(w);
        z = -(w(1)*x + w(2)*y) ./ w(3);
        patch(x,y,z, 'green', 'FaceAlpha', 0.8);
    else
        disp("This number of dimensions can't be displayed.");
    end
    legend('+ Class', '- Class', 'Origin', 'Decision boundary');
    title('Rosenblatt perceptron');
end