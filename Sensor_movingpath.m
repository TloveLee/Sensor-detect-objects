%% Assignment2 
%% =================
%% This function creates the strategy for sensor moving and each sensors will get its initial coordinates,
%% length and width of the area to be scanned.  When the sensor to touch the object, 
%% it will change the sensor moving path to avoid collision with the object
%% The value of objects,size of area, entry square value, number of sensor and sensor range is as input
%% The x and y coordinates of moving path for each sensor acts as output
%% Created : May 10th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [Sx,Sy ] = Sensor_movingpath(Range_sensor,Number_Sensor,sizex,sizey,xmin,xmax,ymin,ymax,objectx,cxmin,cxmax,cymin,cymax,circlex,entryxmin,entryxmax,entryymin,entryymax)
t1 = 0;
t2 = 0;
t3 = 1;
p1 = 0;
p2 = 0;
p3 = 0;
step = Range_sensor / 2.5;
m1 = 0:step:sizey;
m2 = sizey:-step:0;
size = sizex / Number_Sensor;
for number = 1:Number_Sensor  %using for loop to divide the sizex into equally number of parts
    n{number} = (number -1)*size : step : number*size;
end
for s = 1:Number_Sensor %using for loop to determine the moving for every sensor
x(s) = randi([entryxmin,entryxmax],1,1); %set the random beginning x and y coordinates of each sensor
y(s) = randi([entryymin,entryymax],1,1);
n1 = y(s):-step:0;
if n{s}(1)>=x(s) % To determine the beginning the point that each sensor begins to scan
    nx = x(s):step:n{s}(1);
else
    nx = x(s):-step:n{s}(1);
end
for t1 = 1:length(n1)  % The first moving path for every sensor
    Sx{s}(t1) = x(s);
    Sy{s}(t1) = n1(t1);
    % call the function to avoid object in first moving path
    [ Sx,Sy] = avoid_object1( xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax ,objectx,circlex,Sx,Sy,t1,s);
end
for t2 = 1:length(nx)  % The second moving path for every sensor
    Sx{s}(t1+t2) = nx(t2);
    Sy{s}(t1+t2) = n1(t1);
     % call the function to avoid object in second moving path
  [  Sx,Sy ] = avoid_object2(  xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax ,objectx,circlex,Sx,Sy,t1,s,t2 );
end
for t3 = 1:length(n{s}) % The third moving path for every sensor
        if mod(t3,2) == 1 %if the number of t3 is odd
        for p1 = 1:length(m1) %sensor will go up
            Sx{s}(t1+t2+p1+(t3-1)* length(m1)) = n{s}(t3);
            Sy{s}(t1+t2+p1+(t3-1)* length(m1)) = m1(p1);
            % call the function to avoid object in third moving path
        [ Sx,Sy] = avoid_object3( xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax ,objectx,circlex,Sx,Sy,t1,t2,t3,s,sizex,sizey,p1,m1);
        end
        else %if the number of t3 is even
        for p2 = 1:length(m2) %sensor will go down
            Sx{s}(t1+t2+p2+(t3-1)* length(m2)) = n{s}(t3);
            Sy{s}(t1+t2+p2+(t3-1)* length(m2)) = m2(p2);
             % call the function to avoid object in third moving path
        [ Sx,Sy] = avoid_object4( xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax ,objectx,circlex,Sx,Sy,t1,t2,t3,s,sizex,sizey,p2,m2);
        end
    end
end
f = t1+t2+p1+(t3-1)*length(m1);
c{s} = n{s}(t3) : -step : n{1}(t3)+(s-1)*1.5*Range_sensor;
for f1 = 1:length(c{s}) % The fourth moving path for every sensor
    Sx{s}(f+f1) = c{s}(f1);
    Sy{s}(f+f1) = Sy{s}(f);
     % call the function to avoid object in fourth moving path
    [ Sx,Sy] = avoid_object5( xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax ,objectx,circlex,Sx,Sy,s,f,f1);
end
end
end

