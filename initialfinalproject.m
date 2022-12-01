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

%%User input function
[userday, usermeal] = checkday; %prompts user for meal they're gonna eat and what day

function [userday,usermeal] = checkday
userday = input(['What day do you plan on going?\n 1 for Sunday\n ' ...
    '2 for Monday\n 3 for Tuesday\n 4 for Wednesday\n' ...
    ' 5 for Thursday\n 6 for Friday\n 7 for Saturday\n ']);
if userday > 7
%user can't input a value greater than 7 or lower than 1
    fprintf('%d does not represent a day of the week\n\n',userday)
    [userday,usermeal] = checkday; %prompts user to redo the questioning process
elseif userday < 1
    fprintf('%d does not represent a day of the week\n\n',userday)
    [userday,usermeal] = checkday;
else
    fprintf(2,'You are going to eat on day %d of the week\n\n',userday)
%displays day that user inputted
end 
usermeal = input(['What meal do you plan on eating? Enter it as:\n' ...
    ' 0 for breakfast\n 1 for lunch\n 2 for dinner\n 3 for late night\n ']);
if usermeal > 3
%user can't put a value below 0 or over 3 since it would't represent
%anything
    fprintf('%d is not a valid value\n\n',usermeal)
    [userday,usermeal] = checkday; %prompts user to redo the questioning process
elseif usermeal <0
    fprintf('%d is not a valid value\n\n',usermeal)
    [userday,usermeal] = checkday;
elseif (usermeal>2) + xor(userday==1,userday>5) ==2
%if the meal inputted represents late night and one of the days are
%fri-sun, then the user has to reinput everything as late night isn't
%served those days
    fprintf('There is no late night meal this day\n\n')
    [userday,usermeal] = checkday;
else
    fprintf(2,'You are going to eat meal %d of the day\n\n',usermeal)
%displays what meal the user is going to eat that day
end

end
