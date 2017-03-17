function boxCallbackVer2(clicked,~)
clicked.Visible='off'

pos=clicked.Position;

% if pos(1)==0
%     pos(1)=1
% end
% 
% if pos(2)==0
%     pos(2)=1
% end

xcoor=ceil((pos(2)+1)/15);
ycoor=ceil((pos(1)+1)/15);

if strcmp(evalin('base','PlotChoice'),'Plot 1')
    Plot1Info=evalin('base','Plot1Info');
    Plot1Info(xcoor,ycoor)=0;
    assignin('base','Plot1Info',Plot1Info);
elseif strcmp(evalin('base','PlotChoice'),'Plot 2')
    Plot2Info=evalin('base','Plot2Info');
    Plot2Info(xcoor,ycoor)=0;
    assignin('base','Plot2Info',Plot2Info);
elseif strcmp(evalin('base','PlotChoice'),'Plot 3')
    Plot3Info=evalin('base','Plot3Info');
    Plot3Info(xcoor,ycoor)=0;
    assignin('base','Plot3Info',Plot3Info);
end

hands = evalin('base','Hands');

TotalCost = getfield(hands,'TotalCost');
SolarCost = getfield(hands,'SolarCost');
WindCost = getfield(hands,'WindCost');

TotalItems = getfield(hands,'TotalItems');
PanelAmount = getfield(hands,'PanelAmount');
TurbAmount = getfield(hands,'TurbAmount');

SolarPower = getfield(hands,'SolarPower');
TotalPower = getfield(hands,'TotalPower');
WindPower = getfield(hands,'WindPower');

TotalArea = getfield(hands,'TotalArea');
SolarArea = getfield(hands,'SolarArea');
WindArea = getfield(hands,'WindArea');

CostToKW = getfield(hands,'CostToKW');


updateSolar(1)
updateWind(1)
updateSolar(2)
updateWind(2)
updateSolar(3)
updateWind(3)

set(TotalItems,'String',num2str(evalin('base','TotalItems')))
set(PanelAmount,'String',num2str(evalin('base','PanelAmount')))
set(TurbAmount,'String',num2str(evalin('base','TurbAmount')))

set(TotalCost,'String',num2str(evalin('base','TotalCost')))
set(SolarCost,'String',num2str(evalin('base','SolarCost')))
set(WindCost,'String',num2str(evalin('base','WindCost')))

set(SolarArea,'String',num2str(evalin('base','SolarArea')))
set(TotalArea,'String',num2str(evalin('base','TotalArea')))
set(WindArea,'String',num2str(evalin('base','WindArea')))

set(TotalPower,'String',num2str(evalin('base','TotalPower')))
set(SolarPower,'String',num2str(evalin('base','SolarPower')))
set(WindPower,'String',num2str(evalin('base','WindPower')))

set(CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))





end

