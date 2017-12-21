%% Assignment2 
%% =================
%% This function take object value, cell array which stored the detected value as input
%% If the object has been fully detected, it will be output to plot
%% Created : May 20th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ ob1,ob2 ] = PlotObject( xmindetect,xmaxdetect,ymindetect, ymaxdetect,cxmindetect,cxmaxdetect, cymindetect,cymaxdetect,objectx,circlex,xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax )
ob1 = 0;
ob2 = 0;
subplot(2,1,2); %plot the second figure
for t = 1:length(objectx) %using for loop to judge whether the rectangles and squares has been fully detected, If yes, plot the object
    if sum(xmindetect{t}) > 0 & sum(xmaxdetect{t}) > 0 & sum(ymindetect{t}) > 0 & sum(ymaxdetect{t}) > 0
        hold on
        ob1(t) = rectangle('Position',[xmin(t) ymin(t) xmax(t)-xmin(t) ymax(t)-ymin(t)],'FaceColor',[0 0 1]);
    end
end
for t1 = 1:length(circlex) %using for loop to judge whether the circles has been fully detected, If yes, plot the object
    if sum(cxmindetect{t1}) > 0 & sum(cxmaxdetect{t1}) > 0 & sum(cymindetect{t1}) > 0 & sum(cymaxdetect{t1}) > 0
        hold on
        ob2(t1) = rectangle('Position',[cxmin(t1) cymin(t1) cxmax(t1)-cxmin(t1) cymax(t1)-cymin(t1)],'Curvature',[1 1],'FaceColor',[0 0 1]);
    end
end
end

