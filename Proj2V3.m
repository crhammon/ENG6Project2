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

% Last Modified by GUIDE v2.5 15-Mar-2017 09:26:47

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
% End initialization code - DO NOT EDIT* 42.5/39.3700787 * 16/39.3700787


% --- Executes just before Proj2V3 is made visible.
function Proj2V3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proj2V3 (see VARARGIN)

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

load Fargo.mat
assignin('base','FargoWindAvg',mean(Fargo_win)*600);
assignin('base','FargoSolarAvg',mean(Fargo_sol))
% load Honolulu.mat
% assignin('base','WindAvg',mean(Honolulu_win)*600);
% load Miami.mat
% assignin('base','WindAvg',mean(Miami_win)*600);





logo=imread('Welcome.png');
imshow(logo);

image=imread('plot1.jpg');
b=size([1:15:size(image,1)]);%gives number of rows
c=size([1:15:size(image,2)]);%gives number of columns
assignin('base','Plot1Info',zeros(b(2),c(2)))

image=imread('plot2.jpg');
b=size([1:15:size(image,1)]);%gives number of rows
c=size([1:15:size(image,2)]);%gives number of columns
assignin('base','Plot2Info',zeros(b(2),c(2)))

image=imread('plot3.jpg');
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


% --- Executes on selection change in PlotChoice.
function PlotChoice_Callback(hObject, eventdata, handles)
% hObject    handle to PlotChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%localfunctions
contents = cellstr(get(hObject,'String')); %returns popupmenu1 contents as cell array
PlotChoice = contents{get(hObject,'Value')};%returns selected item from popupmenu1
assignin('base','PlotChoice',PlotChoice)
% while evalin('base','count') ~= 11
if (strcmp(PlotChoice,'Plot 1'))
    cla
   
    set(handles.SolarArea,'String', num2str(evalin('base','Plot1SolarArea')))
    set(handles.SolarPower,'String', num2str(evalin('base','Plot1SolarPower')))
    set(handles.PanelAmount,'String',num2str(evalin('base','Plot1Panel')))
    set(handles.SolarCost,'String',num2str(evalin('base','Plot1SolarCost')))
    
    set(handles.WindArea,'String', num2str(evalin('base','Plot1WindArea')))
    set(handles.WindPower,'String', num2str(evalin('base','Plot1WindPower')))
    set(handles.TurbAmount,'String',num2str(evalin('base','Plot1Turb')))
    set(handles.WindCost,'String',num2str(evalin('base','Plot1WindCost')))
    
    assignin('base','name','Plot1.jpg');
    
    image = imread('plot1.jpg');
    image(:,15:15:end,:)=0;
    image(15:15:end,:,:)=0;
    imshow(image);
    
array=evalin('base','Plot1Info');
assignin('base','numbersCrunched',[0 0;0 0;0 0;0 0;0 0;0 0])
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
elseif (strcmp(PlotChoice,'Plot 2'))
    cla
    
    set(handles.SolarArea,'String', num2str(evalin('base','Plot2SolarArea')))
    set(handles.SolarPower,'String', num2str(evalin('base','Plot2SolarPower')))
    set(handles.PanelAmount,'String',num2str(evalin('base','Plot2Panel')))
    set(handles.SolarCost,'String',num2str(evalin('base','Plot2SolarCost')))
    
    set(handles.WindArea,'String', num2str(evalin('base','Plot2WindArea')))
    set(handles.WindPower,'String', num2str(evalin('base','Plot2WindPower')))
    set(handles.TurbAmount,'String',num2str(evalin('base','Plot2Turb')))
    set(handles.WindCost,'String',num2str(evalin('base','Plot2WindCost')))
    
    assignin('base','name','Plot2.jpg');
    
    image = imread('plot2.jpg');
    image(:,1:15:end,:)=0;
    image(1:15:end,:,:)=0;
    imshow(image)
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
    
elseif (strcmp(PlotChoice,'Plot 3'))
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
    
    image = imread('plot3.jpg');
    image(:,1:15:end,:)=0;
    image(1:15:end,:,:)=0;
    imshow(image);
    
    assignin('base','frame',getframe(handles.axes1))
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

% Hints: contents = cellstr(get(hObject,'String')) returns PlotChoice contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PlotChoice


% --- Executes during object creation, after setting all properties.
function PlotChoice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlotChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in EnergyChoice.
function EnergyChoice_Callback(hObject, eventdata, handles)
contents = cellstr(get(hObject,'String')); %returns popupmenu1 contents as cell array
EnergyChoice = contents{get(hObject,'Value')};%returns selected item from popupmenu1


if (strcmp(EnergyChoice,'Sunforce 50048/ Amorphous Silicon/ 15 W/ 42.5in x 1.5in x 16in / 11 lbs / $279.95')) % #1
    %7.083square feet per panel; 15W/10.7ft^2=1.4W/ft^2; so 5 panels/40ftsquared.
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=ceil(str2double(cell2mat(inputcell)));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.6 0.3 1],'ButtonDownFcn',@boxCallbackVer2);
        
        if evalin('base','PlotChoice')=='Plot 1'
            
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=1;
            assignin('base','Plot1Info',Plot1Info);
            assignin('base','ItemCost',279.95)
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=1;
            assignin('base','Plot2Info',Plot2Info);
                        
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=1;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
    end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    
elseif (strcmp(EnergyChoice,'Sunforce 39810/ Polycrystalline / 80 W/ 21in x 48in x 2in/ 22lbs/ $499.95'))% #2
    assignin('base','multiplier',5) %7.083square feet per panel; 15W/10.7ft^2=1.4W/ft^2; so 5 panels/40ftsquared.
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor','r','ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=2;
            assignin('base','Plot1Info',Plot1Info);
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=2;
            assignin('base','Plot2Info',Plot2Info);
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=2;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Instapark SPCC-5W/ Mono-crystalline/ 5 W/ 11in x 8in x 1in/ 2.8 lbs/ $34.95')) %  #3
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell))
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor','b','ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=3;
            assignin('base','Plot1Info',Plot1Info);
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=3;
            assignin('base','Plot2Info',Plot2Info);
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=3;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Instapark SP-100W/ Mono-crystalline/ 100 W/ 45in x 1.5in x 26in/ 21 lbs/ $319.99')) %  #4
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor','m','ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=4;
            assignin('base','Plot1Info',Plot1Info);
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
                        
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=4;
            assignin('base','Plot2Info',Plot2Info);
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=4;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Instapark SPCC-30W/ Mono-crystalline/ 30 W/ 21.5in x 1.1in x 17.2in/ 7.2 lbs/ $114.70')) %  #5
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor','y','ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=5;
            assignin('base','Plot1Info',Plot1Info);
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=5;
            assignin('base','Plot2Info',Plot2Info);
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=5;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Instapark SP-10W/ Mono-crystalline/ 10 W/ 14in x 11in x 1in/ 2.8 lbs/ $39.95')) %  #6
    inputcell=inputdlg('How many would you like to place?(limit 10)')
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.3 0.9 0.1],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=6;
            assignin('base','Plot1Info',Plot1Info);
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=6;
            assignin('base','Plot2Info',Plot2Info);
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=6;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Ramsond/ 100SP/ Mono-crystalline/ 100 W/ 47in x 1.5in x 21.8in/ 12 lbs/ $245.99')) %  #7
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor','c','ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=7;
            assignin('base','Plot1Info',Plot1Info);
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=7;
            assignin('base','Plot2Info',Plot2Info);
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=7;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Epcom WK50-12/ Polycrystalline/ 50 W/ 32in x 22in x 1.4in/ 12 lbs/ $99.99')) %  #8
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[1 0.6 0],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=8;
            assignin('base','Plot1Info',Plot1Info);
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=8;
            assignin('base','Plot2Info',Plot2Info);
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=8;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Sun Power E18/ Mono-crystalline/ 400 W/ 41.18in x 81.36in x 2.13in/ 56 lbs / $249.50')) %  #9
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.5 0.5 0.5],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=9;
            assignin('base','Plot1Info',Plot1Info);
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=9;
            assignin('base','Plot2Info',Plot2Info);
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=9;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Sun Power T5/ Mono-crystalline/ 320 W/ 43.06in x 75.13in x 8.37in/ 47 lbs/ $199.99')) %  #10
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.9 1 0.7],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=10;
            assignin('base','Plot1Info',Plot1Info);
            
            updateSolar(1)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=10;
            assignin('base','Plot2Info',Plot2Info);
            
            updateSolar(2)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=10;
            assignin('base','Plot3Info',Plot3Info);
            
            updateSolar(3)
            set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
            set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
            set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
            set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Windmax HY 1000-5/ Wind Generator/ 1000 W/ 15ft/ $999.99')) %  #11
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.4 0.7 0.1],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=11;
            assignin('base','Plot1Info',Plot1Info);
            
            updateWind(1);
            set(handles.WindPower,'String',num2str(evalin('base','WindPower')))
            set(handles.WindCost,'String',num2str(evalin('base','WindCost')))
            set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
            set(handles.WindArea,'String',num2str(evalin('base','WindArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=11;
            assignin('base','Plot2Info',Plot2Info);
            
            updateWind(1);
            set(handles.WindPower,'String',num2str(evalin('base','WindPower')))
            set(handles.WindCost,'String',num2str(evalin('base','WindCost')))
            set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
            set(handles.WindArea,'String',num2str(evalin('base','WindArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=11;
            assignin('base','Plot3Info',Plot3Info);
            
            updateWind(1);
            set(handles.WindPower,'String',num2str(evalin('base','WindPower')))
            set(handles.WindCost,'String',num2str(evalin('base','WindCost')))
            set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
            set(handles.WindArea,'String',num2str(evalin('base','WindArea')))
            set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
            set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
            set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
            set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
            set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Windmax HY 400/ Wind Generator/ 500 W/ 13 ft/ $686.40')) %  #12
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.7 0.1 0.5],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=12;
            assignin('base','Plot1Info',Plot1Info);
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=12;
            assignin('base','Plot2Info',Plot2Info);
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=12;
            assignin('base','Plot3Info',Plot3Info);
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'GudCraft WG400/ Wind Generator/ 400 W/ 13 ft/ $399.00')) %  #13
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.8 0.8 0.3],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=13;
            assignin('base','Plot1Info',Plot1Info);
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=13;
            assignin('base','Plot2Info',Plot2Info);
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=13;
            assignin('base','Plot3Info',Plot3Info);
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'GudCraft WG700/ Wind Generator/ 700 W/ 13 ft/ $449.00')) %  #14
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.3 0.5 1],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=14;
            assignin('base','Plot1Info',Plot1Info);
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=14;
            assignin('base','Plot2Info',Plot2Info);
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=14;
            assignin('base','Plot3Info',Plot3Info);
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'All Power America APWT400A/ 400 W/ 10 ft/ $476.93')) %  #15
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0 0 0],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=15;
            assignin('base','Plot1Info',Plot1Info);
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=15;
            assignin('base','Plot2Info',Plot2Info);
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=15;
            assignin('base','Plot3Info',Plot3Info);
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Sunforce 45444/ Wind Turbine/ 600 W/ 10 ft/ $749.99')) %  #16
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.7 0.7 1],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=16;
            assignin('base','Plot1Info',Plot1Info);
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=16;
            assignin('base','Plot2Info',Plot2Info);
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=16;
            assignin('base','Plot3Info',Plot3Info);
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'Sunforce 44444/ Wind Generator/ 400 W/ 10 ft/ $474.34')) %  #17
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.9 0.4 0.4],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=17;
            assignin('base','Plot1Info',Plot1Info);
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=17;
            assignin('base','Plot2Info',Plot2Info);
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=17;
            assignin('base','Plot3Info',Plot3Info);
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    elseif (strcmp(EnergyChoice,'WindyNation WCK-750/ Wind Turbine/ 750 W/ 15 ft/ $999.98')) %  #18
    inputcell=inputdlg('How many would you like to place?(limit 10)');
    limit=1;
    limit=str2double(cell2mat(inputcell));
    if limit>10
        errordlg('Limit is 10!')
    elseif limit==0
        errordlg('If you don''t want to put any of these then why did you select it?!')
    elseif limit<0
        errordlg('You may not place negative equipment...')
    end
    for c=1:limit
        [x,y]=ginput(1);
        x2=floor((x)/15)*15; %got this idea from that steve guy on stackexchange
        y2=floor((y)/15)*15; %gives locating in IMAGE, not data array
        col=ceil((x)/15); %THIS gives array location
        row=ceil((y)/15);
        square=rectangle('position',[x2 y2 15 15],'PickableParts','all',...
            'visible','on','FaceColor',[0.9 0.6 0.5],'ButtonDownFcn',@boxCallbackVer2);
        if evalin('base','PlotChoice')=='Plot 1'
            Plot1Info=evalin('base','Plot1Info');
            Plot1Info(row,col)=18;
            assignin('base','Plot1Info',Plot1Info);
        elseif evalin('base','PlotChoice')=='Plot 2'
            Plot2Info=evalin('base','Plot2Info');
            Plot2Info(row,col)=18;
            assignin('base','Plot2Info',Plot2Info);
        elseif evalin('base','PlotChoice')=='Plot 3'
            Plot3Info=evalin('base','Plot3Info');
            Plot3Info(row,col)=18;
            assignin('base','Plot3Info',Plot3Info);
        end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)
    end
    
end
% hObject    handle to EnergyChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns EnergyChoice contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EnergyChoice


% --- Executes during object creation, after setting all properties.
function EnergyChoice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EnergyChoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if evalin('base','PlotChoice')=='Plot 1'
    Plot1Info=evalin('base','Plot1Info');
    Plot1Info(:,:)=0;
    assignin('base','Plot1Info',Plot1Info);
    
    updateSolar(1);
    updateWind(1);
    set(handles.WindPower,'String',num2str(evalin('base','WindPower')))
    set(handles.WindCost,'String',num2str(evalin('base','WindCost')))
    set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
    set(handles.WindArea,'String',num2str(evalin('base','WindArea')))
    set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
    set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
    set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
    set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
    set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
    set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
    set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
    set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
    set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
            
elseif evalin('base','PlotChoice')=='Plot 2'
    Plot2Info=evalin('base','Plot2Info');
    Plot2Info(:,:)=0;
    assignin('base','Plot2Info',Plot2Info);
    
    updateSolar(2);
    updateWind(2);
    set(handles.WindPower,'String',num2str(evalin('base','WindPower')))
    set(handles.WindCost,'String',num2str(evalin('base','WindCost')))
    set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
    set(handles.WindArea,'String',num2str(evalin('base','WindArea')))
    set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
    set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
    set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
    set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
    set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
    set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
    set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
    set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
    set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
    
elseif evalin('base','PlotChoice')=='Plot 3'
    Plot3Info=evalin('base','Plot3Info');
    Plot3Info(:,:)=0;
    assignin('base','Plot3Info',Plot3Info);
    
    updateSolar(3);
    updateWind(3);
    set(handles.WindPower,'String',num2str(evalin('base','WindPower')))
    set(handles.WindCost,'String',num2str(evalin('base','WindCost')))
    set(handles.TurbAmount,'String',num2str(evalin('base','TurbAmount')))
    set(handles.WindArea,'String',num2str(evalin('base','WindArea')))
    set(handles.SolarPower,'String',num2str(evalin('base','SolarPower')))
    set(handles.SolarCost,'String',num2str(evalin('base','SolarCost')))
    set(handles.PanelAmount,'String',num2str(evalin('base','PanelAmount')))
    set(handles.SolarArea,'String',num2str(evalin('base','SolarArea')))
    set(handles.TotalItems,'String',num2str(evalin('base','TotalItems')))
    set(handles.TotalPower,'String',num2str(evalin('base','TotalPower')))
    set(handles.TotalCost,'String',num2str(evalin('base','TotalCost')))
    set(handles.TotalArea,'String',num2str(evalin('base','SolarArea')+evalin('base','WindArea')))
    set(handles.CostToKW,'String',num2str(evalin('base','TotalCost')/evalin('base','TotalPower')))
    
end
PlotChoice_Callback(handles.PlotChoice,eventdata,handles)


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d=menu('Load Data for Which Image?','Image 1','Image 2','Image 3')
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
PlotChoice_Callback(handles.PlotChoice, eventdata, handles)



% --- Executes on button press in saveImage.
function saveImage_Callback(hObject, eventdata, handles)
% hObject    handle to saveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in printMaterials.
function printMaterials_Callback(hObject, eventdata, handles)
% hObject    handle to printMaterials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in saveData.
function saveData_Callback(hObject, eventdata, handles)
% hObject    handle to saveData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d=menu('Save Data for Which Plot?','Plot 1','Plot 2','Plot 3')
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
