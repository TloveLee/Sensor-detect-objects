%% Assignment2 
%% =================
%% This function gets the object value of sensor value as input, in the third moving path,
%% When the sensor to touch the object, it will change the sensor moving path to avoid collision with the object
%% The new value of x and y coordinates of sensor acts as output
%% length and width of the area to be scanned
%% Created : May 12th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ Sx,Sy] = avoid_object4( xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax ,objectx,circlex,Sx,Sy,t1,t2,t3,s,sizex,sizey,p2,m2)
for num1 = 1:length(objectx)  %using for loop to detect every rectangles and suqares
    % Determine whether the sensor is left or right to avoid the objects
        if Sx{s}(t1+t2+p2+(t3-1)* length(m2)) >= xmin(num1) & Sx{s}(t1+t2+p2+(t3-1)* length(m2)) <= xmax(num1) & Sy{s}(t1+t2+p2+(t3-1)* length(m2)) >= ymin(num1) & Sy{s}(t1+t2+p2+(t3-1)* length(m2)) <= ymax(num1) 
            if Sx{s}(t1+t2+p2+(t3-1)* length(m2)) -xmin(num1) < xmax(num1) - Sx{s}(t1+t2+p2+(t3-1)* length(m2))
           Sx{s}(t1+t2+p2+(t3-1)* length(m2)) = xmax(num1) + 1;
           else
            Sx{s}(t1+t2+p2+(t3-1)* length(m2)) = xmin(num1) -1;
            end
        end
end
for num2 = 1:length(circlex)%using for loop to detect every circles
     % Determine whether the sensor is left or right to avoid the objects
          if Sx{s}(t1+t2+p2+(t3-1)* length(m2)) >= cxmin(num2) & Sx{s}(t1+t2+p2+(t3-1)* length(m2)) <= cxmax(num2) & Sy{s}(t1+t2+p2+(t3-1)* length(m2)) >= cymin(num2) & Sy{s}(t1+t2+p2+(t3-1)* length(m2)) <= cymax(num2) 
            if Sx{s}(t1+t2+p2+(t3-1)* length(m2)) -cxmin(num2) < cxmax(num2) - Sx{s}(t1+t2+p2+(t3-1)* length(m2))
            Sx{s}(t1+t2+p2+(t3-1)* length(m2)) = cxmax(num2) + 1;
            else
            Sx{s}(t1+t2+p2+(t3-1)* length(m2)) = cxmin(num2) -1;
            end
        end
end 
end





