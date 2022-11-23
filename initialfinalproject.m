data = readmatrix("initialRAWdata.dat");
dininghall = data(:,1);
day = data(:,2);
meal = data(:,3);
nomeat = data(:,6);
busy = data (:,7);
dimension = size(data);
% want to know the total size of our data
% need to create a while loop which will check the day and create a vector
% based off of the day
sunday = [1;
    1];
% initializing sunday matrix
counter = 1;
for i = 1:dimension(1,1)
    if data(i,2) == 1
        % when the day is sunday
        sunday(counter,1) = data(i,4)
        counter = counter +1;
    end
end
function [x,y] = sort(col1,data1,day2)
for i = 1:dimension(1,1)
    if data(i,col1) == day2
        % when the day is sunday
        sunday(counter,1) = data(i,4)
        counter = counter +1;
    end
end
end
% ratingavg = sum(rating,dimension(1,1));
% repeat this function but with a different vector to find the average


