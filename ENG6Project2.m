%ENG6Project2
%Charles Hammond
%Ricky Obregon
%Karthik Ramesh
clear,clc
load Fargo.mat
load plots123

image(plot1)
%%%This code is from
%%%http://blogs.mathworks.com/steve/2007/01/01/superimposing-line-plots/,
%%%credit to Steve

hold on;
M=size(plot1,1);
N=size(plot1,2);

for k = 1:10:M
    x = [1 N];
    y = [k k];
    plot(x,y,'Color','w','LineStyle','-');
    plot(x,y,'Color','k','LineStyle',':');
end

for k = 1:10:N
    x = [k k];
    y = [1 M];
    plot(x,y,'Color','w','LineStyle','-');
    plot(x,y,'Color','k','LineStyle',':');
end

hold on

%end code from steve

