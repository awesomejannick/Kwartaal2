clear all;
load lab3_2.mat;

K=7;
samples=64;
data = lab3_2;
nr_of_classes = 4;

% Class labels
class_labels = floor( (0:length(data)-1) * nr_of_classes / length(data) );

% Sample the parameter space
result=zeros(samples);
for i=1:samples
  X=(i-1/2)/samples;
  for j=1:samples
    Y=(j-1/2)/samples;
    result(j,i) = KNN([X Y],K,data,class_labels);
  end
end

% Show the results in a figure
imshow(result,[0 nr_of_classes-1],'InitialMagnification','fit');
hold on;
title([int2str(K) '-NN, ' int2str(nr_of_classes) ' classes']);

% this is only correct for the first question
scaled_data=samples*data;
plot(scaled_data(  1:100,1),scaled_data(  1:100,2),'go');
plot(scaled_data(101:200,1),scaled_data(101:200,2),'r+');

y = zeros(20,1);
for k = 1:20
    count = 0;
    for i = 1:size(data,1)
        idxs = [(1:i-1), (i+1:size(data,1))];
        l2 = KNN(data(i,:), k, data(idxs,:), class_labels(idxs));
        if l2 ~= class_labels(i)
            count = count+1;
        end
    end
    y(k) = count / size(data,1);
end
figure;
plot(1:20, y);
xlabel("K");
ylabel("Error rate");
title("LOOCV");
disp(min(y));