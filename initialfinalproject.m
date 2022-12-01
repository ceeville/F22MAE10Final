data = readmatrix("initialRAWdata.dat");
dininghall = data(:,1);
day = data(:,2);
meal = data(:,3);
nomeat = data(:,6);
busy = data (:,7);
dimension = size(data);
% want to know the total size of our data
% need to create a loop which will check the day and create a vector
% based off of the day, or other variables


brandyTotVec = sart(1,0,4);
antTotVec = sart(1,1,4);

avgBrandy = sum(brandyTotVec)/size(brandyTotVec,2);
avgAnt = sum(antTotVec)/size(brandyTotVec,2);

avgsBarVec = [avgBrandy,avgAnt];
places = categorical({'Brandywine','Anteatery'});

totalAvg = figure;
title('Total Averages of Mess Halls')
bar(places,avgsBarVec)
ylabel('Score (0-5)')

brandySun = sarrtPlaceDay(0,1); 
brandyMon = sarrtPlaceDay(0,2);
brandyTue = sarrtPlaceDay(0,3);
brandyWed = sarrtPlaceDay(0,4);
brandyThu = sarrtPlaceDay(0,5);
brandyFri = sarrtPlaceDay(0,6);
brandySat = sarrtPlaceDay(0,7);

avgBrandyDayVec = [brandySun,brandyMon,brandyTue,brandyWed,brandyThu,brandyFri,brandySat];
weekCat = categorical({'Sun','Mon','Tue','Wed','Thu','Fri','Sat'}); 
weekCat = reordercats(weekCat,{'Sun','Mon','Tue','Wed','Thu','Fri','Sat'});

avgDayBrandy = figure;
title('Averages per Day of Brandywine')
bar(weekCat,avgBrandyDayVec)

eatSun = sarrtPlaceDay(1,1); 
eatMon = sarrtPlaceDay(1,2);
eatTue = sarrtPlaceDay(1,3);
eatWed = sarrtPlaceDay(1,4);
eatThu = sarrtPlaceDay(1,5);
eatFri = sarrtPlaceDay(1,6);
eatSat = sarrtPlaceDay(1,7);
avgEatDayVec = [eatSun,eatMon,eatTue,eatWed,eatThu,eatFri,eatSat];

avgDayEat = figure;
title('Averages per Day of Anteatery')
bar(weekCat,avgEatDayVec)

brandyBrek = sarrtPlaceMeal(0,0);
brandyLun = sarrtPlaceMeal(0,1);
brandyDin = sarrtPlaceMeal(0,2);
brandyLate = sarrtPlaceMeal(0,3);
brandyMealsVec = [brandyBrek,brandyLun,brandyDin,brandyLate];

meals = categorical({'Breakfast', 'Lunch', 'Dinner', 'Latenight'});
meals = reordercats(meals,{'Breakfast', 'Lunch', 'Dinner', 'Latenight'});
mealAvgBrandy = figure;
bar(meals, brandyMealsVec)

eatBrek = sarrtPlaceMeal(1,0);
eatLun = sarrtPlaceMeal(1,1);
eatDin = sarrtPlaceMeal(1,2);
eatLate = sarrtPlaceMeal(1,3);
eatMealsVec = [eatBrek,eatLun,eatDin,eatLate];

mealAvgBrandy = figure;
bar(meals, eatMealsVec)

function ml = sarrtPlaceMeal(place,meal)
% the variables to input is the place, 0 being brandywine and 1 being anteatery
% for the meal 0 is breakfast, 3 being late night
% this function will automatically return the all the ratings of a meal at a dining hall
m = [1;1];
% initializing the matrix
counter = 1;
% this counter prevents blank rows of zeros from being created in the new matrices
for i = 1:dimension(1,1)
% the for loop will continue for the number of rows that the data is long
    if (data(i,1) == place)&&(data(i,3)==meal)
    % checks to see whether the hall is brandywine or anteatery AND if the meal is breakfast, lunch, etc
        m(counter,1) = data(i,4);
        % the value of the rating is added to the matrix if it meets those conditions
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
% this matrix is the average of all the ratings of a certain meal at one of the dining halls
end



function ml = sarrtPlaceDay(place,day)
% the variables to input is the place, 0 being brandywine and 1 being anteatery
% for the day, 1 is sunday, 7 is saturday
m = [1;1];
counter = 1;
for i = 1:dimension(1,1)
% the for loop will continue for the number of rows that the data is long
    if (data(i,1) == place)&&(data(i,2)==day)
    % checks to see whether the hall is brandywine or anteatery AND if the a certain day of the week
        m(counter,1) = data(i,4);
        % the value of the rating is added to the matrix if it meets those conditions
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
% this matrix is the average of all the ratings of a certain meal at one of the dining halls
end


function ml = sarrrt(place,day,meal)
m = [1;1];
counter = 1;
for i = 1:dimension(1,1)
% the for loop will continue for the number of rows that the data is long
    if (data(i,1) == place)&&(data(i,2)==day)&&(data(i,3)==meal)
    % checks the hall, the day, AND the meal
        m(counter,1) = data(i,4);
        % the value of the rating is added to the matrix if it meets those conditions
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
% this matrix is the average of all the ratings of a certain meal at one of the dining halls on a certain day
end



function z = sart(col1,search,out)
% the generic search function which searches for just one value of one column
% and will return the 'search' value in the 'out' column
m = [1;1];
counter = 1;
dimension = size(data);
for i = 1:dimension(1,1)
% the for loop will continue for the number of rows that the data is long
    if data(i,col1) == search
    % checks the variable column for a certain value
        m(counter,1) = data(i,out);
        % when the condition is met, it returns a certain value of a column
        counter = counter + 1;
    end
end
z = m';
end


% ratingavg = sum(rating,dimension(1,1));
% repeat this function but with a different vector to find the average
