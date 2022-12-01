clc
data = readmatrix("initialRAWdata.csv");
dininghall = data(:,1);
day = data(:,2);
meal = data(:,3);
nomeat = data(:,5);
busy = data (:,6);
dimension = size(data);
[userday, usermeal] = checkday; %prompts user for meal they're gonna eat and what day

brandyTotVec = sart(1,0,4,data);
antTotVec = sart(1,1,4,data);

avgbrandrate = sarrtPlaceDay(0,userday,usermeal,data);
avgantrate = sarrtPlaceDay(1,userday,usermeal,data);

compare(avgantrate,avgbrandrate);

function compare(a,b)
if a<b
    fprintf(['The Brandywine is the better option for this meal (%.1f stars ' ...
        'compared to %.1f stars at the Anteatery)\n'],b,a)
elseif a>b
    fprintf(['The Anteatery is the better option for this meal (%.1f stars ' ...
        'compared to %.1f stars at the Brandywine)\n'],a,b)
else
    fprintf('Both dining halls are equally good options\n')
end
end

function ml = sarrtPlaceDay(place,day,meal,dat)
% the variables to input is the place, 0 being brandywine and 1 being anteatery
% for the day, 1 is sunday, 7 is saturday
m = [1;1];
counter = 1;
dimension = size(dat);
for i = 1:dimension(1,1)
% the for loop will continue for the number of rows that the data is long
    if ((dat(i,1) == place)&&(dat(i,3)==meal))&&(dat(i,2)==day)
    % checks to see whether the hall is brandywine or anteatery AND if the a certain day of the week
        m(counter,1) = dat(i,4);
        % the value of the rating is added to the matrix if it meets those conditions
        counter = counter + 1;
    end
end
ml = sum(m)/size(m,1);
% this matrix is the average of all the ratings of a certain meal at one of the dining halls
end

function z = sart(col1,search,out,dat)
% the generic search function which searches for just one value of one column
% and will return the 'search' value in the 'out' column
m = [1;1];
counter = 1;
dimension = size(dat);
for i = 1:dimension(1,1)
% the for loop will continue for the number of rows that the data is long
    if dat(i,col1) == search
    % checks the variable column for a certain value
        m(counter,1) = dat(i,out);
        % when the condition is met, it returns a certain value of a column
        counter = counter + 1;
    end
end
z = m';
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