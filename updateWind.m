function updateWind(choice)

WindPower = evalin('base','WindAvg');

switch choice
    
    case 1
        
        turb = sum(sum(evalin('base','Plot1Info')== 11))* 3;
        turb = sum(sum(evalin('base','Plot1Info')== 12))* 4 + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 13))* 4 + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 14))* 4 + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 15))* 7 + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 16))* 7 + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 17))* 7 + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 18))* 3 + turb;
        assignin('base','Plot1Turb',turb)
        
        cost = sum(sum(evalin('base','Plot1Info')== 11))* 3 * 999.99 ;
        cost = sum(sum(evalin('base','Plot1Info')== 12))* 4 * 686.40 + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 13))* 4 * 399.00 + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 14))* 4 * 449.00 + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 15))* 7 * 476.93 + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 16))* 7 * 749.99 + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 17))* 7 * 474.34 + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 18))* 3 * 999.98 + cost ;
        assignin('base','Plot1WindCost',cost)
        
%         power = sum(sum(evalin('base','Plot1Info')== 11)) * 20 * 400;
%         power = sum(sum(evalin('base','Plot1Info')== 12)) *1* 80 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 13)) *1* 5 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 14)) *1* 100 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 15)) *1* 30 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 16)) *1* 10 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 17)) *1* 100 + power;
%         power = sum(sum(evalin('base','Plot1Info')== 18)) *1* 50 + power;
        assignin('base','Plot1WindPower',turb*WindPower)
        
        area = sum(sum(evalin('base','Plot1Info')== 11)) * 3 * 15^2 * pi ;
        area = sum(sum(evalin('base','Plot1Info')== 12)) * 4 * 13^2 * pi + area;
        area = sum(sum(evalin('base','Plot1Info')== 13)) * 4 * 13^2 * pi + area;
        area = sum(sum(evalin('base','Plot1Info')== 14)) * 4 * 13^2 * pi + area;
        area = sum(sum(evalin('base','Plot1Info')== 15)) * 7 * 10^2 * pi + area;
        area = sum(sum(evalin('base','Plot1Info')== 16)) * 7 * 10^2 * pi + area;
        area = sum(sum(evalin('base','Plot1Info')== 17)) * 7 * 10^2 * pi + area;
        area = sum(sum(evalin('base','Plot1Info')== 18)) * 3 * 15^2 * pi + area;
       
        assignin('base','Plot1WindArea',area)
                                             
    case 2
        
        turb = sum(sum(evalin('base','Plot2Info')== 11))* 3;
        turb = sum(sum(evalin('base','Plot2Info')== 12))* 4 + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 13))* 4 + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 14))* 4 + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 15))* 7 + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 16))* 7 + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 17))* 7 + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 18))* 3 + turb;
        
        assignin('base','Plot2Turb',turb)
        
        cost = sum(sum(evalin('base','Plot2Info')== 11))* 3 * 999.99 ;
        cost = sum(sum(evalin('base','Plot2Info')== 12))* 4 * 686.40 + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 13))* 4 * 399.00 + cost ;       
        cost = sum(sum(evalin('base','Plot2Info')== 14))* 4 * 449.00 + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 15))* 7 * 476.93 + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 16))* 7 * 749.99 + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 17))* 7 * 474.34 + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 18))* 3 * 999.98 + cost ;
        assignin('base','Plot2WindCost',cost)
        
%         power = sum(sum(evalin('base','Plot2Info')== 11)) *1* 15;
%         power = sum(sum(evalin('base','Plot2Info')== 12)) *1* 80 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 13)) *1* 5 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 14)) *1* 100 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 15)) *1* 30 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 16)) *1* 10 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 17)) *1* 100 + power;
%         power = sum(sum(evalin('base','Plot2Info')== 18)) *1* 50 + power;
        
        assignin('base','Plot2WindPower',turb * WindPower)
        
        area = sum(sum(evalin('base','Plot2Info')== 11)) * 3 * 15^2 * pi ;
        area = sum(sum(evalin('base','Plot2Info')== 12)) * 4 * 13^2 * pi + area;
        area = sum(sum(evalin('base','Plot2Info')== 13)) * 4 * 13^2 * pi + area;
        area = sum(sum(evalin('base','Plot2Info')== 14)) * 4 * 13^2 * pi + area;
        area = sum(sum(evalin('base','Plot2Info')== 15)) * 7 * 10^2 * pi + area;
        area = sum(sum(evalin('base','Plot2Info')== 16)) * 7 * 10^2 * pi + area;
        area = sum(sum(evalin('base','Plot2Info')== 17)) * 7 * 10^2 * pi + area;
        area = sum(sum(evalin('base','Plot2Info')== 18)) * 3 * 15^2 * pi + area;
        
        assignin('base','Plot2WindArea',area)
        
    case 3
        
        turb = sum(sum(evalin('base','Plot3Info')== 11))* 3;
        turb = sum(sum(evalin('base','Plot3Info')== 12))* 4 + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 13))* 4 + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 14))* 4 + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 15))* 7 + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 16))* 7 + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 17))* 7 + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 18))* 3 + turb;
        
        assignin('base','Plot3Turb',turb)
        
        cost = sum(sum(evalin('base','Plot3Info')== 11))* 3 * 999.99 ;
        cost = sum(sum(evalin('base','Plot3Info')== 12))* 4 * 686.40 + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 13))* 4 * 399.00 + cost ;       
        cost = sum(sum(evalin('base','Plot3Info')== 14))* 4 * 449.00 + cost ;         
        cost = sum(sum(evalin('base','Plot3Info')== 15))* 7 * 476.93 + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 16))* 7 * 749.99 + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 17))* 7 * 474.34 + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 18))* 3 * 999.98 + cost ;
        assignin('base','Plot3WindCost',cost)
        
%         power = sum(sum(evalin('base','Plot3Info')== 11)) *1* 15;
%         power = sum(sum(evalin('base','Plot3Info')== 12)) *1* 80 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 13)) *1* 5 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 14)) *1* 100 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 15)) *1* 30 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 16)) *1* 10 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 17)) *1* 100 + power;
%         power = sum(sum(evalin('base','Plot3Info')== 18)) *1* 50 + power;
        
        assignin('base','Plot3WindPower',turb * WindPower)        
        
        area = sum(sum(evalin('base','Plot3Info')== 11)) * 3 * 15^2 * pi ;
        area = sum(sum(evalin('base','Plot3Info')== 12)) * 4 * 13^2 * pi + area;
        area = sum(sum(evalin('base','Plot3Info')== 13)) * 4 * 13^2 * pi + area;
        area = sum(sum(evalin('base','Plot3Info')== 14)) * 4 * 13^2 * pi + area;
        area = sum(sum(evalin('base','Plot3Info')== 15)) * 7 * 10^2 * pi + area;
        area = sum(sum(evalin('base','Plot3Info')== 16)) * 7 * 10^2 * pi + area;
        area = sum(sum(evalin('base','Plot3Info')== 17)) * 7 * 10^2 * pi + area;
        area = sum(sum(evalin('base','Plot3Info')== 18)) * 3 * 15^2 * pi + area;
        
        assignin('base','Plot3WindArea',area)
end
assignin('base','WindArea',evalin('base','Plot1WindArea')+evalin('base','Plot2WindArea')+evalin('base','Plot3WindArea'))
assignin('base','WindPower',evalin('base','Plot1WindPower')+evalin('base','Plot2WindPower')+evalin('base','Plot3WindPower'))
assignin('base','WindCost',evalin('base','Plot1WindCost')+evalin('base','Plot2WindCost')+evalin('base','Plot3WindCost'))
assignin('base','TotalPower',evalin('base','WindPower')+evalin('base','SolarPower'))
assignin('base','TotalArea',evalin('base','WindArea')+evalin('base','SolarArea'))
assignin('base','TurbAmount',evalin('base','Plot1Turb')+evalin('base','Plot2Turb')+evalin('base','Plot3Turb'))
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
