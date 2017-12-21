%% Assignment2 
%% =================
%% This function use value of objects, sensor range,time limit simulatition, maxspped, x and y coordinates of moving path,
%% number of objects, random delay value and detect cell array as input, the new stored cell array will be output for further using.
%% For this function, it first define a common  length of moving path for every sensor to make sure that each sensor has the
%% same length of sensor and then it calculate the time for sensor running to determine whether the running time has exceed
%% the time limit simulation, if yes, it will stop the function.  In addition, it plot every sensor's moving path and range 
%% in first figure adding with delay for each sensor.  it contains the function that sensor will avoid by other sensors.
%% Created : May 13th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [xmindetect, xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect] = Sensor_Run(Range_sensor, Timelimit_simulation,Maxspeed,Sx,Sy,Number_Sensor, xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax,Number_object,r,objectx,circlex,xmindetect, xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect)
ax2(Number_Sensor) = 0;
ax1(Number_Sensor) = 0;
w = Range_sensor*2;
h = Range_sensor*2;
%call the function to find the max length of each sensor's moving path
[ lmax ] = MaxlengthSx( Sx, Number_Sensor );
n = r(end) + lmax+5; % Set all sensors have one common length of moving path
timesp = Range_sensor / 2.5;
for t= 1:n %using for loop to plot sensor's moving in each step
    time = t * timesp / Maxspeed; %calculate the time for sensor running
     if time > Timelimit_simulation %If exceed the time limit, it will stop the function
            break;
    else
    for s = 1:Number_Sensor %using for loop to plot every sensor's moving
      t = t-r(s); %the common moving step minus the delay for each sensor
        if t <1 %If t becomes minus, it will become 1
            t = 1;
        elseif t>length(Sx{s}) %if oen sensor complete its mission, it will stay in place and wait for other sensors
            Sx{s}(t) = Sx{s}(length(Sx{s}));
            Sy{s}(t) = Sy{s}(length(Sy{s}));
        end
        % call the functions to avoid sensor collision and destroyed
        [ Sx,Sy ] = avoidsensor( Sx,Sy,t,Number_Sensor,s );
      if t ~= 1 %if t is not equal to 1, it will display
         %find the position of sensor's range
         xside1 = Sx{s}(t) -Range_sensor;
         yside1 = Sy{s}(t) -Range_sensor;
         pos1 = [xside1 yside1 w h];
         subplot(2,1,1); %plot the first figure
         ax1(s) = plot(Sx{s}(t),Sy{s}(t),'r.','MarkerSize',20); %plot the sensor 
         ax2(s) = rectangle('Position',pos1,'Curvature',[1 1],'EdgeColor','r'); % plot the range of sensor
      end
      %call the function to detect the object and store the value into cell
      %array which defined in function before
[xmindetect, xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect] = testdetect( Range_sensor,s,t, xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax,Sx,Sy,objectx,circlex,xmindetect, xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect );
hold on
t = t + r(s); % plus the delay, in order to make t become the original one for next sensor
    end
    pause(0.01);
for s2 = 1:Number_Sensor %after plot all sensors, using for loop to delete the plots and ready for the next new plot
    if t<n  &&  ax1(s2)~=0 && ax2(s2)~= 0  %if all the sensor completes the mission, it will stay in place and not delete
    delete(ax1(s2));
    delete(ax2(s2));
    end
end
     end
end
end


