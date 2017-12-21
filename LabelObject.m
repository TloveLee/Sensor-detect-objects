%% Assignment2 
%% =================
%% This function get the value of object, the size of area and the value of entry square as input, 
%% it will draw the perimeter of area, entry square and objects with thick black line in figure 1,
%% draw the perimeter of area, entry square in figure 2, and then determine the x-axis and y-axis of figure
%% Created : May 13th
%% Copyright (c) 2017 [Lishen Tong U6013585] .
%% Copyright (c) 2017 [Jiaxi Li U6013522] .
%% ------------------------------------------------------------
function [ ax3,ax4 ] = LabelObject( objectx,circlex,xmin,xmax,ymin,ymax,cxmin,cxmax,cymin,cymax,sizex,sizey,entryxmin,entryxmax,entryymin,entryymax  )
ax_xmax = sizex;
ax_xmin = 0;
ay_ymax = sizey;
ay_ymin = 0;
subplot(2,1,1);  %plot the first figure
xlabel('The horizental size of the area(x)');
ylabel('The vertival size of the area(y)');
title('ENGN2219 Assignment2 processing part');
area = rectangle('Position', [0 0 sizex sizey], 'LineWidth', 3); %plot the rectangle area
Entry = rectangle('Position', [entryxmin entryymin entryxmax-entryxmin entryymax-entryymin],'LineStyle','--'); %plot the entry square
for t = 1:length(objectx) % using for loop to plot rectangles and squares in thick black line
        hold on
        ax3(t) = rectangle('Position',[xmin(t) ymin(t) xmax(t)-xmin(t) ymax(t)-ymin(t)],'LineWidth', 1);
end
for t1 = 1:length(circlex)  % using for loop to plot circles in thick black line
        hold on
        ax4(t1) = rectangle('Position',[cxmin(t1) cymin(t1) cxmax(t1)-cxmin(t1) cymax(t1)-cymin(t1)],'Curvature',[1 1],'LineWidth', 1);
end
for t2 = 1:length(objectx) %using for loop to determine the x-axis and y-axis
    if xmax(t2) > sizex
        ax_xmax = sizex + 100;
    elseif xmin(t2) < 0
        ax_xmin = 0-100;
    elseif ymax(t2) > sizey
        ay_ymax = sizey + 100;
    elseif ymin(t2) < 0
        ay_ymin = 0-100;
    end
end
for t3 = 1:length(circlex) %using for loop to determine the x-axis and y-axis
    if cxmax(t3) > sizex
         ax_xmax = sizex + 100;
    elseif cxmin(t3) < 0
        ax_xmin = 0-100;
    elseif cymax(t3) > sizey
        ay_ymax = sizey + 100;
     elseif cymin(t3) < 0
        ay_ymin = 0-100;
    end
end
axis([ax_xmin ax_xmax ay_ymin ay_ymax]);
subplot(2,1,2); %plot the second figure
xlabel('The horizental size of the area(x)');
ylabel('The vertival size of the area(y)');
title('ENGN2219 Assignment2 result part');
area1 = rectangle('Position', [0 0 sizex sizey], 'LineWidth', 3);%plot the rectangle area
Entry1 = rectangle('Position', [entryxmin entryymin entryxmax-entryxmin entryymax-entryymin],'LineStyle','--');%plot the entry square
end

