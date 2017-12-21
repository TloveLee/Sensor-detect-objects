%% Assignment2 
%% =================
%% This function is to using each object's value as input from the configuration data function  
%% and calculate the min and max value of x and y coordinates of every object as output
%% Created : May 9th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax ] = objectvalue( objectx, objecty,objectwidth, objectheight, circlex,circley,circleradius )
for num = 1 : length(objectx) %using for loop to calculate the min and max value of x and y coordinates of every rectangles and squares
xmin(num) = objectx(num) - objectwidth(num)/2;
xmax(num) = objectx(num) + objectwidth(num)/2;
ymin(num) = objecty(num) - objectheight(num)/2;
ymax(num) = objecty(num) + objectheight(num)/2;
end
for num1 = 1:length(circlex) %using for loop to calculate the min and max value of x and y coordinates of every circles
cxmin(num1) = circlex(num1) - circleradius(num1)/2;
cxmax(num1) = circlex(num1) + circleradius(num1)/2;
cymin(num1) = circley(num1) - circleradius(num1)/2;
cymax(num1) = circley(num1) + circleradius(num1)/2;
end

