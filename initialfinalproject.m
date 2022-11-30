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
sunday = sort(


function [x,y] = sort(column,search,out)
m = [1;1]
counter = 1;
for i = 1:dimension(1,1)
    if data(i,column) == search
        % when the day is sunday
        m(counter,1) = data(i,out)
        counter = counter + 1;
    end
end
end

sort(4,1,3)

% ratingavg = sum(rating,dimension(1,1));
% repeat this function but with a different vector to find the average





