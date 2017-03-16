function updateSolar(choice)



switch choice
    
    case 1
        
        panel = sum(sum(evalin('base','Plot1Info')== 1))* 529 ;
        panel = sum(sum(evalin('base','Plot1Info')== 2))* 1 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 3))* 1 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 4))* 1 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 5))* 1 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 6))* 1 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 7))* 1 + panel;        
        panel = sum(sum(evalin('base','Plot1Info')== 8))* 1 + panel;
        panel = sum(sum(evalin('base','Plot1Info')== 9))* 1 + panel;
        panel = sum(sum(evalin('base','Plot1Info')== 10))* 1 + panel;
        assignin('base','Plot1Panel',panel)
        
        cost = sum(sum(evalin('base','Plot1Info')== 1))* 529 * 279.95 ;
        cost = sum(sum(evalin('base','Plot1Info')== 2))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 3))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 4))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 5))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 6))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 7))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot1Info')== 8))* 1 + cost;
        cost = sum(sum(evalin('base','Plot1Info')== 9))* 1 + cost;
        cost = sum(sum(evalin('base','Plot1Info')== 10))* 1 + cost;
        assignin('base','Plot1SolarCost',cost)
        
        power = sum(sum(evalin('base','Plot1Info')== 1)) * 529 * 15 * 42.5 * 16 /144;
        power = sum(sum(evalin('base','Plot1Info')== 2)) * 1 * 80 + power;
        power = sum(sum(evalin('base','Plot1Info')== 3)) * 1 * 5 + power;
        power = sum(sum(evalin('base','Plot1Info')== 4)) * 1 * 100 + power;
        power = sum(sum(evalin('base','Plot1Info')== 5)) * 1 * 30 + power;
        power = sum(sum(evalin('base','Plot1Info')== 6)) * 1 * 10 + power;
        power = sum(sum(evalin('base','Plot1Info')== 7)) * 1 * 100 + power;
        power = sum(sum(evalin('base','Plot1Info')== 8)) * 1 * 50 + power;
        power = sum(sum(evalin('base','Plot1Info')== 9)) * 1 * 400 + power;
        power = sum(sum(evalin('base','Plot1Info')== 10)) * 1 * 320 + power;
        assignin('base','Plot1SolarPower',power)
        
        area = sum(sum(evalin('base','Plot1Info')== 1)) * 529 * 42.5 * 16;
        area = sum(sum(evalin('base','Plot1Info')== 2)) * 1 * 21 * 48 + area;
        area = sum(sum(evalin('base','Plot1Info')== 3)) * 1 * 11 * 8 + area;
        area = sum(sum(evalin('base','Plot1Info')== 4)) * 1 * 45 * 26 + area;
        area = sum(sum(evalin('base','Plot1Info')== 5)) * 1 * 21.5 * 17.2 + area;
        area = sum(sum(evalin('base','Plot1Info')== 6)) * 1 * 14 * 11 + area;
        area = sum(sum(evalin('base','Plot1Info')== 7)) * 1 * 47 * 21.8 + area;
        area = sum(sum(evalin('base','Plot1Info')== 8)) * 1 * 32 * 22 + area;
        area = sum(sum(evalin('base','Plot1Info')== 9)) * 1 * 41.18 * 81.36 + area;
        area = sum(sum(evalin('base','Plot1Info')== 10)) * 1 * 43.06 * 75.13 + area;
        area = area/144;
        assignin('base','Plot1SolarArea',area)

    case 2
        
        panel = sum(sum(evalin('base','Plot2Info')== 1))* 1 ;
        panel = sum(sum(evalin('base','Plot2Info')== 2))* 1 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 3))* 1 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 4))* 1 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 5))* 1 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 6))* 1 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 7))* 1 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 8))* 1 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 9))* 1 + panel;
        panel = sum(sum(evalin('base','Plot2Info')== 10))* 1 + panel;
        assignin('base','Plot2Panel',panel)
        
        cost = sum(sum(evalin('base','Plot2Info')== 1))* 1 ;
        cost = sum(sum(evalin('base','Plot2Info')== 2))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 3))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 4))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 5))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 6))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 7))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot2Info')== 8))* 1 + cost;
        cost = sum(sum(evalin('base','Plot2Info')== 9))* 1 + cost;
        cost = sum(sum(evalin('base','Plot2Info')== 10))* 1 + cost;
        assignin('base','Plot2SolarCost',cost)
        
        power = sum(sum(evalin('base','Plot2Info')== 1)) * 1 * 15;
        power = sum(sum(evalin('base','Plot2Info')== 2)) * 1 * 80 + power;
        power = sum(sum(evalin('base','Plot2Info')== 3)) * 1 * 5 + power;
        power = sum(sum(evalin('base','Plot2Info')== 4)) * 1 * 100 + power;
        power = sum(sum(evalin('base','Plot2Info')== 5)) * 1 * 30 + power;
        power = sum(sum(evalin('base','Plot2Info')== 6)) * 1 * 10 + power;
        power = sum(sum(evalin('base','Plot2Info')== 7)) * 1 * 100 + power;
        power = sum(sum(evalin('base','Plot2Info')== 8)) * 1 * 50 + power;
        power = sum(sum(evalin('base','Plot2Info')== 9)) * 1 * 400 + power;
        power = sum(sum(evalin('base','Plot2Info')== 10)) * 1 * 320 + power;
        assignin('base','Plot2SolarPower',power)
        
        area = sum(sum(evalin('base','Plot2Info')== 1)) * 1 * 42.5 * 16;
        area = sum(sum(evalin('base','Plot2Info')== 2)) * 1 * 21 * 48 + area;
        area = sum(sum(evalin('base','Plot2Info')== 3)) * 1 * 11 * 8 + area;
        area = sum(sum(evalin('base','Plot2Info')== 4)) * 1 * 45 * 26 + area;
        area = sum(sum(evalin('base','Plot2Info')== 5)) * 1 * 21.5 * 17.2 + area;
        area = sum(sum(evalin('base','Plot2Info')== 6)) * 1 * 14 * 11 + area;
        area = sum(sum(evalin('base','Plot2Info')== 7)) * 1 * 47 * 21.8 + area;
        area = sum(sum(evalin('base','Plot2Info')== 8)) * 1 * 32 * 22 + area;
        area = sum(sum(evalin('base','Plot2Info')== 9)) * 1 * 41.18 * 81.36 + area;
        area = sum(sum(evalin('base','Plot2Info')== 10)) * 1 * 43.06 * 75.13 + area;
        area = area/144;
        assignin('base','Plot2SolarArea',area)
        
    case 3
        
        panel = sum(sum(evalin('base','Plot3Info')== 1))* 1 ;
        panel = sum(sum(evalin('base','Plot3Info')== 2))* 1 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 3))* 1 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 4))* 1 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 5))* 1 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 6))* 1 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 7))* 1 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 8))* 1 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 9))* 1 + panel;
        panel = sum(sum(evalin('base','Plot3Info')== 10))* 1 + panel;
        assignin('base','Plot3Panel',panel)
        
        cost = sum(sum(evalin('base','Plot3Info')== 1))* 1 ;
        cost = sum(sum(evalin('base','Plot3Info')== 2))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 3))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 4))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 5))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 6))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 7))* 1 + cost;        
        cost = sum(sum(evalin('base','Plot3Info')== 8))* 1 + cost;
        cost = sum(sum(evalin('base','Plot3Info')== 9))* 1 + cost;
        cost = sum(sum(evalin('base','Plot3Info')== 10))* 1 + cost;
        assignin('base','Plot3SolarCost',cost)
        
        power = sum(sum(evalin('base','Plot3Info')== 1)) * 1 * 15;
        power = sum(sum(evalin('base','Plot3Info')== 2)) * 1 * 80 + power;
        power = sum(sum(evalin('base','Plot3Info')== 3)) * 1 * 5 + power;
        power = sum(sum(evalin('base','Plot3Info')== 4)) * 1 * 100 + power;
        power = sum(sum(evalin('base','Plot3Info')== 5)) * 1 * 30 + power;
        power = sum(sum(evalin('base','Plot3Info')== 6)) * 1 * 10 + power;
        power = sum(sum(evalin('base','Plot3Info')== 7)) * 1 * 100 + power;
        power = sum(sum(evalin('base','Plot3Info')== 8)) * 1 * 50 + power;
        power = sum(sum(evalin('base','Plot3Info')== 9)) * 1 * 400 + power;
        power = sum(sum(evalin('base','Plot3Info')== 10)) * 1 * 320 + power;
        assignin('base','Plot3SolarPower',power)        
        
        area = sum(sum(evalin('base','Plot3Info')== 1)) * 1 * 42.5 * 16;
        area = sum(sum(evalin('base','Plot3Info')== 2)) * 1 * 21 * 48 + area;
        area = sum(sum(evalin('base','Plot3Info')== 3)) * 1 * 11 * 8 + area;
        area = sum(sum(evalin('base','Plot3Info')== 4)) * 1 * 45 * 26 + area;
        area = sum(sum(evalin('base','Plot3Info')== 5)) * 1 * 21.5 * 17.2 + area;
        area = sum(sum(evalin('base','Plot3Info')== 6)) * 1 * 14 * 11 + area;
        area = sum(sum(evalin('base','Plot3Info')== 7)) * 1 * 47 * 21.8 + area;
        area = sum(sum(evalin('base','Plot3Info')== 8)) * 1 * 32 * 22 + area;
        area = sum(sum(evalin('base','Plot3Info')== 9)) * 1 * 41.18 * 81.36 + area;
        area = sum(sum(evalin('base','Plot3Info')== 10)) * 1 * 43.06 * 75.13 + area;
        area = area/144;
        assignin('base','Plot3SolarArea',area)
end
assignin('base','SolarPower',evalin('base','Plot1SolarPower')+evalin('base','Plot2SolarPower')+evalin('base','Plot3SolarPower'))
assignin('base','SolarCost',evalin('base','Plot1SolarCost')+evalin('base','Plot2SolarCost')+evalin('base','Plot3SolarCost'))
assignin('base','TotalPower',evalin('base','Plot1SolarPower')+evalin('base','Plot2SolarPower')+evalin('base','Plot3SolarPower')+evalin('base','Plot1WindPower')+evalin('base','Plot2WindPower')+evalin('base','Plot3WindPower'))
assignin('base','SolarArea',evalin('base','Plot1SolarArea')+evalin('base','Plot2SolarArea')+evalin('base','Plot3SolarArea'))
assignin('base','TotalArea',evalin('base','SolarArea')+evalin('base','WindArea'))
assignin('base','PanelAmount',evalin('base','Plot1Panel')+evalin('base','Plot2Panel')+evalin('base','Plot3Panel'))
assignin('base','TotalItems',evalin('base','PanelAmount')+evalin('base','TurbAmount'))
assignin('base','TotalCost',evalin('base','SolarCost')+evalin('base','WindCost'))
end

        
        
        
% Sunforce 50048/ Amorphous Silicon/ 15 W/ 42.5in x 1.5in x 16in / 11 lbs / $279.95
% Sunforce 39810/ Polycrystalline / 80 W/ 21in x 48in x 2in/ 22lbs/ $499.95
% Instapark SPCC-5W/ Mono-crystalline/ 5 W/ 11in x 8in x 1in/ 2.8 lbs/ $34.95
% Instapark SP-100W/ Mono-crystalline/ 100 W/ 45in x 1.5in x 26in/ 21 lbs/ $319.99
% Instapark SPCC-30W/ Mono-crystalline/ 30 W/ 21.5in x 1.1in x 17.2in/ 7.2 lbs/ $114.70
% Instapark SP-10W/ Mono-crystalline/ 10 W/ 14in x 11in x 1in/ 2.8 lbs/ $39.95
% Ramsond/ 100SP/ Mono-crystalline/ 100 W/ 47in x 1.5in x 21.8in/ 12 lbs/ $245.99
% Epcom WK50-12/ Polycrystalline/ 50 W/ 32in x 22in x 1.4in/ 12 lbs/ $99.99
% Sun Power E18/ Mono-crystalline/ 400 W/ 41.18in x 81.36in x 2.13in/ 56 lbs / $249.50
% Sun Power T5/ Mono-crystalline/ 320 W/ 43.06in x 75.13in x 8.37in/ 47 lbs/ $199.99
% Windmax HY 1000-5/ Wind Generator/ 1000 W/ 15ft/ $999.99
% Windmax HY 400/ Wind Generator/ 500 W/ 13 ft/ $686.40
% GudCraft WG400/ Wind Generator/ 400 W/ 13 ft/ $399.00
% GudCraft WG700/ Wind Generator/ 700 W/ 13 ft/ $449.00
% All Power America APWT400A/ 400 W/ 10 ft/ $476.93
% Sunforce 45444/ Wind Turbine/ 600 W/ 10 ft/ $749.99
% Sunforce 44444/ Wind Generator/ 400 W/ 10 ft/ $474.34
% WindyNation WCK-750/ Wind Turbine/ 750 W/ 15 ft/ $999.98
