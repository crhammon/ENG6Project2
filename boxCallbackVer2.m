function boxCallbackVer2(clicked,~)
clicked.Visible='off'

pos=clicked.Position

xcoor=ceil((pos(2)+1)/15)
ycoor=ceil((pos(1)+1)/15)

if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
    Plot1Info=evalin('base','Plot1Info');
    Plot1Info(xcoor,ycoor)=0;
    assignin('base','Plot1Info',Plot1Info);
elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
    Plot2Info=evalin('base','Plot2Info');
    Plot2Info(xcoor,ycoor)=0;
    assignin('base','Plot2Info',Plot2Info);
elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
    Plot3Info=evalin('base','Plot3Info');
    Plot3Info(xcoor,ycoor)=0;
    assignin('base','Plot3Info',Plot3Info);
end


end

