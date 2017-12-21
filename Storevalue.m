%% Assignment2 
%% =================
%% This function use number of sensors and the x coordinates of rectangles and squares (get the number of rectangles and squares) as input
%% and build number of cell arrays with value 0 as output in order to store the value of detecting rectangles and squares 
%% Created : May 9th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ xmindetect, xmaxdetect,ymindetect, ymaxdetect] = Storevalue(Number_Sensor,objectx)
for t1 = 1:length(objectx)  
    for t2 = 1:Number_Sensor
 %using two for loops with number of rectangles and squares and number of sensors to create cell arrays 
 %with value of 0
        xmindetect{t1}(t2) = 0;
    end
end
for t3 = 1:length(objectx)
    for t4 = 1:Number_Sensor
 %using two for loops with number of rectangles and squares and number of sensors to create cell arrays 
 %with value of 0
        xmaxdetect{t3}(t4) = 0;
    end
end
for t5 = 1:length(objectx)
    for t6 = 1:Number_Sensor
 %using two for loops with number of rectangles and squares and number of sensors to create cell arrays 
 %with value of 0
        ymindetect{t5}(t6) = 0;
    end
end
for t7 = 1:length(objectx)
    for t8 = 1:Number_Sensor
 %using two for loops with number of rectangles and squares and number of sensors to create cell arrays 
 %with value of 0
        ymaxdetect{t7}(t8) = 0;
    end
end
end

