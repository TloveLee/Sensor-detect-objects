%% Assignment2 
%% =================
%% This function gets the object value of sensor value as input, in the fourth moving path,
%% When the sensor to touch the object, it will change the sensor moving path to avoid collision with the object
%% The new value of x and y coordinates of sensor acts as output
%% length and width of the area to be scanned
%% Created : May 12th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ Sx,Sy] = avoid_object5( xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax ,objectx,circlex,Sx,Sy,s,f,f1)
for num1 = 1:length(objectx) %using for loop to detect every rectangles and suqares
    % Determine whether the sensor is up or down to avoid the objects
        if Sx{s}(f+f1) >= xmin(num1) & Sx{s}(f+f1) <= xmax(num1) & Sy{s}(f+f1) >= ymin(num1) & Sy{s}(f+f1) <= ymax(num1) 
            if Sy{s}(f+f1) -ymin(num1) > ymax(num1) - Sy{s}(f+f1)
            Sx{s}(f+f1) = ymax(num1) + 1;
            else
            Sx{s}(f+f1) = ymin(num1) -1;
            end
        end
end
for num2 = 1:length(circlex)%using for loop to detect every circles
    % Determine whether the sensor is up or down to avoid the objects
          if Sx{s}(f+f1) >= cxmin(num2) & Sx{s}(f+f1) <= cxmax(num2) & Sy{s}(f+f1) >= cymin(num2) & Sy{s}(f+f1) <= cymax(num2) 
            if Sy{s}(f+f1) -cymin(num2) > cymax(num2) - Sy{s}(f+f1)
            Sy{s}(f+f1) = cymax(num2) + 1;
            else
            Sy{s}(f+f1) = cymin(num2) -1;
            end
        end
end
end


