%% Assignment2 
%% =================
%% This function is to determine the random time that sensor introduced to the entry square
%% The number of sensor, sensor range and time limit for each sensor introduced to the entry square acts as input
%% The random value of each sensor delay as output
%% Created : May 13th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ r ] = Sensor_timelimit( Number_Sensor,Timelimit_sensor,Maxspeed,Range_sensor )
sp = Range_sensor / 2.5;
for s = 1:Number_Sensor %using for loop get each sensor's delay value
  % for if else statement, random the value of each sensor's delay
if s == 1
r(s) = randi([0,Timelimit_sensor],1,1);
else
r(s) = randi([0,Timelimit_sensor],1,1) + r(s-1);
end
end
r = floor(r .* (Maxspeed / sp)); %Convert the random time to the numbers of moving path to each sensor

