function updateSolar(choice)

SolarPower = evalin('base','SolarAvg');


switch choice
    
    case 1
        
        panel = sum(sum(evalin('base','Plot1Info')== 1))* 233 ;
        panel = sum(sum(evalin('base','Plot1Info')== 2))* 155 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 3))* 1782 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 4))* 134 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 5))* 429 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 6))* 1018 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 7))* 153 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 8))* 223 + panel;
        panel = sum(sum(evalin('base','Plot1Info')== 9))* 107 + panel;
        panel = sum(sum(evalin('base','Plot1Info')== 10))* 111 + panel;
        assignin('base','Plot1Panel',panel)
        
        cost = sum(sum(evalin('base','Plot1Info')== 1))* 233 * 279.95 ;
        cost = sum(sum(evalin('base','Plot1Info')== 2))* 155 * 499.95 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 3))* 1782 * 34.95 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 4))* 134 * 319.99 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 5))* 429 * 114.70 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 6))* 1018 * 39.95 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 7))* 153 * 245.99 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 8))* 223 * 99.99 + cost;
        cost = sum(sum(evalin('base','Plot1Info')== 9))* 46 * 249.50 + cost;
        cost = sum(sum(evalin('base','Plot1Info')== 10))* 47 * 199.99 + cost;
        assignin('base','Plot1SolarCost',cost)
        
%         power = sum(sum(evalin('base','Plot1Info')== 1)) * 233 * SolarPower * 42.5/39.3700787 * 16/39.3700787;
%         power = sum(sum(evalin('base','Plot1Info')== 2)) * 155 * SolarPower * 21/39.3700787 * 48/39.3700787+ power;
%         power = sum(sum(evalin('base','Plot1Info')== 3)) * 1782 * SolarPower * 11/39.3700787 * 8/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 4))* 134 * SolarPower * 45/39.3700787 * 26/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 5))* 429 * SolarPower * 21.5/39.3700787 * 17.2/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 6))* 1018 * SolarPower * 14/39.3700787 * 11/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 7))* 153 * SolarPower * 47/39.3700787 * 21.8/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 8))* 223 * SolarPower * 32/39.3700787 * 22/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 9))* 46 * SolarPower * 41.18/39.3700787 * 81.36/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 10))* 47 * SolarPower * 43.06/39.3700787 * 75.13/39.3700787 + power;
%         assignin('base','Plot1SolarPower',panel*SolarPower)
        
        area = sum(sum(evalin('base','Plot1Info')== 1)) * 233 * 42.5/39.3700787 * 16/39.3700787;
        area = sum(sum(evalin('base','Plot1Info')== 2)) * 155 * 21/39.3700787 * 48/39.3700787 + area;
        area = sum(sum(evalin('base','Plot1Info')== 3)) * 1782 * 11/39.3700787 * 8/39.3700787 + area;
        area = sum(sum(evalin('base','Plot1Info')== 4))* 134 * 45/39.3700787 * 26/39.3700787 + area;
        area = sum(sum(evalin('base','Plot1Info')== 5))* 429 * 21.5/39.3700787 * 17.2/39.3700787 + area;
        area = sum(sum(evalin('base','Plot1Info')== 6))* 1018 * 14/39.3700787 * 11/39.3700787 + area;
        area = sum(sum(evalin('base','Plot1Info')== 7))* 153 * 47/39.3700787 * 21.8/39.3700787 + area;
        area = sum(sum(evalin('base','Plot1Info')== 8))* 223 * 32/39.3700787 * 22/39.3700787 + area;
        area = sum(sum(evalin('base','Plot1Info')== 9))* 46 * 41.18/39.3700787 * 81.36/39.3700787 + area;
        area = sum(sum(evalin('base','Plot1Info')== 10))* 47 * 43.06/39.3700787 * 75.13/39.3700787 + area;
        
        assignin('base','Plot1SolarArea',area)
        assignin('base','Plot1SolarPower',area*SolarPower)

    case 2
        
        panel = sum(sum(evalin('base','Plot2Info')== 1))* 233 ;
        panel = sum(sum(evalin('base','Plot2Info')== 2))* 155 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 3))* 1782 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 4))* 134 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 5))* 429 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 6))* 1018 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 7))* 153 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 8))* 223 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 9))* 107 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 10))* 111 + panel;
        assignin('base','Plot2Panel',panel)
        
        cost = sum(sum(evalin('base','Plot2Info')== 1))* 233 * 279.95 ;
        cost = sum(sum(evalin('base','Plot2Info')== 2))* 155 * 499.95 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 3))* 1782 * 34.95 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 4))* 134 * 319.99 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 5))* 429 * 114.70 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 6))* 1018 * 39.95 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 7))* 153 * 245.99 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 8))* 223 * 99.99 + cost;
        cost = sum(sum(evalin('base','Plot2Info')== 9))* 46 * 249.50 + cost;
        cost = sum(sum(evalin('base','Plot2Info')== 10))* 47 * 199.99 + cost;
        assignin('base','Plot2SolarCost',cost)
        
%         power = sum(sum(evalin('base','Plot2Info')== 1)) * 233 * SolarPower * 42.5/39.3700787 * 16/39.3700787;
%         power = sum(sum(evalin('base','Plot2Info')== 2)) * 155 * SolarPower * 21/39.3700787 * 48/39.3700787+ power;
%         power = sum(sum(evalin('base','Plot2Info')== 3)) * 1782 * SolarPower * 11/39.3700787 * 8/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 4))* 134 * SolarPower * 45/39.3700787 * 26/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 5))* 429 * SolarPower * 21.5/39.3700787 * 17.2/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 6))* 1018 * SolarPower * 14/39.3700787 * 11/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 7))* 153 * SolarPower * 47/39.3700787 * 21.8/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 8))* 223 * SolarPower * 32/39.3700787 * 22/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 9))* 46 * SolarPower * 41.18/39.3700787 * 81.36/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 10))* 47 * SolarPower * 43.06/39.3700787 * 75.13/39.3700787 + power;
%         assignin('base','Plot2SolarPower',panel*SolarPower)
        
        area = sum(sum(evalin('base','Plot2Info')== 1)) * 233 * 42.5/39.3700787 * 16/39.3700787;
        area = sum(sum(evalin('base','Plot2Info')== 2)) * 155 * 21/39.3700787 * 48/39.3700787 + area;
        area = sum(sum(evalin('base','Plot2Info')== 3)) * 1782 * 11/39.3700787 * 8/39.3700787 + area;
        area = sum(sum(evalin('base','Plot2Info')== 4))* 134 * 45/39.3700787 * 26/39.3700787 + area;
        area = sum(sum(evalin('base','Plot2Info')== 5))* 429 * 21.5/39.3700787 * 17.2/39.3700787 + area;
        area = sum(sum(evalin('base','Plot2Info')== 6))* 1018 * 14/39.3700787 * 11/39.3700787 + area;
        area = sum(sum(evalin('base','Plot2Info')== 7))* 153 * 47/39.3700787 * 21.8/39.3700787 + area;
        area = sum(sum(evalin('base','Plot2Info')== 8))* 223 * 32/39.3700787 * 22/39.3700787 + area;
        area = sum(sum(evalin('base','Plot2Info')== 9))* 46 * 41.18/39.3700787 * 81.36/39.3700787 + area;
        area = sum(sum(evalin('base','Plot2Info')== 10))* 47 * 43.06/39.3700787 * 75.13/39.3700787 + area;
        
        assignin('base','Plot2SolarArea',area)
        assignin('base','Plot2SolarPower',area*SolarPower)
        
    case 3
        
        panel = sum(sum(evalin('base','Plot3Info')== 1))* 233 ;
        panel = sum(sum(evalin('base','Plot3Info')== 2))* 155 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 3))* 1782 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 4))* 134 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 5))* 429 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 6))* 1337 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 7))* 153 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 8))* 223 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 9))* 107 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 10))* 111 + panel;
        assignin('base','Plot3Panel',panel)
        
        cost = sum(sum(evalin('base','Plot3Info')== 1))* 233 * 279.95 ;
        cost = sum(sum(evalin('base','Plot3Info')== 2))* 155 * 499.95 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 3))* 1782 * 34.95 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 4))* 134 * 319.99 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 5))* 429 * 114.70 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 6))* 1018 * 39.95 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 7))* 153 * 245.99 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 8))* 223 * 99.99 + cost;
        cost = sum(sum(evalin('base','Plot3Info')== 9))* 46 * 249.50 + cost;
        cost = sum(sum(evalin('base','Plot3Info')== 10))* 47 * 199.99 + cost;
        assignin('base','Plot3SolarCost',cost)
        
%         power = sum(sum(evalin('base','Plot3Info')== 1)) * 233 * SolarPower * 42.5/39.3700787 * 16/39.3700787;
%         power = sum(sum(evalin('base','Plot3Info')== 2)) * 155 * SolarPower * 21/39.3700787 * 48/39.3700787+ power;
%         power = sum(sum(evalin('base','Plot3Info')== 3)) * 1782 * SolarPower * 11/39.3700787 * 8/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 4))* 134 * SolarPower * 45/39.3700787 * 26/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 5))* 429 * SolarPower * 21.5/39.3700787 * 17.2/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 6))* 1018 * SolarPower * 14/39.3700787 * 11/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 7))* 153 * SolarPower * 47/39.3700787 * 21.8/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 8))* 223 * SolarPower * 32/39.3700787 * 22/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 9))* 46 * SolarPower * 41.18/39.3700787 * 81.36/39.3700787 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 10))* 47 * SolarPower * 43.06/39.3700787 * 75.13/39.3700787 + power;
%         assignin('base','Plot3SolarPower',panel * SolarPower)
        
        area = sum(sum(evalin('base','Plot3Info')== 1)) * 233 * 42.5/39.3700787 * 16/39.3700787;
        area = sum(sum(evalin('base','Plot3Info')== 2)) * 155 * 21/39.3700787 * 48/39.3700787 + area;
        area = sum(sum(evalin('base','Plot3Info')== 3)) * 1782 * 11/39.3700787 * 8/39.3700787 + area;
        area = sum(sum(evalin('base','Plot3Info')== 4))* 134 * 45/39.3700787 * 26/39.3700787 + area;
        area = sum(sum(evalin('base','Plot3Info')== 5))* 429 * 21.5/39.3700787 * 17.2/39.3700787 + area;
        area = sum(sum(evalin('base','Plot3Info')== 6))* 1018 * 14/39.3700787 * 11/39.3700787 + area;
        area = sum(sum(evalin('base','Plot3Info')== 7))* 153 * 47/39.3700787 * 21.8/39.3700787 + area;
        area = sum(sum(evalin('base','Plot3Info')== 8))* 223 * 32/39.3700787 * 22/39.3700787 + area;
        area = sum(sum(evalin('base','Plot3Info')== 9))* 46 * 41.18/39.3700787 * 81.36/39.3700787 + area;
        area = sum(sum(evalin('base','Plot3Info')== 10))* 47 * 43.06/39.3700787 * 75.13/39.3700787 + area;
        
        assignin('base','Plot3SolarArea',area)
        assignin('base','Plot3SolarPower',area * SolarPower)
end
assignin('base','SolarPower',evalin('base','Plot1SolarPower')+evalin('base','Plot2SolarPower')+evalin('base','Plot3SolarPower'))
assignin('base','SolarCost',evalin('base','Plot1SolarCost')+evalin('base','Plot2SolarCost')+evalin('base','Plot3SolarCost'))
assignin('base','TotalPower',evalin('base','Plot1SolarPower')+evalin('base','Plot2SolarPower')+evalin('base','Plot3SolarPower')+evalin('base','Plot1WindPower')+evalin('base','Plot2WindPower')+evalin('base','Plot3WindPower'))
assignin('base','SolarArea',evalin('base','Plot1SolarArea')+evalin('base','Plot2SolarArea')+evalin('base','Plot3SolarArea'))
assignin('base','TotalArea',evalin('base','SolarArea')+evalin('base','WindArea'))
assignin('base','PanelAmount',evalin('base','Plot1Panel')+evalin('base','Plot2Panel')+evalin('base','Plot3Panel'))
assignin('base','TotalItems',evalin('base','PanelAmount')+evalin('base','TurbAmount'))
assignin('base','TotalCost',evalin('base','SolarCost')+evalin('base','WindCost'))

hands = evalin('base','Hands');
CostToKW = getfield(hands,'CostToKW');
set(CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))

end

        
        
        
% Sunforce 50048/ Amorphous Silicon/ 15 W/ 42.5in x 1.5in x 16in / 11 lbs / $279.95
% Sunforce 39810/ Polycrystalline / SolarPower W/ 21in x 48in x 2in/ 22lbs/ $499.95
% Instapark SPCC-5W/ Mono-crystalline/ SolarPower W/ 11in x 8in x 1in/ 2.8 lbs/ $34.95
% Instapark SP-100W/ Mono-crystalline/ SolarPower W/ 45in x 1.5in x 26in/ 21 lbs/ $319.99
% Instapark SPCC-30W/ Mono-crystalline/ SolarPower W/ 21.5in x 1.1in x 17.2in/ 7.2 lbs/ $114.70
% Instapark SP-10W/ Mono-crystalline/ SolarPower W/ 14in x 11in x 1in/ 2.8 lbs/ $39.95
% Ramsond/ 100SP/ Mono-crystalline/ SolarPower W/ 47in x 1.5in x 21.8in/ 12 lbs/ $245.99
% Epcom WK50-12/ Polycrystalline/ SolarPower W/ 32in x 22in x 1.4in/ 12 lbs/ $99.99
% Sun Power E18/ Mono-crystalline/ SolarPower W/ 41.18in x 81.36in x 2.13in/ 56 lbs / $249.50
% Sun Power T5/ Mono-crystalline/ SolarPower W/ 43.06in x 75.13in x 8.37in/ 47 lbs/ $199.99
% Windmax HY 1000-5/ Wind Generator/ 1000 W/ 15ft/ $999.99
% Windmax HY 400/ Wind Generator/ 500 W/ 13 ft/ $686.40
% GudCraft WG400/ Wind Generator/ SolarPower W/ 13 ft/ $399.00
% GudCraft WG700/ Wind Generator/ 700 W/ 13 ft/ $449.00
% All Power America APWT400A/ SolarPower W/ SolarPower ft/ $476.93
% Sunforce 45444/ Wind Turbine/ 600 W/ SolarPower ft/ $749.99
% Sunforce 44444/ Wind Generator/ SolarPower W/ SolarPower ft/ $474.34
% WindyNation WCK-750/ Wind Turbine/ 750 W/ 15 ft/ $999.98
