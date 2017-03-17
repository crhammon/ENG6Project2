function boxCallbackVer2(clicked,~)
clicked.Visible='off';
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
set(TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
set(TotalArea,'String',strcat(num2str(evalin('base','TotalArea')),' m^2'))
set(TotalPower,'String',strcat(num2str(evalin('base','TotalPower')),' kW hr'))
set(CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))


name = evalin('base','name');

switch name

    case 'Plot1.jpg'
        
        set(PanelAmount,'String',num2str(evalin('base','Plot1Panel')))
        set(TurbAmount,'String',num2str(evalin('base','Plot1Turb')))
        set(SolarCost,'String',strcat('$ ',num2str(evalin('base','Plot1SolarCost'))))
        set(WindCost,'String',strcat('$ ',num2str(evalin('base','Plot1WindCost'))))
        set(SolarArea,'String',strcat(num2str(evalin('base','Plot1SolarArea')),' m^2'))
        set(WindArea,'String',strcat(num2str(evalin('base','Plot1WindArea')),' m^2'))
        set(SolarPower,'String',strcat(num2str(evalin('base','Plot1SolarPower')),' kW hr'))
        set(WindPower,'String',strcat(num2str(evalin('base','Plot1WindPower')),' kW hr'))
        
    case 'Plot2.jpg'
        
        set(PanelAmount,'String',num2str(evalin('base','Plot2Panel')))
        set(TurbAmount,'String',num2str(evalin('base','Plot2Turb')))
        set(SolarCost,'String',strcat('$ ',num2str(evalin('base','Plot2SolarCost'))))
        set(WindCost,'String',strcat('$ ',num2str(evalin('base','Plot2WindCost'))))
        set(SolarArea,'String',strcat(num2str(evalin('base','Plot2SolarArea')),' m^2'))
        set(WindArea,'String',strcat(num2str(evalin('base','Plot2WindArea')),' m^2'))
        set(SolarPower,'String',strcat(num2str(evalin('base','Plot2SolarPower')),' kW hr'))
        set(WindPower,'String',strcat(num2str(evalin('base','Plot2WindPower')),' kW hr'))
        
    case 'Plot3.jpg'
        
        set(PanelAmount,'String',num2str(evalin('base','Plot3Panel')))
        set(TurbAmount,'String',num2str(evalin('base','Plot3Turb')))
        set(SolarCost,'String',strcat('$ ',num2str(evalin('base','Plot3SolarCost'))))
        set(WindCost,'String',strcat('$ ',num2str(evalin('base','Plot3WindCost'))))
        set(SolarArea,'String',strcat(num2str(evalin('base','Plot3SolarArea')),' m^2'))
        set(WindArea,'String',strcat(num2str(evalin('base','Plot3WindArea')),' m^2'))
        set(SolarPower,'String',strcat(num2str(evalin('base','Plot3SolarPower')),' kW hr'))
        set(WindPower,'String',strcat(num2str(evalin('base','Plot3WindPower')),' kW hr'))
end









end

