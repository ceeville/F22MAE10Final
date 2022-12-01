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


function ml = sarrtPlaceMeal(place,day,meal)
data = readmatrix("eat.dat");
m = [1;1];
counter = 1;
dim = size(data);
for i = 1:dim(1,1)
    if (data(i,1) == place)&&(data(i,3)==meal)
        m(counter,1) = data(i,4);
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
end



function ml = sarrtPlaceDay(place,day)
data = readmatrix("eat.dat");
m = [1;1];
counter = 1;
dim = size(data);
for i = 1:dim(1,1)
    if (data(i,1) == place)&&(data(i,2)==day)
        m(counter,1) = data(i,4);
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
end


function ml = sarrrt(place,day,meal)
data = readmatrix("eat.dat");
m = [1;1];
counter = 1;
dim = size(data);
for i = 1:dim(1,1)
    if (data(i,1) == place)&&(data(i,2)==day)&&(data(i,3)==meal)
        m(counter,1) = data(i,4);
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
end



function z = sart(col1,search,out)
data = readmatrix("eat.dat");
m = [1;1];
counter = 1;
dimension = size(data);
for i = 1:dimension(1,1)
    if data(i,col1) == search
        m(counter,1) = data(i,out);
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
