%% Assignment2 
%% =================
%% For this function, the main task is first ask user to enter the file name and then read the file 
%% and extract the required parameters from the file.  The function includes input error checking and it will 
%% report if it doesn't get a sufficient number of input parameters or given incorrect input
%% Created : May 9th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [sizex,sizey,Number_object,Side_Entry,Number_Sensor,Range_sensor,Maxspeed,Timelimit_sensor,Timelimit_simulation,objectwidth,objectheight,objectx,objecty,circleradius,circlex,circley] = Configuration_data()
% Ask user to enter the file name
prompt = 'Type the file name';
Textname = input(prompt,'s');
filename = Textname;
% Read the file and extract the required parameters
fileID = fopen(filename,'r');
data = textscan(fileID,'%f','CommentStyle','#');
sizex = data{1}(1) * 1000;
sizey = data{1}(2) * 1000;
Number_object = data{1}(3);
data1 = textscan(fileID,'%s %f %f %f %f',Number_object);
data2 = textscan(fileID,'%f','CommentStyle','#');
a  = length(data1{1});
a1 = 0;
a2 = 0;
objectwidth = 0;
objectheight = 0;
objectx = 0;
objecty = 0;
circleradius = 0;
circlex = 0;
circley = 0;
fclose(fileID);
if Number_object == 0
    Side_Entry = data{1}(4);
    Number_Sensor = data{1}(5);
    Range_sensor = data{1}(6);
    Maxspeed = data{1}(7);
    Timelimit_sensor = data{1}(8);
    Timelimit_simulation = data{1}(9);
else
for t = 1:a  %using for loop to read the first cell array of data1
    b = char(data1{1}(t));
switch b  %using switch case to determine the type and store the value to differnt type
    case  'square'
        a1 =a1+1;
        objectwidth(a1) = data1{2}(t);
        objectheight(a1) =  data1{2}(t);
        objectx(a1) = data1{3}(t);
        objecty(a1) = data1{4}(t);
    case  'rectangle'
        a1 =a1+1;
        objectwidth(a1) = data1{2}(t);
        objectheight(a1) = data1{3}(t);
        objectx(a1) = data1{4}(t);
        objecty(a1) = data1{5}(t);
    case 'circle'
        a2 = a2+1;
        circleradius(a2) = data1{2}(t);
        circlex(a2) = data1{3}(t);
        circley(a2) = data1{4}(t);
end
end
    Side_Entry = data2{1}(1);
    Number_Sensor = data2{1}(2);
    Range_sensor = data2{1}(3);
    Maxspeed = data2{1}(4);
    Timelimit_sensor = data2{1}(5);
    Timelimit_simulation = data2{1}(6);
end
%input error checking, if any of value is negative, it will display error
if Range_sensor*Side_Entry*Number_Sensor*Maxspeed*Timelimit_sensor*Timelimit_simulation*sizex*sizey* Number_object < 0 
    error('Invalid input');
end
    for check1 = 1:length(objectx)
    if objectheight(check1)*objectwidth(check1) < 0
        error('Invalid input');
    end
    end
   for check2 = 1:length(circlex)
    if circleradius(check2) < 0
        error('Invalid input');
    end
   end
end

