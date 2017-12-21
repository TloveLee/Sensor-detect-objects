%% Assignment2 
%% =================
%% This function use number of sensor, common moving path and x and y coordinate of moving path as input,
%% If the one sensor has the same x and y coordinate with others in the same time, it will change the position
%% to avoid collison and destroyed
%% Created : May 15th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ Sx,Sy ] = avoidsensor( Sx,Sy,t,Number_Sensor,s )
for z = 1:Number_Sensor
    if t > length(Sx{z}) %if oen sensor complete its mission, it will stay in place and wait for other sensors
        Sx{z}(t) = Sx{z}(length(Sx{z}));
        Sy{z}(t) = Sy{z}(length(Sy{z}));
    end
    if z ~= s %using if else statements, the sensor will compare to others
        if Sx{s}(t) == Sx{z}(t) & Sy{s}(t) == Sy{z}(t)
            %If the one sensor has the same x and y coordinate with others in the same time, it will change the position
            %to avoid collison and destroyed
            Sx{s}(t) = Sx{z}(t) + 15;
            Sy{s}(t) = Sy{z}(t) + 15;
        end
    end
end
end

