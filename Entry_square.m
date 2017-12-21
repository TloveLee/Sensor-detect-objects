%% Assignment2 
%% =================
%% This function is to using entry square's value as input from the configuration data function  
%% and calculate the min and max value of x and y coordinates of entry square as output
%% Created : May 9th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ entryxmin,entryxmax,entryymin,entryymax  ] = Entry_square(Side_Entry,sizex,sizey )
%using for loop to calculate the min and max value of x and y coordinates
%of entry square
entryxmin = ceil(sizex /2 - Side_Entry/2);
entryxmax = floor(sizex /2 + Side_Entry/2);
entryymin = ceil(sizey /2 - Side_Entry/2);
entryymax = floor(sizey /2 + Side_Entry/2);
end

