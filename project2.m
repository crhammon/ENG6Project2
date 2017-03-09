
function varargout = project2(varargin)
% PROJECT2 MATLAB code for project2.fig
%      PROJECT2, by itself, creates a new PROJECT2 or raises the existing
%      singleton*.
%
%      H = PROJECT2 returns the handle to a new PROJECT2 or the handle to
%      the existing singleton*.
%
%      PROJECT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT2.M with the given input arguments.
%
%      PROJECT2('Property','Value',...) creates a new PROJECT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project2

% Last Modified by GUIDE v2.5 09-Mar-2017 14:43:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project2_OpeningFcn, ...
                   'gui_OutputFcn',  @project2_OutputFcn, ...
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


% --- Executes just before project2 is made visible.
function project2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project2 (see VARARGIN)

% Choose default command line output for project2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes during object creation, after setting all properties.
function PlotChoice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu1.
function PlotChoice_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

contents = cellstr(get(hObject,'String')); %returns popupmenu1 contents as cell array
PlotChoice = contents{get(hObject,'Value')};%returns selected item from popupmenu1


if (strcmp(PlotChoice,'Plot 1'))
    
    image = imread('plot1.jpg');
    
    imshow(image)
    
elseif (strcmp(PlotChoice,'Plot 2'))
    
    image = imread('plot2.jpg');
    
    imshow(image)
    
elseif (strcmp(PlotChoice,'Plot 3'))
    
    image = imread('plot3.jpg');
    
    imshow(image);
    
end

assignin('base','image',image);

% --- Executes on button press in SF50048.
function SF50048_Callback(hObject, eventdata, handles)


% Hint: get(hObject,'Value') returns toggle state of SF50048


% --- Executes on button press in SF39810.
function SF39810_Callback(hObject, eventdata, handles)
% hObject    handle to SF39810 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SF39810


% --- Executes on button press in ISSPCC5W.
function ISSPCC5W_Callback(hObject, eventdata, handles)
% hObject    handle to ISSPCC5W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ISSPCC5W


% --- Executes on button press in ISSP100W.
function ISSP100W_Callback(hObject, eventdata, handles)
% hObject    handle to ISSP100W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ISSP100W


% --- Executes on button press in ISSPCC30W.
function ISSPCC30W_Callback(hObject, eventdata, handles)
% hObject    handle to ISSPCC30W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ISSPCC30W


% --- Executes on button press in InstaparkSP10W.
function InstaparkSP10W_Callback(hObject, eventdata, handles)
% hObject    handle to InstaparkSP10W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of InstaparkSP10W


% --- Executes on button press in Ramsond100SP.
function Ramsond100SP_Callback(hObject, eventdata, handles)
% hObject    handle to Ramsond100SP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Ramsond100SP


% --- Executes on button press in EWK5012.
function EWK5012_Callback(hObject, eventdata, handles)
% hObject    handle to EWK5012 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of EWK5012


% --- Executes on button press in SPE18.
function SPE18_Callback(hObject, eventdata, handles)
% hObject    handle to SPE18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SPE18


% --- Executes on button press in SPT5.
function SPT5_Callback(hObject, eventdata, handles)
% hObject    handle to SPT5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SPT5


% --- Executes on button press in WMHY10005.
function WMHY10005_Callback(hObject, eventdata, handles)
% hObject    handle to WMHY10005 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WMHY10005


% --- Executes on button press in WMHY400.
function WMHY400_Callback(hObject, eventdata, handles)
% hObject    handle to WMHY400 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WMHY400


% --- Executes on button press in GCWG400.
function GCWG400_Callback(hObject, eventdata, handles)
% hObject    handle to GCWG400 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of GCWG400


% --- Executes on button press in GCWG700.
function GCWG700_Callback(hObject, eventdata, handles)
% hObject    handle to GCWG700 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of GCWG700


% --- Executes on button press in APAAPWT.
function APAAPWT_Callback(hObject, eventdata, handles)
% hObject    handle to APAAPWT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of APAAPWT


% --- Executes on button press in SF45444.
function SF45444_Callback(hObject, eventdata, handles)
% hObject    handle to SF45444 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SF45444


% --- Executes on button press in SF44444.
function SF44444_Callback(hObject, eventdata, handles)
% hObject    handle to SF44444 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SF44444


% --- Executes on button press in WNWCK750.
function WNWCK750_Callback(hObject, eventdata, handles)
% hObject    handle to WNWCK750 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WNWCK750

% function myfunc
% fig = uifigure;
% bg = uibuttongroup(fig,...
%                   'Title','Power Options',...
%                   'Position', [10 0 500 500],...
%                   'SelectionChangedFcn',@(bg,event) bselection(bg,event));
% 
%               
% % Create three radio buttons in the button group.
% SF50048 = uiradiobutton(bg,...
%                   'Text','Sunforce 50048/ Amorphous Silicon/ 15 W/ 42.5in x 1.5in x 16in / 11 lbs / $279.95',...
%                   'Position',[10 460 550 15]);
%               
% SF39810 = uiradiobutton(bg,...
%                   'Text','Sunforce 39810/ Polycrystalline / 80 W/ 21in x 48in x 2in/ 22lbs/ $499.95',...
%                   'Position',[10 445 550 15]);
% 
% ISSPCC5W = uiradiobutton(bg,...
%                   'Text','Instapark SPCC-5W/ Mono-crystalline/ 5 W/ 11in x 8in x 1in/ 2.8 lbs/ $34.95',...
%                   'Position',[10 430 550 15]);
%               
% ISSP100W = uiradiobutton(bg,...
%                   'Text','Instapark SP-100W/ Mono-crystalline/ 100 W/ 45in x 1.5in x 26in/ 21 lbs/ $319.99',...
%                   'Position',[10 415 550 15]);
% 
% ISSPCC30W = uiradiobutton(bg,...
%                   'Text','Instapark SPCC-30W/ Mono-crystalline/ 30 W/ 21.5in x 1.1in x 17.2in/ 7.2 lbs/ $114.70',...
%                   'Position',[10 400 550 15]);
% 
% InstaparkSP10W = uiradiobutton(bg,...
%                   'Text','Instapark SP-10W/ Mono-crystalline/ 10 W/ 14in x 11in x 1in/ 2.8 lbs/ $39.95',...
%                   'Position',[10 385 550 15]);
% 
% Ramsond100SP = uiradiobutton(bg,...
%                   'Text','Ramsond 100SP/ Mono-crystalline/ 100 W/ 47in x 1.5in x 21.8in/ 12 lbs/ $245.99',...
%                   'Position',[10 370 550 15]);
% 
% EWK5012 = uiradiobutton(bg,...
%                   'Text','Epcom WK50-12/ Polycrystalline/ 50 W/ 32in x 22in x 1.4in/ 12 lbs/ $99.99',...
%                   'Position',[10 355 550 15]);
% 
% SPE18 = uiradiobutton(bg,...
%                   'Text','Sun Power E18/ Mono-crystalline/ 400 W/ 41.18in x 81.36in x 2.13in/ 56 lbs / $249.50',...
%                   'Position',[10 340 550 15]);
% 
% SPT5 = uiradiobutton(bg,...
%                   'Text','Sun Power T5/ Mono-crystalline/ 320 W/ 43.06in x 75.13in x 8.37in/ 47 lbs/ $199.99',...
%                   'Position',[10 325 550 15]);
% 
% WMHY10005 = uiradiobutton(bg,...
%                   'Text','Windmax HY 1000-5/ Wind Generator/ 1000 W/ 15ft/ $999.99',...
%                   'Position',[10 295 550 15]);
% 
% WMHY400 = uiradiobutton(bg,...
%                   'Text','Windmax HY 400/ Wind Generator/ 500 W/ 13 ft/ $686.40',...
%                   'Position',[10 280 550 15]);
% 
% GCWG400 = uiradiobutton(bg,...
%                   'Text','GudCraft WG400/ Wind Generator/ 400 W/ 13 ft/ $399.00',...
%                   'Position',[10 265 550 15]);
% 
% GCWG700 = uiradiobutton(bg,...
%                   'Text','GudCraft WG700/ Wind Generator/ 700 W/ 13 ft/ $449.00',...
%                   'Position',[10 250 550 15]);
% 
% APAAPWT = uiradiobutton(bg,...
%                   'Text','All Power America APWT400A/ 400 W/ 10 ft/ $476.93',...
%                   'Position',[10 235 550 15]);
% 
% SF45444 = uiradiobutton(bg,...
%                   'Text','Sunforce 45444/ Wind Turbine/ 600 W/ 10 ft/ $749.99',...
%                   'Position',[10 220 550 15]);
% 
% SF44444 = uiradiobutton(bg,...
%                   'Text','Sunforce 44444/ Wind Generator/ 400 W/ 10 ft/ $474.34',...
%                   'Position',[10 205 550 15]);
%               
% WNWCK750 = uiradiobutton(bg,...
%                   'Text','WindyNation WCK-750/ Wind Turbine/ 750 W/ 15 ft/ $999.98',...
%                   'Position',[10 190 550 15]);
%                    
%          
%  
