%% Assignment2 
%% =================
%% The function use range sensor, object value, the indexof sensor, the moving step and the cell arrays which defined
%% in the previous functions as input.  The detected value will be stored in the cell array, and the new data of cell
%% array acts output for further use.
%% Created : May 18th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [xmindetect, xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect] = testdetect(Range_sensor, s,t, xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax,Sx,Sy,objectx,circlex,xmindetect, xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect )
range = Range_sensor;
theta = 0:1:359;
for rg = 1:length(theta) %usi for loop to find the detected range for the sensor
        x(rg) = Sx{s}(t)+range * sind(theta(rg));
        y(rg) = Sy{s}(t)+range * cosd(theta(rg));
end
for num = 1 : length(objectx) %use for loop to detect whether the rectangle and square points have been detected by sensors. If yes, store the value into cell array
    xmindetect{num}(s) = inpolygon(xmin(num),ymin(num),x,y)+ xmindetect{num}(s);
    xmaxdetect{num}(s) = inpolygon(xmax(num),ymin(num),x,y)+ xmaxdetect{num}(s);
    ymindetect{num}(s) = inpolygon(xmin(num),ymax(num),x,y)+ymindetect{num}(s);
    ymaxdetect{num}(s) = inpolygon(xmax(num),ymax(num),x,y)+ ymaxdetect{num}(s);
end
for num1 = 1 : length(circlex) %use for loop to detect whether the circle points have been detected by sensors. If yes, store the value into cell array
    cxmindetect{num1}(s) = inpolygon(cxmin(num1),cymin(num1),x,y)+cxmindetect{num1}(s);
    cxmaxdetect{num1}(s) = inpolygon(cxmax(num1),cymin(num1),x,y)+cxmaxdetect{num1}(s);
    cymindetect{num1}(s) = inpolygon(cxmin(num1),cymax(num1),x,y)+ cymindetect{num1}(s);
    cymaxdetect{num1}(s) = inpolygon(cxmax(num1),cymax(num1),x,y)+ cymaxdetect{num1}(s);
end
end

