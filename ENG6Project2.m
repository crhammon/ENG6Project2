%ENG6Project2
%Charles Hammond
%Ricky Obregon
%Karthik Ramesh
clear,clc
load Fargo.mat
load plots123
figure(1)
image(plot1)
hold on
gridded=rectangle('position',[1 1 20 20],'ButtonDownFcn',@boxCallback)

