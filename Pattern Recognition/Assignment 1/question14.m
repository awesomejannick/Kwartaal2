test = load('testperson.mat');
test = test.iriscode;
%test(test==2)=1; %replaces all twos by ones for question 16
hd = zeros(1,20);
for i = 1:20
    person = load(sprintf('person%02d.mat', i));
    person = person.iriscode;
    for j = 1:20
        row = person(j, :);
        hd(i) = hd(i) + hamm(test, row);
    end
    hd(i) = hd(i) / 20;
end

disp(hd);
disp(['The most likely person is person ' num2str(find(hd==min(hd))) ' with hd = ' num2str(min(hd))]);