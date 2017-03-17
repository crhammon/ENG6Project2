function varargout = Proj2V3(varargin)
% PROJ2V3 MATLAB code for Proj2V3.fig
%      PROJ2V3, by itself, creates a new PROJ2V3 or raises the existing
%      singleton*.
%
%      H = PROJ2V3 returns the handle to a new PROJ2V3 or the handle to
%      the existing singleton*.
%
%      PROJ2V3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJ2V3.M with the given input arguments.
%
%      PROJ2V3('Property','Value',...) creates a new PROJ2V3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proj2V3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proj2V3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proj2V3

% Last Modified by GUIDE v2.5 16-Mar-2017 23:18:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proj2V3_OpeningFcn, ...
                   'gui_OutputFcn',  @Proj2V3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Proj2V3 is made visible.
function Proj2V3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proj2V3 (see VARARGIN)
logo=imread('Welcome.png');
imshow(logo);

assignin('base','Hands',guihandles(handles.figure1))

assignin('base','PanelAmount',0)
assignin('base','TurbAmount',0)
assignin('base','SolarPower',0)
assignin('base','WindPower',0)
assignin('base','SolarCost',0)
assignin('base','WindCost',0)
assignin('base','WindArea',0)
assignin('base','SolarArea',0)
assignin('base','TotalCost',0)
assignin('base','TotalArea',0)
assignin('base','TotalPower',0)

assignin('base','Plot1WindArea',0)
assignin('base','Plot1WindCost',0)
assignin('base','Plot1WindPower',0)
assignin('base','Plot1Turb',0)

assignin('base','Plot2WindArea',0)
assignin('base','Plot2WindCost',0)
assignin('base','Plot2WindPower',0)
assignin('base','Plot2Turb',0)

assignin('base','Plot3WindArea',0)
assignin('base','Plot3WindCost',0)
assignin('base','Plot3WindPower',0)
assignin('base','Plot3Turb',0)

assignin('base','Plot1SolarArea',0)
assignin('base','Plot1SolarCost',0)
assignin('base','Plot1SolarPower',0)
assignin('base','Plot1Panel',0)

assignin('base','Plot2SolarArea',0)
assignin('base','Plot2SolarCost',0)
assignin('base','Plot2SolarPower',0)
assignin('base','Plot2Panel',0)

assignin('base','Plot3SolarArea',0)
assignin('base','Plot3SolarCost',0)
assignin('base','Plot3SolarPower',0)
assignin('base','Plot3Panel',0)

load WeatherData.mat
assignin('base','FargoWindAvg',mean(Fargo_win)*600);
assignin('base','FargoSolarAvg',mean(Fargo_sol))
assignin('base','HonoluluWindAvg',mean(Honolulu_win)*600);
assignin('base','HonoluluSolarAvg',mean(Honolulu_sol))
assignin('base','MiamiWindAvg',mean(Miami_win)*600);
assignin('base','MiamiSolarAvg',mean(Miami_sol))

assignin('base','limit',0)

assignin('base','f',0)

image=imread('Plot1.png');
b=size([1:15:size(image,1)]);%gives number of rows
c=size([1:15:size(image,2)]);%gives number of columns
assignin('base','Plot1Info',zeros(b(2),c(2)))

image=imread('Plot2.png');
b=size([1:15:size(image,1)]);%gives number of rows
c=size([1:15:size(image,2)]);%gives number of columns
assignin('base','Plot2Info',zeros(b(2),c(2)))

image=imread('Plot3.png');
b=size([1:15:size(image,1)]);%gives number of rows
c=size([1:15:size(image,2)]);%gives number of columns
assignin('base','Plot3Info',zeros(b(2),c(2)))
% Choose default command line output for Proj2V3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proj2V3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proj2V3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
    Plot1Info=evalin('base','Plot1Info');
    Plot1Info(:,:)=0;
    assignin('base','Plot1Info',Plot1Info);
    
    updateSolar(1);
    updateWind(1);
    set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
    set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
    set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
    set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
    set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
    set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
    set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
    set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
    set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
    set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
    set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
    set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
    set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
    
elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
    Plot2Info=evalin('base','Plot2Info');
    Plot2Info(:,:)=0;
    assignin('base','Plot2Info',Plot2Info);
    
    updateSolar(2);
    updateWind(2);
    set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
    set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
    set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
    set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
    set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
    set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
    set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
    set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
    set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
    set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
    set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
    set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
    set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
    
elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
    Plot3Info=evalin('base','Plot3Info');
    Plot3Info(:,:)=0;
    assignin('base','Plot3Info',Plot3Info);
    
    updateSolar(3);
    updateWind(3);
    set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
    set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
    set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
    set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
    set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
    set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
    set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
    set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
    set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
    set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
    set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
    set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
    set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
    
end
plotChoice_Callback(handles.plotChoice,eventdata,handles)


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
yes=menu('Warning! This will erase your current data, would you like to continue?','Yes','No')
if yes==1
    try
        reset_Callback(handles.reset, eventdata, handles)

        d=menu('Load Data for Which City?','Fargo, ND','Honolulu, HI','Miami, FL')
       A=uiimport;
        A=struct2cell(A);
        A=cell2mat(A);
        switch d
                case 1
                    assignin('base','Plot1Info',A);
                case 2
                    assignin('base','Plot2Info',A);
                case 3
                    assignin('base','Plot3Info',A);
        end
        plotChoice_Callback(handles.plotChoice, eventdata, handles)
    catch
    end
else
    
end



% --- Executes on button press in saveImage.
function saveImage_Callback(hObject, eventdata, handles)
% hObject    handle to saveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
d=menu('Save Image for Which City?','Fargo, ND','Honolulu, HI','Miami, FL')
frame=evalin('base','frame')
switch d
    case 1
        [file,path] = uiputfile({'*.png'},'Save as');
        imwrite(frame.cdata,[path,file])
    case 2
        [file,path] = uiputfile({'*.png'},'Save as');
        imwrite(frame.cdata,[path,file])
        
    case 3
        [file,path] = uiputfile({'*.png'},'Save as');
        imwrite(frame.cdata,[path,file])
end
catch
end



% --- Executes on button press in printMaterials.
function printMaterials_Callback(hObject, eventdata, handles)
% hObject    handle to printMaterials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
name2=evalin('base','name');
if name2 == 'Plot1.jpg'
    Plot1Info=evalin('base','Plot1Info');
    
    sf500=find(Plot1Info == 1);
    totalsf500=numel(sf500) * 529;
    costsf500=totalsf500 * 279.95 * 529;
    
    sf398=find(Plot1Info == 2);
    totalsf398=numel(sf398) * 357;
    costsf398=totalsf398 * 499.95 * 357;
    
    isp5w=find(Plot1Info == 3);
    totalisp5w=numel(isp5w) * 4090;
    costisp5w= totalisp5w * 34.95 * 4090;
    
    isp100w=find(Plot1Info == 4);
    totalisp100w=numel(isp100w) * 307;
    costisp100w= totalisp100w * 319.99 * 307;
    
    isp30w=find(Plot1Info == 5);
    totalisp30w=numel(isp30w) * 973;
    costisp30w= totalisp30w *114.70 * 973;
    
    isp10w=find(Plot1Info == 6);
    totalisp10w=numel(isp10w) * 2337;
    costisp10w=totalisp10w * 39.95 * 2337;
    
    ras100=find(Plot1Info == 7);
    totalras100=numel(ras100) * 351;
    costras100= totalras100 * 245.99 * 351;
    
    epcom=find(Plot1Info == 8);
    totalepcom=numel(epcom) * 511;
    costepcom= totalepcom * 99.99 * 511;
    
    spe18=find(Plot1Info == 9);
    totalspe18=numel(spe18) * 107;
    costspe18= totalspe18 * 249.50 * 107;
    
    spt5=find(Plot1Info == 10);
    totalspt5=numel(spt5) * 111;
    costspt5= totalspt5 * 199.99 * 111;
    
    why1000=find(Plot1Info == 11);
    totalwhy1000=numel(why1000) * 3;
    costwhy1000= totalwhy1000 * 999.99 * 3;
    
    why400=find(Plot1Info == 12);
    totalwhy400=numel(why400) * 4;
    costwhy400= totalwhy400 * 686.40 * 4;
    
    wg400=find(Plot1Info == 13);
    totalwg400=numel(wg400) * 4;
    costwg400=totalwg400 * 399.00 * 4;
    
    wg700=find(Plot1Info == 14);
    totalwg700=numel(wg700) * 4;
    costwg700= totalwg700 *449.99 * 4;
    
    apwt=find(Plot1Info == 15);
    totalapwt=numel(apwt) * 7;
    costapwt=totalapwt * 476.93 * 7;
    
    sf454=find(Plot1Info == 16);
    totalsf454=numel(sf454)* 7;
    costsf454=totalsf454 * 749.99 * 7;
    
    sf444=find(Plot1Info == 17);
    totalsf444=numel(sf444) * 7;
    costsf444=totalsf444 * 474.34 * 7;
    
    wck750=find(Plot1Info == 18);
    totalwck750=numel(wck750) * 3;
    costwck750=totalwck750 * 999.98 * 3;
    
    amounttotal=totalsf500+totalsf398+totalisp5w+totalisp100w+totalisp30w+totalisp10w+totalras100+totalepcom+totalspe18+totalspt5+totalwhy1000+totalwhy400+totalwg400+totalwg700+totalapwt+totalsf454+totalsf444+totalwck750;
    costtotal= costsf500+costsf398+ costisp5w+costisp100w+costisp30w+costisp10w+costras100+costepcom+costspe18+costspt5+costwhy1000+costwhy400+costwg400+costwg700+costapwt+costsf454+costsf444+costwck750;
    [filename, pathname] = uiputfile('Bill_Of_Materials_Fargo_ND.txt');
    path_file=fullfile(pathname,filename);
    file=fopen(path_file,'w');
    fprintf(file,'Bill of Materials : Fargo, ND\r\n');
    fprintf(file,'Material\t\t');
    fprintf(file,'Amount\t\t\t\t');
    fprintf(file,'Cost\t\t\t\r\n');
    
    if totalsf500>0
    fprintf(file,'Sunforce 50048\t\t');
    fprintf(file,num2str(totalsf500));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf500));
    fprintf(file,'\r\n');
    end
    
    if totalsf398>0
    fprintf(file,'Sunforce 39810\t\t');
    fprintf(file,num2str(totalsf398));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf398));
    fprintf(file,'\r\n');
    end
    
    if totalisp5w>0
    fprintf(file,'Instapark SPCC-5W\t');
    fprintf(file,num2str(totalisp5w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp5w));
    fprintf(file,'\r\n');
    end
    
    if totalisp100w>0
    fprintf(file,'Instapark SP-100W\t');
    fprintf(file,num2str(totalisp100w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp100w));
    fprintf(file,'\r\n');
    end
    
    if totalisp30w>0
    fprintf(file,'Instapark SPCC-30W\t');
    fprintf(file,num2str(totalisp30w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp30w));
    fprintf(file,'\r\n');
    end
    
    if totalisp10w>0
    fprintf(file,'Instapark SP-10w\t');
    fprintf(file,num2str(totalisp10w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp10w));
    fprintf(file,'\r\n');
    end
    
    if totalras100>0
    fprintf(file,'Rasmond 100SP\t\t');
    fprintf(file,num2str(totalras100));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costras100));
    fprintf(file,'\r\n');
    end
    
    if totalepcom>0
    fprintf(file,'Epcom Wk50-12\t\t');
    fprintf(file,num2str(totalepcom));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costepcom));
    fprintf(file,'\r\n');
    end
    
    if totalspe18>0
    fprintf(file,'Sun Power E18\t\t');
    fprintf(file,num2str(totalspe18));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costspe18));
    fprintf(file,'\r\n');
    end
    
    if totalspt5>0
    fprintf(file,'Sun Power T5\t\t');
    fprintf(file,num2str(totalspt5));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costspt5));
    fprintf(file,'\r\n');
    end
    
    if totalwhy1000>0
    fprintf(file,'Windmax HY1000-5\t');
    fprintf(file,num2str(totalwhy1000));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwhy1000));
    fprintf(file,'\r\n');
    end
    
    if totalwhy400>0
    fprintf(file,'Windmax HY400\t\t');
    fprintf(file,num2str(totalwhy400));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwhy400));
    fprintf(file,'\r\n');
    end
    
    if totalwg400>0
    fprintf(file,'GudCraft WG400\t\t');
    fprintf(file,num2str(totalwg400));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwg400));
    fprintf(file,'\r\n');
    end
    
    if totalwg700>0
    fprintf(file,'GudCraft WG700\t\t');
    fprintf(file,num2str(totalwg700));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwg700));
    fprintf(file,'\r\n');
    end
    
    if totalapwt>0
    fprintf(file,'All Power America\t');
    fprintf(file,num2str(totalapwt));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costapwt));
    fprintf(file,'\r\n');
    end
    
    if totalsf454>0
    fprintf(file,'Sunforce 45444\t\t');
    fprintf(file,num2str(totalsf454));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf454));
    fprintf(file,'\r\n');
    end
    
    if totalsf444>0
    fprintf(file,'Sunforce 44444\t\t');
    fprintf(file,num2str(totalsf444));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf444));
    fprintf(file,'\r\n');
    end
    
    if totalwck750>0
    fprintf(file,'WindyNation WCK-750\t');
    fprintf(file,num2str(totalwck750));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwck750));
    fprintf(file,'\r\n');
    end
    
    fprintf(file,'Total\t\t\t');
    fprintf(file,num2str(amounttotal));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costtotal));
    if ispc==1
        winopen(path_file);
    end
    
    
elseif name2 == 'Plot2.jpg'
    Plot1Info=evalin('base','Plot2Info');
    
        sf500=find(Plot1Info == 1);
    totalsf500=numel(sf500) * 529;
    costsf500=totalsf500 * 279.95 * 529;
    
    sf398=find(Plot1Info == 2);
    totalsf398=numel(sf398) * 357;
    costsf398=totalsf398 * 499.95 * 357;
    
    isp5w=find(Plot1Info == 3);
    totalisp5w=numel(isp5w) * 4090;
    costisp5w= totalisp5w * 34.95 * 4090;
    
    isp100w=find(Plot1Info == 4);
    totalisp100w=numel(isp100w) * 307;
    costisp100w= totalisp100w * 319.99 * 307;
    
    isp30w=find(Plot1Info == 5);
    totalisp30w=numel(isp30w) * 973;
    costisp30w= totalisp30w *114.70 * 973;
    
    isp10w=find(Plot1Info == 6);
    totalisp10w=numel(isp10w) * 2337;
    costisp10w=totalisp10w * 39.95 * 2337;
    
    ras100=find(Plot1Info == 7);
    totalras100=numel(ras100) * 351;
    costras100= totalras100 * 245.99 * 351;
    
    epcom=find(Plot1Info == 8);
    totalepcom=numel(epcom) * 511;
    costepcom= totalepcom * 99.99 * 511;
    
    spe18=find(Plot1Info == 9);
    totalspe18=numel(spe18) * 107;
    costspe18= totalspe18 * 249.50 * 107;
    
    spt5=find(Plot1Info == 10);
    totalspt5=numel(spt5) * 111;
    costspt5= totalspt5 * 199.99 * 111;
    
    why1000=find(Plot1Info == 11);
    totalwhy1000=numel(why1000) * 3;
    costwhy1000= totalwhy1000 * 999.99 * 3;
    
    why400=find(Plot1Info == 12);
    totalwhy400=numel(why400) * 4;
    costwhy400= totalwhy400 * 686.40 * 4;
    
    wg400=find(Plot1Info == 13);
    totalwg400=numel(wg400) * 4;
    costwg400=totalwg400 * 399.00 * 4;
    
    wg700=find(Plot1Info == 14);
    totalwg700=numel(wg700) * 4;
    costwg700= totalwg700 *449.99 * 4;
    
    apwt=find(Plot1Info == 15);
    totalapwt=numel(apwt) * 7;
    costapwt=totalapwt * 476.93 * 7;
    
    sf454=find(Plot1Info == 16);
    totalsf454=numel(sf454)* 7;
    costsf454=totalsf454 * 749.99 * 7;
    
    sf444=find(Plot1Info == 17);
    totalsf444=numel(sf444) * 7;
    costsf444=totalsf444 * 474.34 * 7;
    
    wck750=find(Plot1Info == 18);
    totalwck750=numel(wck750) * 3;
    costwck750=totalwck750 * 999.98 * 3;
    
    amounttotal=totalsf500+totalsf398+totalisp5w+totalisp100w+totalisp30w+totalisp10w+totalras100+totalepcom+totalspe18+totalspt5+totalwhy1000+totalwhy400+totalwg400+totalwg700+totalapwt+totalsf454+totalsf444+totalwck750;
    costtotal= costsf500+costsf398+ costisp5w+costisp100w+costisp30w+costisp10w+costras100+costepcom+costspe18+costspt5+costwhy1000+costwhy400+costwg400+costwg700+costapwt+costsf454+costsf444+costwck750;
    [filename, pathname] = uiputfile('Bill_Of_Materials_Honolulu_HI.txt');
    path_file=fullfile(pathname,filename);
    file=fopen(path_file,'w');
    fprintf(file,'Bill of Materials : Honolulu,HI\r\n');
    fprintf(file,'Material\t\t');
    fprintf(file,'Amount\t\t\t\t');
    fprintf(file,'Cost\t\t\t\r\n');
    
    if totalsf500>0
    fprintf(file,'Sunforce 50048\t\t');
    fprintf(file,num2str(totalsf500));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf500));
    fprintf(file,'\r\n');
    end
    
    if totalsf398>0
    fprintf(file,'Sunforce 39810\t\t');
    fprintf(file,num2str(totalsf398));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf398));
    fprintf(file,'\r\n');
    end
    
    if totalisp5w>0
    fprintf(file,'Instapark SPCC-5W\t');
    fprintf(file,num2str(totalisp5w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp5w));
    fprintf(file,'\r\n');
    end
    
    if totalisp100w>0
    fprintf(file,'Instapark SP-100W\t');
    fprintf(file,num2str(totalisp100w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp100w));
    fprintf(file,'\r\n');
    end
    
    if totalisp30w>0
    fprintf(file,'Instapark SPCC-30W\t');
    fprintf(file,num2str(totalisp30w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp30w));
    fprintf(file,'\r\n');
    end
    
    if totalisp10w>0
    fprintf(file,'Instapark SP-10w\t');
    fprintf(file,num2str(totalisp10w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp10w));
    fprintf(file,'\r\n');
    end
    
    if totalras100>0
    fprintf(file,'Rasmond 100SP\t\t');
    fprintf(file,num2str(totalras100));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costras100));
    fprintf(file,'\r\n');
    end
    
    if totalepcom>0
    fprintf(file,'Epcom Wk50-12\t\t');
    fprintf(file,num2str(totalepcom));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costepcom));
    fprintf(file,'\r\n');
    end
    
    if totalspe18>0
    fprintf(file,'Sun Power E18\t\t');
    fprintf(file,num2str(totalspe18));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costspe18));
    fprintf(file,'\r\n');
    end
    
    if totalspt5>0
    fprintf(file,'Sun Power T5\t\t');
    fprintf(file,num2str(totalspt5));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costspt5));
    fprintf(file,'\r\n');
    end
    
    if totalwhy1000>0
    fprintf(file,'Windmax HY1000-5\t');
    fprintf(file,num2str(totalwhy1000));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwhy1000));
    fprintf(file,'\r\n');
    end
    
    if totalwhy400>0
    fprintf(file,'Windmax HY400\t\t');
    fprintf(file,num2str(totalwhy400));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwhy400));
    fprintf(file,'\r\n');
    end
    
    if totalwg400>0
    fprintf(file,'GudCraft WG400\t\t');
    fprintf(file,num2str(totalwg400));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwg400));
    fprintf(file,'\r\n');
    end
    
    if totalwg700>0
    fprintf(file,'GudCraft WG700\t\t');
    fprintf(file,num2str(totalwg700));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwg700));
    fprintf(file,'\r\n');
    end
    
    if totalapwt>0
    fprintf(file,'All Power America\t');
    fprintf(file,num2str(totalapwt));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costapwt));
    fprintf(file,'\r\n');
    end
    
    if totalsf454>0
    fprintf(file,'Sunforce 45444\t\t');
    fprintf(file,num2str(totalsf454));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf454));
    fprintf(file,'\r\n');
    end
    
    if totalsf444>0
    fprintf(file,'Sunforce 44444\t\t');
    fprintf(file,num2str(totalsf444));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf444));
    fprintf(file,'\r\n');
    end
    
    if totalwck750>0
    fprintf(file,'WindyNation WCK-750\t');
    fprintf(file,num2str(totalwck750));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwck750));
    fprintf(file,'\r\n');
    end
    
    fprintf(file,'Total\t\t\t');
    fprintf(file,num2str(amounttotal));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costtotal));
     if ispc==1
        winopen(path_file);
    end
    
elseif name2 == 'Plot3.jpg'
    Plot1Info=evalin('base','Plot3Info');
    
        sf500=find(Plot1Info == 1);
    totalsf500=numel(sf500) * 529;
    costsf500=totalsf500 * 279.95 * 529;
    
    sf398=find(Plot1Info == 2);
    totalsf398=numel(sf398) * 357;
    costsf398=totalsf398 * 499.95 * 357;
    
    isp5w=find(Plot1Info == 3);
    totalisp5w=numel(isp5w) * 4090;
    costisp5w= totalisp5w * 34.95 * 4090;
    
    isp100w=find(Plot1Info == 4);
    totalisp100w=numel(isp100w) * 307;
    costisp100w= totalisp100w * 319.99 * 307;
    
    isp30w=find(Plot1Info == 5);
    totalisp30w=numel(isp30w) * 973;
    costisp30w= totalisp30w *114.70 * 973;
    
    isp10w=find(Plot1Info == 6);
    totalisp10w=numel(isp10w) * 2337;
    costisp10w=totalisp10w * 39.95 * 2337;
    
    ras100=find(Plot1Info == 7);
    totalras100=numel(ras100) * 351;
    costras100= totalras100 * 245.99 * 351;
    
    epcom=find(Plot1Info == 8);
    totalepcom=numel(epcom) * 511;
    costepcom= totalepcom * 99.99 * 511;
    
    spe18=find(Plot1Info == 9);
    totalspe18=numel(spe18) * 107;
    costspe18= totalspe18 * 249.50 * 107;
    
    spt5=find(Plot1Info == 10);
    totalspt5=numel(spt5) * 111;
    costspt5= totalspt5 * 199.99 * 111;
    
    why1000=find(Plot1Info == 11);
    totalwhy1000=numel(why1000) * 3;
    costwhy1000= totalwhy1000 * 999.99 * 3;
    
    why400=find(Plot1Info == 12);
    totalwhy400=numel(why400) * 4;
    costwhy400= totalwhy400 * 686.40 * 4;
    
    wg400=find(Plot1Info == 13);
    totalwg400=numel(wg400) * 4;
    costwg400=totalwg400 * 399.00 * 4;
    
    wg700=find(Plot1Info == 14);
    totalwg700=numel(wg700) * 4;
    costwg700= totalwg700 *449.99 * 4;
    
    apwt=find(Plot1Info == 15);
    totalapwt=numel(apwt) * 7;
    costapwt=totalapwt * 476.93 * 7;
    
    sf454=find(Plot1Info == 16);
    totalsf454=numel(sf454)* 7;
    costsf454=totalsf454 * 749.99 * 7;
    
    sf444=find(Plot1Info == 17);
    totalsf444=numel(sf444) * 7;
    costsf444=totalsf444 * 474.34 * 7;
    
    wck750=find(Plot1Info == 18);
    totalwck750=numel(wck750) * 3;
    costwck750=totalwck750 * 999.98 * 3;
    
    amounttotal=totalsf500+totalsf398+totalisp5w+totalisp100w+totalisp30w+totalisp10w+totalras100+totalepcom+totalspe18+totalspt5+totalwhy1000+totalwhy400+totalwg400+totalwg700+totalapwt+totalsf454+totalsf444+totalwck750;
    costtotal= costsf500+costsf398+ costisp5w+costisp100w+costisp30w+costisp10w+costras100+costepcom+costspe18+costspt5+costwhy1000+costwhy400+costwg400+costwg700+costapwt+costsf454+costsf444+costwck750;
    [filename, pathname] = uiputfile('Bill_Of_Materials_Miami_FL.txt');
    path_file=fullfile(pathname,filename);
    file=fopen(path_file,'w');
    fprintf(file,'Bill of Materials : Miami,FL\r\n');
    fprintf(file,'Material\t\t');
    fprintf(file,'Amount\t\t\t\t');
    fprintf(file,'Cost\t\t\t\r\n');
    
    if totalsf500>0
    fprintf(file,'Sunforce 50048\t\t');
    fprintf(file,num2str(totalsf500));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf500));
    fprintf(file,'\r\n');
    end
    
    if totalsf398>0
    fprintf(file,'Sunforce 39810\t\t');
    fprintf(file,num2str(totalsf398));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf398));
    fprintf(file,'\r\n');
    end
    
    if totalisp5w>0
    fprintf(file,'Instapark SPCC-5W\t');
    fprintf(file,num2str(totalisp5w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp5w));
    fprintf(file,'\r\n');
    end
    
    if totalisp100w>0
    fprintf(file,'Instapark SP-100W\t');
    fprintf(file,num2str(totalisp100w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp100w));
    fprintf(file,'\r\n');
    end
    
    if totalisp30w>0
    fprintf(file,'Instapark SPCC-30W\t');
    fprintf(file,num2str(totalisp30w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp30w));
    fprintf(file,'\r\n');
    end
    
    if totalisp10w>0
    fprintf(file,'Instapark SP-10w\t');
    fprintf(file,num2str(totalisp10w));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costisp10w));
    fprintf(file,'\r\n');
    end
    
    if totalras100>0
    fprintf(file,'Rasmond 100SP\t\t');
    fprintf(file,num2str(totalras100));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costras100));
    fprintf(file,'\r\n');
    end
    
    if totalepcom>0
    fprintf(file,'Epcom Wk50-12\t\t');
    fprintf(file,num2str(totalepcom));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costepcom));
    fprintf(file,'\r\n');
    end
    
    if totalspe18>0
    fprintf(file,'Sun Power E18\t\t');
    fprintf(file,num2str(totalspe18));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costspe18));
    fprintf(file,'\r\n');
    end
    
    if totalspt5>0
    fprintf(file,'Sun Power T5\t\t');
    fprintf(file,num2str(totalspt5));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costspt5));
    fprintf(file,'\r\n');
    end
    
    if totalwhy1000>0
    fprintf(file,'Windmax HY1000-5\t');
    fprintf(file,num2str(totalwhy1000));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwhy1000));
    fprintf(file,'\r\n');
    end
    
    if totalwhy400>0
    fprintf(file,'Windmax HY400\t\t');
    fprintf(file,num2str(totalwhy400));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwhy400));
    fprintf(file,'\r\n');
    end
    
    if totalwg400>0
    fprintf(file,'GudCraft WG400\t\t');
    fprintf(file,num2str(totalwg400));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwg400));
    fprintf(file,'\r\n');
    end
    
    if totalwg700>0
    fprintf(file,'GudCraft WG700\t\t');
    fprintf(file,num2str(totalwg700));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwg700));
    fprintf(file,'\r\n');
    end
    
    if totalapwt>0
    fprintf(file,'All Power America\t');
    fprintf(file,num2str(totalapwt));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costapwt));
    fprintf(file,'\r\n');
    end
    
    if totalsf454>0
    fprintf(file,'Sunforce 45444\t\t');
    fprintf(file,num2str(totalsf454));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf454));
    fprintf(file,'\r\n');
    end
    
    if totalsf444>0
    fprintf(file,'Sunforce 44444\t\t');
    fprintf(file,num2str(totalsf444));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costsf444));
    fprintf(file,'\r\n');
    end
    
    if totalwck750>0
    fprintf(file,'WindyNation WCK-750\t');
    fprintf(file,num2str(totalwck750));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costwck750));
    fprintf(file,'\r\n');
    end
    
    fprintf(file,'Total\t\t\t');
    fprintf(file,num2str(amounttotal));
    fprintf(file,'\t\t\t\t');
    fprintf(file,'$');
    fprintf(file,num2str(costtotal));
     if ispc==1
        winopen(path_file);
    end
    
end
catch
end


% --- Executes on button press in saveData.
function saveData_Callback(hObject, eventdata, handles)
% hObject    handle to saveData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
d=menu('Save Data for Which Plot?','Fargo, ND','Honolulu, HI','Miami, FL')
switch d
    case 1
        [file,path] = uiputfile({'*.mat';'*.txt'},'Save as');
        Plot1Info=evalin('base','Plot1Info');
        save([path,file],'Plot1Info');
    case 2
        [file,path] = uiputfile({'*.mat';'*.txt'},'Save as');
        Plot2Info=evalin('base','Plot2Info');
        save([path,file],'Plot2Info');
        
    case 3
        [file,path] = uiputfile({'*.mat';'*.txt'},'Save as');
        Plot3Info=evalin('base','Plot3Info');
        save([path,file],'Plot3Info');
end
catch
end
    



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in about.
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=msgbox({'Neptune Software (LLC)' 'Charles Hammond' 'Ricky Obregon' 'Karthik Ramesh' ...
    '"Do not wait to strike till the iron is hot;' 'but make it hot by striking."' ...
    '-William Butler Yeats'})


% --- Executes on button press in wisdom.
function wisdom_Callback(hObject, eventdata, handles)
% hObject    handle to wisdom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=evalin('base','f')
f=f+1
assignin('base','f',f)
if f==1
    msgbox('"You''re braver than you believe, and stronger than you seem, and smarter than you think." -A.A. Milne')
elseif f==2
    msgbox('"If you have knowledge, let others light their candles in it." -Margaret Fuller')
elseif f==3
    msgbox('"You just keep moving forward and doing what you do" -Octavia Spencer')
elseif f==4
    msgbox('"One''s philosophy is not best expressed in words; it is expressed in the choices one makes." -Eleanor Roosevelt')
elseif f==5
    msgbox('"You may not be there yet, but you''re closer than yesterday." -Unknown')
elseif f==6
    msgbox('"Don''t allow yourself to be held hostage by the opinion of others." -Laurie Buchanan')
elseif f==7
    msgbox('"Don''t stress. Do your best. Forget the rest" -Unknown')
elseif f==8
    msgbox('"Everybody wants happiness, nobody wants pain. But you can''t have a rainbow without a little rain." -Anonymous')
elseif f==9
    msgbox('"Believe you can and you''re halfway there." -Theodore Roosevelt')   
end
if f>8
    assignin('base','f',0)
end



function quantity_Callback(hObject, eventdata, handles)
% hObject    handle to quantity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of quantity as text
%        str2double(get(hObject,'String')) returns contents of quantity as a double


% --- Executes during object creation, after setting all properties.
function quantity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to quantity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in energyOptions.
function energyOptions_Callback(hObject, eventdata, handles)
% hObject    handle to energyOptions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject,'String')); %returns popupmenu1 contents as cell array
EnergyChoice = contents{get(hObject,'Value')};%returns selected item from popupmenu1

try


if (strcmp(EnergyChoice,'Sunforce 50048/ Amorphous Silicon/ 15 W/ 42.5in x 1.5in x 16in / 11 lbs / $279.95'))% #1
    choice=1;
    try
        while choice==1
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[0.6 0.3 1],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=1;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=1;
                assignin('base','Plot2Info',Plot2Info);
                
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=1;
                assignin('base','Plot3Info',Plot3Info);
                
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        
    catch
    end
plotChoice_Callback(handles.plotChoice,eventdata,handles)
    
elseif (strcmp(EnergyChoice,'Sunforce 39810/ Polycrystalline / 80 W/ 21in x 48in x 2in/ 22lbs/ $499.95'))% #2
    choice=2;
    try
        while choice==2
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor','r','ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=2;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=2;
                assignin('base','Plot2Info',Plot2Info);
                
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=2;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        
    catch
    end
plotChoice_Callback(handles.plotChoice,eventdata,handles)

elseif (strcmp(EnergyChoice,'Instapark SPCC-5W/ Mono-crystalline/ 5 W/ 11in x 8in x 1in/ 2.8 lbs/ $34.95'))% #3
    choice=3;
    try
        while choice==3
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor','b','ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=3;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=3;
                assignin('base','Plot2Info',Plot2Info);
                
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=3;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
plotChoice_Callback(handles.plotChoice,eventdata,handles)

    elseif (strcmp(EnergyChoice,'Instapark SP-100W/ Mono-crystalline/ 100 W/ 45in x 1.5in x 26in/ 21 lbs/ $319.99')) %  #4
    choice=4;
    try
        while choice==4
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor','m','ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=4;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=4;
                assignin('base','Plot2Info',Plot2Info);
                
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                                
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=4;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
plotChoice_Callback(handles.plotChoice,eventdata,handles)
    elseif (strcmp(EnergyChoice,'Instapark SPCC-30W/ Mono-crystalline/ 30 W/ 21.5in x 1.1in x 17.2in/ 7.2 lbs/ $114.70')) %  #5
    choice=5;
    try
        while choice==5
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor','y','ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=5;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=5;
                assignin('base','Plot2Info',Plot2Info);
                
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=5;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
plotChoice_Callback(handles.plotChoice,eventdata,handles)
    elseif (strcmp(EnergyChoice,'Instapark SP-10W/ Mono-crystalline/ 10 W/ 14in x 11in x 1in/ 2.8 lbs/ $39.95')) %  #6
    choice=6;
    try
        while choice==6
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.3 .9 .1],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=6;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=6;
                assignin('base','Plot2Info',Plot2Info);
                
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=6;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
plotChoice_Callback(handles.plotChoice,eventdata,handles)
    elseif (strcmp(EnergyChoice,'Ramsond/ 100SP/ Mono-crystalline/ 100 W/ 47in x 1.5in x 21.8in/ 12 lbs/ $245.99')) %  #7
    choice=7;
    try
        while choice==7
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor','c','ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=7;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=7;
                assignin('base','Plot2Info',Plot2Info);
                
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=7;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'Epcom WK50-12/ Polycrystalline/ 50 W/ 32in x 22in x 1.4in/ 12 lbs/ $99.99')) %  #8
    choice=8;
    try
        while choice==8
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[1 .6 0],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=8;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=8;
                assignin('base','Plot2Info',Plot2Info);
                
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=8;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'Sun Power E18/ Mono-crystalline/ 400 W/ 41.18in x 81.36in x 2.13in/ 56 lbs / $249.50')) %  #9
    choice=9;
    try
        while choice==9
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.5 .5 .5],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=9;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=9;
                assignin('base','Plot2Info',Plot2Info);
                
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=9;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'Sun Power T5/ Mono-crystalline/ 320 W/ 43.06in x 75.13in x 8.37in/ 47 lbs/ $199.99')) %  #10
    choice=10;
    try
        while choice==10
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.9 1 .7],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=10;
                assignin('base','Plot1Info',Plot1Info);
                
                updateSolar(1)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=10;
                assignin('base','Plot2Info',Plot2Info);
                 
                updateSolar(2)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=10;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateSolar(3)
                set(handles.SolarPower,'String',strcat(num2str(evalin('base','SolarPower')),' kW hr'))
                set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
                set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
                set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'Windmax HY 1000-5/ Wind Generator/ 1000 W/ 15ft/ $999.99')) %  #11
    choice=11;
    try
        while choice==11
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.4 .7 .1],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=11;
                assignin('base','Plot1Info',Plot1Info);
                 
                updateWind(1);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=11;
                assignin('base','Plot2Info',Plot2Info);
                 
                updateWind(2);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
                       
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=11;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateWind(3);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'Windmax HY 400/ Wind Generator/ 500 W/ 13 ft/ $686.40')) %  #12
    choice=12;
    try
        while choice==12
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.7 .1 .5],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=12;
                assignin('base','Plot1Info',Plot1Info);
                 
                updateWind(1);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=12;
                assignin('base','Plot2Info',Plot2Info);
                 
                updateWind(2);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=12;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateWind(3);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'GudCraft WG400/ Wind Generator/ 400 W/ 13 ft/ $399.00')) %  #13
    choice=13;
    try
        while choice==13
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.8 .8 .3],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=13;
                assignin('base','Plot1Info',Plot1Info);
                 
                updateWind(1);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=13;
                assignin('base','Plot2Info',Plot2Info);
                 
                updateWind(2);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=13;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateWind(3);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'GudCraft WG700/ Wind Generator/ 700 W/ 13 ft/ $449.00')) %  #14
    choice=14;
    try
        while choice==14
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.3 .5 1],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=14;
                assignin('base','Plot1Info',Plot1Info);
                 
                updateWind(1);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=14;
                assignin('base','Plot2Info',Plot2Info);
                 
                updateWind(2);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=14;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateWind(3);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'All Power America APWT400A/ 400 W/ 10 ft/ $476.93')) %  #15
    choice=15;
    try
        while choice==15
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[0 0 0],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=15;
                assignin('base','Plot1Info',Plot1Info);
                 
                updateWind(1);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=15;
                assignin('base','Plot2Info',Plot2Info);
                 
                updateWind(2);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=15;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateWind(3);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'Sunforce 45444/ Wind Turbine/ 600 W/ 10 ft/ $749.99')) %  #16
    choice=16;
    try
        while choice==16
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.7 .7 1],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=16;
                assignin('base','Plot1Info',Plot1Info);
                 
                updateWind(1);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=16;
                assignin('base','Plot2Info',Plot2Info);
                 
                updateWind(2);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=16;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateWind(3);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'Sunforce 44444/ Wind Generator/ 400 W/ 10 ft/ $474.34')) %  #17
    choice=17;
    try
        while choice==17
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.9 .4 .4],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=17;
                assignin('base','Plot1Info',Plot1Info);
                 
                updateWind(1);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=17;
                assignin('base','Plot2Info',Plot2Info);
                 
                updateWind(2);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=17;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateWind(3);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    elseif (strcmp(EnergyChoice,'WindyNation WCK-750/ Wind Turbine/ 750 W/ 15 ft/ $999.98')) %  #18
    choice=18;
    try
        while choice==18
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                count=sum(sum(evalin('base','Plot1Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                count=sum(sum(evalin('base','Plot2Info')~=0));
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                count=sum(sum(evalin('base','Plot3Info')~=0));   
            end
            
            if count==10
                errordlg('You have reached your limit!')
                error
            end
            
        if count<10
            [x,y]=ginput(1);
            x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
            y2=floor((y)/15)*15; %gives location in IMAGE, not data array
            col=ceil((x)/15); %THIS gives array location
            row=ceil((y)/15);
            square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[.9 .6 .5],'ButtonDownFcn',@boxCallbackVer2);
        
            d=getframe(handles.axes1);
            assignin('base','frame',d);
       
            if strcmp(evalin('base','PlotChoice'),'Fargo, ND')
                Plot1Info=evalin('base','Plot1Info');
                Plot1Info(row,col)=18;
                assignin('base','Plot1Info',Plot1Info);
                 
                updateWind(1);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Honolulu, HI')
                Plot2Info=evalin('base','Plot2Info');
                Plot2Info(row,col)=18;
                assignin('base','Plot2Info',Plot2Info);
                 
                updateWind(2);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            elseif strcmp(evalin('base','PlotChoice'),'Miami, FL')
                Plot3Info=evalin('base','Plot3Info');
                Plot3Info(row,col)=18;
                assignin('base','Plot3Info',Plot3Info);
                 
                updateWind(3);
                set(handles.WindPower,'String',strcat(num2str(evalin('base','WindPower')),' kW hr'))
                set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','WindCost'))))
                set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
                set(handles.WindArea,'String',strcat(num2str(evalin('base','WindArea')),' m^2'))
                set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
                set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
                set(handles.TotalCost,'String',strcat('$ ',num2str(evalin('base','TotalCost'))))
                set(handles.TotalArea,'String',strcat(num2str(evalin('base','SolarArea')+evalin('base','WindArea')),' m^2'))
                set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            
            end
        end
        end
        catch
    end
    
end
catch
end

% Hints: contents = cellstr(get(hObject,'String')) returns energyOptions contents as cell array
%        contents{get(hObject,'Value')} returns selected item from energyOptions


% --- Executes during object creation, after setting all properties.
function energyOptions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to energyOptions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in plotChoice.
function plotChoice_Callback(hObject, eventdata, handles)
% hObject    handle to plotChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns plotChoice contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotChoice
contents = cellstr(get(hObject,'String')); %returns popupmenu1 contents as cell array
PlotChoice = contents{get(hObject,'Value')};%returns selected item from popupmenu1
assignin('base','PlotChoice',PlotChoice)
if (strcmp(PlotChoice,'Fargo, ND'))
    
    cla
    
    set(handles.SolarArea,'String', strcat(num2str(evalin('base','Plot1SolarArea')),' m^2'))
    set(handles.SolarPower,'String', strcat(num2str(evalin('base','Plot1SolarPower')),' kW hr'))
    set(handles.PanelAmount,'String',num2str(evalin('base','Plot1Panel')))
    set(handles.SolarCost,'String',strcat('$ ',num2str(evalin('base','Plot1SolarCost'))))
    
    set(handles.WindArea,'String', strcat(num2str(evalin('base','Plot1WindArea')),' m^2'))
    set(handles.WindPower,'String', num2str(evalin('base','Plot1WindPower')))
    set(handles.TurbAmount,'String',num2str(evalin('base','Plot1Turb')))
    set(handles.WindCost,'String',strcat('$ ',num2str(evalin('base','Plot1WindCost'))))
    
    assignin('base','SolarAvg',evalin('base','FargoSolarAvg'))
    assignin('base','WindAvg',evalin('base','FargoWindAvg'))
    
    assignin('base','name','Plot1.jpg');
    
    image = imread('plot1.png');
%     image(:,15:15:end,:)=0;
%     image(15:15:end,:,:)=0;
    imshow(image);

    
array=evalin('base','Plot1Info');
hold on
for c=1:size(array,1)
    
    for b=1:size(array,2)
        
        if array(c,b)==1
            square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[0.6 0.3 1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==2
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','r','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==3
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','b','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==4
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','m','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==5
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','y','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==6
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.3 0.9 0.1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==7
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','c','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==8
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[1 0.6 0],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==9
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.5 0.5 0.5],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==10
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.9 1 0.7],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==11
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.4 0.7 0.1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==12
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.7 0.1 0.5],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==13
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.8 0.8 0.3],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==14
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.3 0.5 1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==15
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0 0 0],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==16
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.7 0.7 1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==17
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.9 0.4 0.4],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==18
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.9 0.6 0.5],'ButtonDownFcn',@boxCallbackVer2);
        end
    end
end

elseif (strcmp(PlotChoice,'Home Screen'))
    cla
    logo=imread('Welcome.png');
    imshow(logo);
elseif (strcmp(PlotChoice,'Honolulu, HI'))
    cla
    
    set(handles.SolarArea,'String', num2str(evalin('base','Plot2SolarArea')))
    set(handles.SolarPower,'String', num2str(evalin('base','Plot2SolarPower')))
    set(handles.PanelAmount,'String',num2str(evalin('base','Plot2Panel')))
    set(handles.SolarCost,'String',num2str(evalin('base','Plot2SolarCost')))
    
    set(handles.WindArea,'String', num2str(evalin('base','Plot2WindArea')))
    set(handles.WindPower,'String', num2str(evalin('base','Plot2WindPower')))
    set(handles.TurbAmount,'String',num2str(evalin('base','Plot2Turb')))
    set(handles.WindCost,'String',num2str(evalin('base','Plot2WindCost')))
    
    assignin('base','SolarAvg',evalin('base','HonoluluSolarAvg'))
    assignin('base','WindAvg',evalin('base','HonoluluWindAvg'))
    
    assignin('base','name','Plot2.jpg');
    
%     image = imread('Plot2.png');
%     image(:,15:15:end,:)=0;
%     image(15:15:end,:,:)=0;
%     imshow(image)
    imshow(imread('Plot2.png'))
    array=evalin('base','Plot2Info');
hold on
for c=1:size(array,1)

    for b=1:size(array,2)
        
        if array(c,b)==1
            square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[0.6 0.3 1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==2
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','r','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==3
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','b','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==4
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','m','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==5
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','y','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==6
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.3 0.9 0.1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==7
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','c','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==8
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[1 0.6 0],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==9
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.5 0.5 0.5],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==10
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.9 1 0.7],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==11
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.4 0.7 0.1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==12
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.7 0.1 0.5],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==13
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.8 0.8 0.3],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==14
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.3 0.5 1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==15
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0 0 0],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==16
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.7 0.7 1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==17
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.9 0.4 0.4],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==18
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.9 0.6 0.5],'ButtonDownFcn',@boxCallbackVer2);
        end
    end
end
    
elseif (strcmp(PlotChoice,'Miami, FL'))
    cla
    
    set(handles.SolarArea,'String', num2str(evalin('base','Plot3SolarArea')))
    set(handles.SolarPower,'String', num2str(evalin('base','Plot3SolarPower')))
    set(handles.PanelAmount,'String',num2str(evalin('base','Plot3Panel')))
    set(handles.SolarCost,'String',num2str(evalin('base','Plot3SolarCost')))
    
    set(handles.WindArea,'String', num2str(evalin('base','Plot3WindArea')))
    set(handles.WindPower,'String', num2str(evalin('base','Plot3WindPower')))
    set(handles.TurbAmount,'String',num2str(evalin('base','Plot3Turb')))
    set(handles.WindCost,'String',num2str(evalin('base','Plot3WindCost')))
    
    assignin('base','name','Plot3.jpg')
    
    assignin('base','SolarAvg',evalin('base','MiamiSolarAvg'))
    assignin('base','WindAvg',evalin('base','MiamiWindAvg'))
    
%     image = imread('Plot3.png');
%     image(:,15:15:end,:)=0;
%     image(15:15:end,:,:)=0;
%     imshow(image);
    imshow(imread('Plot3.png'))
    array=evalin('base','Plot3Info');
hold on
for c=1:size(array,1)
    for b=1:size(array,2)
        
        if array(c,b)==1
            square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                'visible','on','FaceColor',[0.6 0.3 1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==2
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','r','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==3
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','b','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==4
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','m','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==5
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','y','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==6
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.3 0.9 0.1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==7
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor','c','ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==8
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[1 0.6 0],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==9
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.5 0.5 0.5],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==10
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.9 1 0.7],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==11
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.4 0.7 0.1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==12
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.7 0.1 0.5],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==13
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.8 0.8 0.3],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==14
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.3 0.5 1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==15
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0 0 0],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==16
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.7 0.7 1],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==17
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.9 0.4 0.4],'ButtonDownFcn',@boxCallbackVer2);
        elseif array(c,b)==18
              square=rectangle('position',[floor((b-1)*15) floor((c-1)*15) 15 15],'PickableParts','all',...
                  'visible','on','FaceColor',[0.9 0.6 0.5],'ButtonDownFcn',@boxCallbackVer2);
        end
    end
end
end


% --- Executes during object creation, after setting all properties.
function plotChoice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in remove.
function remove_Callback(hObject, eventdata, handles)
% hObject    handle to remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=msgbox({'Step 1: Select a city to work with.',...
    'Step 2: Load data (.mat/.txt) if you wish to continue working on a previously saved dataset.'...
'Step 3: Select the type of equipment you wish to place on image.'...
'Step 5: Click on the grid where you would like to place a type of equipment.'...
 'You may switch between images without saving if you wish.'...
'Step 6: When done save your data (.mat/.txt) and/or an Image (.png) of your final grid layout.'... 
'Step 7: Print bill of materials if desired.'});
