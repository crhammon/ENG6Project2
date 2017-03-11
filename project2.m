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

% Last Modified by GUIDE v2.5 11-Mar-2017 11:00:26

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
assignin('base','count',0)
assignin('base','count1',0)
assignin('base','count2',0)
assignin('base','count3',0)
assignin('base','count4',0)
assignin('base','count5',0)
assignin('base','count6',0)
assignin('base','count7',0)
assignin('base','count8',0)
assignin('base','count9',0)
assignin('base','count10',0)
assignin('base','count11',0)
assignin('base','count12',0)
assignin('base','count13',0)
assignin('base','count14',0)
assignin('base','count15',0)
assignin('base','count16',0)
assignin('base','count17',0)
assignin('base','count18',0)


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

% --- Executes on powerOption change in popupmenu1.
function PlotChoice_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

contents = cellstr(get(hObject,'String')); %returns popupmenu1 contents as cell array
PlotChoice = contents{get(hObject,'Value')};%returns selected item from popupmenu1
global image
% while evalin('base','count') ~= 11
if (strcmp(PlotChoice,'Plot 1'))
    
    image = imread('plot1.jpg');
    
    imshow(image)
    
    b=size([1:15:size(image,1)]);%gives number of rows

    assignin('base','b',b)

    c=size([1:15:size(image,2)]);%gives number of columns

    assignin('base','c',c)

     

    assignin('base','countArrayPlot1',zeros(b(2),c(2)));


    
for c=1:15:size(image,2)

    for b=1:15:size(image,1)
        square=rectangle('position',[c b 15 15],'PickableParts','all','visible','off','FaceColor','b','ButtonDownFcn',@boxCallback);
    end

end

elseif (strcmp(PlotChoice,'Plot 2'))
    
    image = imread('plot2.jpg');
    
    imshow(image)

for c=1:15:size(image,2)

    for b=1:15:size(image,1)
        square=rectangle('position',[c b 15 15],'PickableParts','all','visible','off','FaceColor','b','ButtonDownFcn',@boxCallback);
    end

end
    
elseif (strcmp(PlotChoice,'Plot 3'))
    
    image = imread('plot3.jpg');
    
    imshow(image);
    
for c=1:15:size(image,2)

    for b=1:15:size(image,1)
        square=rectangle('position',[c b 15 15],'PickableParts','all','visible','off','FaceColor','b','ButtonDownFcn',@boxCallback);
        assignin('base','square1',square)
    end

end
    
end
count = evalin('base','count');
if count == 10
    errordlg({'Click an option to continue.'},'Limit Reached')
end
assignin('base','image',image);

% --- Executes on button press in SF50048.
function SF50048_Callback(hObject, eventdata, handles)
assignin('base','count',0)
assignin('base','color',[0.6 0.3 1])
assignin('base','select',1)
% Hint: get(hObject,'Value') returns toggle state of SF50048


% --- Executes on button press in SF39810.
function SF39810_Callback(hObject, eventdata, handles)
% hObject    handle to SF39810 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','color','r')
assignin('base','count',0)
assignin('base','select',2)
% returns toggle state of SF39810


% --- Executes on button press in ISSPCC5W.
function ISSPCC5W_Callback(hObject, eventdata, handles)
% hObject    handle to ISSPCC5W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','color','b')
assignin('base','count',0)
assignin('base','select',3)
% returns toggle state of ISSPCC5W


% --- Executes on button press in ISSP100W.
function ISSP100W_Callback(hObject, eventdata, handles)
% hObject    handle to ISSP100W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','color','m')
assignin('base','count',0)
assignin('base','select',4)
% returns toggle state of ISSP100W


% --- Executes on button press in ISSPCC30W.
function ISSPCC30W_Callback(hObject, eventdata, handles)
% hObject    handle to ISSPCC30W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','color','y')
assignin('base','select',5)
% returns toggl5 state of ISSPCC30W


% --- Executes on button press in InstaparkSP10W.
function InstaparkSP10W_Callback(hObject, eventdata, handles)
% hObject    handle to InstaparkSP10W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','color',[0.3 0.9 0.1])
assignin('base','select',6)
% returns toggle state of InstaparkSP10W


% --- Executes on button press in Ramsond100SP.
function Ramsond100SP_Callback(hObject, eventdata, handles)
% hObject    handle to Ramsond100SP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',7)
assignin('base','color','c')
% returns toggle state of Ramsond100SP


% --- Executes on button press in EWK5012.
function EWK5012_Callback(hObject, eventdata, handles)
% hObject    handle to EWK5012 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',8)
assignin('base','color',[1 0.6 0])
% Hint: get(hObject,'Value') returns toggle state of EWK5012


% --- Executes on button press in SPE18.
function SPE18_Callback(hObject, eventdata, handles)
% hObject    handle to SPE18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',9)
assignin('base','color',[0.5 0.5 0.5])
% Hint: get(hObject,'Value') returns toggle state of SPE18


% --- Executes on button press in SPT5.
function SPT5_Callback(hObject, eventdata, handles)
% hObject    handle to SPT5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',10)
assignin('base','color',[0.9 1 0.7])
% Hint: get(hObject,'Value') returns toggle state of SPT5


% --- Executes on button press in WMHY10005.
function WMHY10005_Callback(hObject, eventdata, handles)
% hObject    handle to WMHY10005 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','color',[0.4 0.7 0.1])
assignin('base','select',11)
% Hint: get(hObject,'Value') returns toggle state of WMHY10005


% --- Executes on button press in WMHY400.
function WMHY400_Callback(hObject, eventdata, handles)
% hObject    handle to WMHY400 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',12)
assignin('base','color',[0.7 0.1 0.5])
% Hint: get(hObject,'Value') returns toggle state of WMHY400


% --- Executes on button press in GCWG400.
function GCWG400_Callback(hObject, eventdata, handles)
% hObject    handle to GCWG400 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',13)
assignin('base','color',[0.8 0.8 0.3])
% Hint: get(hObject,'Value') returns toggle state of GCWG400


% --- Executes on button press in GCWG700.
function GCWG700_Callback(hObject, eventdata, handles)
% hObject    handle to GCWG700 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',14)
assignin('base','color',[0.3 0.5 1])
% Hint: get(hObject,'Value') returns toggle state of GCWG700


% --- Executes on button press in APAAPWT.
function APAAPWT_Callback(hObject, eventdata, handles)
% hObject    handle to APAAPWT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',15)
assignin('base','color',[0 0 0])
% Hint: get(hObject,'Value') returns toggle state of APAAPWT


% --- Executes on button press in SF45444.
function SF45444_Callback(hObject, eventdata, handles)
% hObject    handle to SF45444 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',16)
assignin('base','color',[0.7 0.7 1])
% Hint: get(hObject,'Value') returns toggle state of SF45444


% --- Executes on button press in SF44444.
function SF44444_Callback(hObject, eventdata, handles)
% hObject    handle to SF44444 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',17)
assignin('base','color',[0.9 0.4 0.4])
% Hint: get(hObject,'Value') returns toggle state of SF44444


% --- Executes on button press in WNWCK750.
function WNWCK750_Callback(hObject, eventdata, handles)
% hObject    handle to WNWCK750 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','count',0)
assignin('base','select',18)
assignin('base','color',[0.9 0.6 0.5])
% Hint: get(hObject,'Value') returns toggle state of WNWCK750

function Delete_Callback(hObject, eventdata, handles)
% hObject    handle to WNWCK750 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

assignin('base','select',0)


% Hint: get(hObject,'Value') returns toggle state of WNWCK750


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)

% hold on
% for c=1:15:size(image,2)
%     for b=1:15:size(image,1)
%     square=rectangle('position',[c b 15 15],'PickableParts','all','visible','off','FaceColor','b','ButtonDownFcn',@boxCallback);
%     end
% end 


% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function SolarAmount_Callback(hObject, eventdata, handles)
% hObject    handle to SolarAmount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SolarAmount as text
%        str2double(get(hObject,'String')) returns contents of SolarAmount as a double


% --- Executes during object creation, after setting all properties.
function SolarAmount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SolarAmount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wattage_Callback(hObject, eventdata, handles)
% hObject    handle to Wattage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wattage as text
%        str2double(get(hObject,'String')) returns contents of Wattage as a double


% --- Executes during object creation, after setting all properties.
function Wattage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wattage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WindAmount_Callback(hObject, eventdata, handles)
% hObject    handle to WindAmount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WindAmount as text
%        str2double(get(hObject,'String')) returns contents of WindAmount as a double


% --- Executes during object creation, after setting all properties.
function WindAmount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindAmount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cost_Callback(hObject, eventdata, handles)
% hObject    handle to cost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cost as text
%        str2double(get(hObject,'String')) returns contents of cost as a double


% --- Executes during object creation, after setting all properties.
function cost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % --- Executes on button press in Delete.
% function radiobutton22_Callback(hObject, eventdata, handles)
% % hObject    handle to Delete (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of Delete
