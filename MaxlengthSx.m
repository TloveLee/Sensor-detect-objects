%% Assignment2 
%% =================
%% This function use number of sensor and x coordinate of moving path as input to determine the max length
%% of each sensor's moving path as output
%% Created : May 9th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ lmax ] = MaxlengthSx( Sx, Number_Sensor )
for t = 1: Number_Sensor % using for loop to determine the max length of each sensor's moving path
    l = length(Sx{t});
end
    lmax = max(l);
end

