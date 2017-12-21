%% ENGN2219 Assignment2 
%% =================
%% For Assignment2, the main task is using mobile robots for scanning and mapping objects in a specified area.
%% in the simulation, user can trpe the input file name,then the program will read the data and it has error checking
%% The simulation will make a strategy for every sensors moving around the area and show the moving path in the figure
%% Furthermore, the sensors will detect the object and identify the object.
%% After all the sensors finish their, it will stop or  if the time limit has been exceeded, whichever happens earlier.
%% It will draws all the object ccurately in the end on a separate plot. 
%% Created : May 9th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
clear
clc
close all
% call the functon for user input the file name, read data and error check
[sizex,sizey,Number_object,Side_Entry,Number_Sensor,Range_sensor,Maxspeed,Timelimit_sensor,Timelimit_simulation,objectwidth,objectheight,objectx,objecty,circleradius,circlex,circley] = Configuration_data();
% calculate the object value
[xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax ] = objectvalue( objectx, objecty,objectwidth, objectheight, circlex,circley,circleradius );
%calculate the entry square value
[entryxmin,entryxmax,entryymin,entryymax  ] = Entry_square(Side_Entry,sizex,sizey );
%define cell arrays in order to store the rectangle and square detected value
[ xmindetect, xmaxdetect,ymindetect, ymaxdetect ] = Storevalue(Number_Sensor,objectx);
%define cell arrays in order to store the circles detected value
[ cxmindetect,cxmaxdetect, cymindetect,cymaxdetect ] = Storevalue_circle( Number_Sensor,circlex );
%define the random sensor introduced time and convert to the moving step
[ r ] = Sensor_timelimit( Number_Sensor,Timelimit_sensor,Maxspeed,Range_sensor );
%let sensor gets its initial-coordinates, length, width of the area to be
%scanned, including avoid object
[Sx,Sy ] = Sensor_movingpath(Range_sensor,Number_Sensor,sizex,sizey,xmin,xmax,ymin,ymax,objectx,cxmin,cxmax,cymin,cymax,circlex,entryxmin,entryxmax,entryymin,entryymax);
%Draw the perimeter of area, entery square in two figures, draw the objects
%with thick black line in figure1, determine the x-axis and y-axis
[ ax3,ax4 ] = LabelObject( objectx,circlex,xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax,sizex,sizey,entryxmin,entryxmax,entryymin,entryymax  );
%Run all of sensors with different introduced time and show its range, determine whether is it ecceed the time limit simulation, including function detect object 
[xmindetect, xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect] = Sensor_Run(Range_sensor, Timelimit_simulation,Maxspeed,Sx,Sy,Number_Sensor, xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax,Number_object,r,objectx,circlex,xmindetect, xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect);
%Sensors communicate and check each sensor's stored value, if the object
%has been fully detected, it will plot in the figure 2
[ob1,ob2 ] = PlotObject( xmindetect,xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect,objectx,circlex,xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax );


