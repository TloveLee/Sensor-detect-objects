%% Assignment2 
%% =================
%% This function use number of sensors and the x coordinates of circles (get the number of circles) as input
%% and build number of cell arrays with value 0 as output in order to store the value of detecting circles 
%% Created : May 9th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [  cxmindetect,cxmaxdetect, cymindetect,cymaxdetect ] = Storevalue_circle( Number_Sensor,circlex )
for t1 = 1:length(circlex)
    for t2 = 1:Number_Sensor
 %using two for loops with number of circles and number of sensors to create cell arrays 
 %with value of 0
        cxmindetect{t1}(t2) = 0;
    end
end
for t3 = 1:length(circlex)
    for t4 = 1:Number_Sensor
 %using two for loops with number of circles and number of sensors to create cell arrays 
 %with value of 0
        cxmaxdetect{t3}(t4) = 0;
    end
end
for t5 = 1:length(circlex)
    for t6 = 1:Number_Sensor
 %using two for loops with number of circles and number of sensors to create cell arrays 
 %with value of 0
        cymindetect{t5}(t6) = 0;
    end
end
for t7 = 1:length(circlex)
    for t8 = 1:Number_Sensor
 %using two for loops with number of circles and number of sensors to create cell arrays 
 %with value of 0
        cymaxdetect{t7}(t8) = 0;
    end
end
end



