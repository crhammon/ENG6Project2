function updateWind(choice)

switch choice
    
    case 1
        
        turb = sum(sum(evalin('base','Plot1Info')== 11))* multiplier ;
        turb = sum(sum(evalin('base','Plot1Info')== 12))* multiplier + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 13))* multiplier + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 14))* multiplier + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 15))* multiplier + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 16))* multiplier + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 17))* multiplier + turb;        
        turb = sum(sum(evalin('base','Plot1Info')== 18))* multiplier + turb;
        assignin('base','Plot1Turb',turb)
        
        cost = sum(sum(evalin('base','Plot1Info')== 11))* multiplier ;
        cost = sum(sum(evalin('base','Plot1Info')== 12))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 13))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 14))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 15))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 16))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 17))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot1Info')== 18))* multiplier + cost ;
        assignin('base','Plot1Cost',cost)
        
        power = sum(sum(evalin('base','Plot1Info')== 11)) * 529 * 15;
        power = sum(sum(evalin('base','Plot1Info')== 12)) * multiplier * 80 + power;
        power = sum(sum(evalin('base','Plot1Info')== 13)) * multiplier * 5 + power;
        power = sum(sum(evalin('base','Plot1Info')== 14)) * multiplier * 100 + power;
        power = sum(sum(evalin('base','Plot1Info')== 15)) * multiplier * 30 + power;
        power = sum(sum(evalin('base','Plot1Info')== 16)) * multiplier * 10 + power;
        power = sum(sum(evalin('base','Plot1Info')== 17)) * multiplier * 100 + power;
        power = sum(sum(evalin('base','Plot1Info')== 18)) * multiplier * 50 + power;
        assignin('base','Plot1WindPower',power)
        
        area = sum(sum(evalin('base','Plot1Info')== 1)) * 529 * 42.5 * 16;
        area = sum(sum(evalin('base','Plot1Info')== 2)) * 357 * 21 * 48 + area;
        area = sum(sum(evalin('base','Plot1Info')== 3)) * 4090 * 11 * 8 + area;
        area = sum(sum(evalin('base','Plot1Info')== 4)) * multiplier * 45 * 26 + area;
        area = sum(sum(evalin('base','Plot1Info')== 5)) * multiplier * 21.5 * 17.2 + area;
        area = sum(sum(evalin('base','Plot1Info')== 6)) * multiplier * 14 * 11 + area;
        area = sum(sum(evalin('base','Plot1Info')== 7)) * multiplier * 47 * 21.8 + area;
        area = sum(sum(evalin('base','Plot1Info')== 8)) * multiplier * 32 * 22 + area;
        area = sum(sum(evalin('base','Plot1Info')== 9)) * multiplier * 41.18 * 81.36 + area;
        area = sum(sum(evalin('base','Plot1Info')== 10)) * multiplier * 43.06 * 75.13 + area;
        area = area/144;    
        assignin('base','Plot1WindArea',area)
                                             
    case 2
        
        turb = sum(sum(evalin('base','Plot2Info')== 1))* multiplier ;
        turb = sum(sum(evalin('base','Plot2Info')== 2))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 3))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 4))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 5))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 6))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 7))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 8))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 9))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot2Info')== 10))* multiplier + turb;
        assignin('base','Plot2Turb',turb)
        
        cost = sum(sum(evalin('base','Plot2Info')== 11))* multiplier ;
        cost = sum(sum(evalin('base','Plot2Info')== 12))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 13))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 14))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 15))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 16))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 17))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot2Info')== 18))* multiplier + cost ;
        assignin('base','Plot2Cost',cost)
        
        power = sum(sum(evalin('base','Plot2Info')== 1)) * multiplier * 15;
        power = sum(sum(evalin('base','Plot2Info')== 2)) * multiplier * 80 + power;
        power = sum(sum(evalin('base','Plot2Info')== 3)) * multiplier * 5 + power;
        power = sum(sum(evalin('base','Plot2Info')== 4)) * multiplier * 100 + power;
        power = sum(sum(evalin('base','Plot2Info')== 5)) * multiplier * 30 + power;
        power = sum(sum(evalin('base','Plot2Info')== 6)) * multiplier * 10 + power;
        power = sum(sum(evalin('base','Plot2Info')== 7)) * multiplier * 100 + power;
        power = sum(sum(evalin('base','Plot2Info')== 8)) * multiplier * 50 + power;
        power = sum(sum(evalin('base','Plot2Info')== 9)) * multiplier * 400 + power;
        power = sum(sum(evalin('base','Plot2Info')== 10)) * multiplier * 320 + power;
        assignin('base','Plot2WindPower',power)
        
        area = sum(sum(evalin('base','Plot2Info')== 1)) * multiplier * 42.5 * 16;
        area = sum(sum(evalin('base','Plot2Info')== 2)) * multiplier * 21 * 48 + area;
        area = sum(sum(evalin('base','Plot2Info')== 3)) * multiplier * 11 * 8 + area;
        area = sum(sum(evalin('base','Plot2Info')== 4)) * multiplier * 45 * 26 + area;
        area = sum(sum(evalin('base','Plot2Info')== 5)) * multiplier * 21.5 * 17.2 + area;
        area = sum(sum(evalin('base','Plot2Info')== 6)) * multiplier * 14 * 11 + area;
        area = sum(sum(evalin('base','Plot2Info')== 7)) * multiplier * 47 * 21.8 + area;
        area = sum(sum(evalin('base','Plot2Info')== 8)) * multiplier * 32 * 22 + area;
        area = sum(sum(evalin('base','Plot2Info')== 9)) * multiplier * 41.18 * 81.36 + area;
        area = sum(sum(evalin('base','Plot2Info')== 10)) * multiplier * 43.06 * 75.13 + area;
        area = area/144;
        assignin('base','Plot2WindArea',area)
        
    case 3
        
        turb = sum(sum(evalin('base','Plot3Info')== 1))* multiplier ;
        turb = sum(sum(evalin('base','Plot3Info')== 2))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 3))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 4))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 5))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 6))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 7))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 8))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 9))* multiplier + turb;
        turb = sum(sum(evalin('base','Plot3Info')== 10))* multiplier + turb;
        assignin('base','Plot3Turb',turb)
        
        cost = sum(sum(evalin('base','Plot3Info')== 11))* multiplier ;
        cost = sum(sum(evalin('base','Plot3Info')== 12))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 13))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 14))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 15))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 16))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 17))* multiplier + cost ;        
        cost = sum(sum(evalin('base','Plot3Info')== 18))* multiplier + cost ;
        assignin('base','Plot3Cost',cost)
        
        power = sum(sum(evalin('base','Plot3Info')== 1)) * multiplier * 15;
        power = sum(sum(evalin('base','Plot3Info')== 2)) * multiplier * 80 + power;
        power = sum(sum(evalin('base','Plot3Info')== 3)) * multiplier * 5 + power;
        power = sum(sum(evalin('base','Plot3Info')== 4)) * multiplier * 100 + power;
        power = sum(sum(evalin('base','Plot3Info')== 5)) * multiplier * 30 + power;
        power = sum(sum(evalin('base','Plot3Info')== 6)) * multiplier * 10 + power;
        power = sum(sum(evalin('base','Plot3Info')== 7)) * multiplier * 100 + power;
        power = sum(sum(evalin('base','Plot3Info')== 8)) * multiplier * 50 + power;
        power = sum(sum(evalin('base','Plot3Info')== 9)) * multiplier * 400 + power;
        power = sum(sum(evalin('base','Plot3Info')== 10)) * multiplier * 320 + power;
        assignin('base','Plot3WindPower',power)        
        
        area = sum(sum(evalin('base','Plot3Info')== 1)) * multiplier * 42.5 * 16;
        area = sum(sum(evalin('base','Plot3Info')== 2)) * multiplier * 21 * 48 + area;
        area = sum(sum(evalin('base','Plot3Info')== 3)) * multiplier * 11 * 8 + area;
        area = sum(sum(evalin('base','Plot3Info')== 4)) * multiplier * 45 * 26 + area;
        area = sum(sum(evalin('base','Plot3Info')== 5)) * multiplier * 21.5 * 17.2 + area;
        area = sum(sum(evalin('base','Plot3Info')== 6)) * multiplier * 14 * 11 + area;
        area = sum(sum(evalin('base','Plot3Info')== 7)) * multiplier * 47 * 21.8 + area;
        area = sum(sum(evalin('base','Plot3Info')== 8)) * multiplier * 32 * 22 + area;
        area = sum(sum(evalin('base','Plot3Info')== 9)) * multiplier * 41.18 * 81.36 + area;
        area = sum(sum(evalin('base','Plot3Info')== 10)) * multiplier * 43.06 * 75.13 + area;
        area = area/144;
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
