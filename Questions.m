clc
data = readmatrix("initialRAWdata.dat");
dininghall = data(:,1);
day = data(:,2);
meal = data(:,3);
nomeat = data(:,6);
busy = data (:,7);
dimension = size(data);
[userday, usermeal] = checkday; %prompts user for meal they're gonna eat and what day

avgbrandrate = avgrating(0,userday,usermeal,data);
avgantrate = avgrating(1,userday,usermeal,data);
%Above 2 calculate the average rating of the user inputted meal on the 
%specific inputted day
vegbrand = vegan(0,userday,usermeal,data);
vegant = vegan(1,userday,usermeal,data);
%the above two based on the user inputted values, it will also give an average rating of
%how vegan friendly the meal is
busbrand = bus(0,userday,usermeal,data);
busant = bus(1,userday,usermeal,data);
%The above two give the average ratings of how busy it is in the dining
%halls

compare(avgantrate,avgbrandrate,vegbrand,vegant,busbrand,busant);

function compare(a,b,c,d,e,f)
totb = (a+c-e);
tota = (b+d-f);
if (a+c-e)>(b+d-f) %if the total rating of brandy is higher than anteatery,
%this message will display, giving the user a break down of the ratings as
%well as including the total rating of the lesser dining hall
    fprintf(['The Brandywine is the overall better option for this meal (Based off' ...
        ' 3 criteria):\n meal rating (%.1f/5) - Higher is better\n ' ...
        'busyness rating (%.1f/1.0) - Lower is better\n' ...
        ' vegan frendliness (%.1f/1.0) - Higher is better\n' ...
        ' Brandy rating total: %.1f/5\n' ...
        ' Ant rating total: %.1f/5\n'],a,e,c,totb,tota)
elseif (a+c-e)<(b+d-f) %same as above but if the anteatery rating is higher
    fprintf(['The Anteatery is the overall better option for this meal (Based off' ...
        ' 3 criteria):\n meal rating (%.1f/5) - Higher is better\n ' ...
        'busyness rating (%.1f/1.0) - Lower is better\n' ...
        ' vegan frendliness (%.1f/1.0) - Higher is better\n' ...
        ' Ant rating total: %.1f/5\n' ...
        ' Brandy rating total: %.1f/5\n'],b,f,d,tota,totb)
else
    fprintf('Both dining halls are equally good options\n') %if the ratings are
%the exact same, it will just say that both halls are equally as good
end
end

function ml = avgrating(place,day,meal,dat)
% the variables to input is the place, 0 being brandywine and 1 being anteatery
% for the day, 1 is sunday, 7 is saturday
m = [1;1];
counter = 1;
dimension = size(dat);
for i = 1:dimension(1,1)
% the for loop will continue for the number of rows that the data is long
    if ((dat(i,1) == place)&&(dat(i,3)==meal))&&(dat(i,2)==day)
    % checks to see if it matches the place #, meal #, day # match the
    % values called
        m(counter,1) = dat(i,4);
        % the value of the rating is added to the matrix if it meets those conditions
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
% this matrix is the average of all the ratings of a certain meal at one of the dining halls
end

function ml = vegan(place,day,meal,dat)
% the variables to input is the place, 0 being brandywine and 1 being anteatery
% for the day, 1 is sunday, 7 is saturday
m = [1;1];
counter = 1;
dimension = size(dat);
for i = 1:dimension(1,1)
% the for loop will continue for the number of rows that the data is long
    if ((dat(i,1) == place)&&(dat(i,3)==meal))&&(dat(i,2)==day)
        m(counter,1) = dat(i,6);
        % the value of the vegan frendliness rating is added to the matrix if it meets those conditions
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
% this matrix is the average of all the vegan ratings of one dining hall
% for a specific meal and day
end

function ml = bus(place,day,meal,dat)
% the variables to input is the place, 0 being brandywine and 1 being anteatery
% for the day, 1 is sunday, 7 is saturday
m = [1;1];
counter = 1;
dimension = size(dat);
for i = 1:dimension(1,1)
% the for loop will continue for the number of rows that the data is long
    if ((dat(i,1) == place)&&(dat(i,3)==meal))&&(dat(i,2)==day)
        m(counter,1) = dat(i,7);
        % the value of the rating of busyness is added to the matrix if it meets those conditions
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
% this matrix is the average of all the ratings of busyness in a dining
% hall
end

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
