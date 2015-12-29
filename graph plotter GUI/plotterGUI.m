function varargout = plotterGUI(varargin)
% PLOTTERGUI MATLAB code for plotterGUI.fig
%      PLOTTERGUI, by itself, creates a new PLOTTERGUI or raises the existing
%      singleton*.
%
%      H = PLOTTERGUI returns the handle to a new PLOTTERGUI or the handle to
%      the existing singleton*.
%
%      PLOTTERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOTTERGUI.M with the given input arguments.
%
%      PLOTTERGUI('Property','Value',...) creates a new PLOTTERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plotterGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plotterGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plotterGUI

% Last Modified by GUIDE v2.5 24-Jan-2014 17:09:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plotterGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @plotterGUI_OutputFcn, ...
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


% --- Executes just before plotterGUI is made visible.
function plotterGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plotterGUI (see VARARGIN)

% Choose default command line output for plotterGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plotterGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = plotterGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in keyPlot.
function keyPlot_Callback(hObject, eventdata, handles)
% hObject    handle to keyPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%hkeyPlot=findobj('Tag', 'keyPlot')
hxmin=findobj('Tag','editXmin');
xmin=str2double(get(hxmin, 'String'));

hxmax=findobj('Tag','editXmax');
xmax=str2double(get(hxmax, 'String'));

x=xmin:0.01:xmax;
heditFunction=findobj('Tag', 'editFunction');
plotAxes=findobj('Tag', 'plotAxes');
fun=get(heditFunction, 'String');

hax=handles.plotAxes;
y=eval(subs(fun,x));
plot(hax,x,y );
axis(hax, [xmin, xmax, min(y)-0.5, max(y)+0.5]);
xlabel(hax, 'x');
ylabel(hax, 'y');
grid(hax, 'on');


function editFunction_Callback(hObject, eventdata, handles)
% hObject    handle to editFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFunction as text
%        str2double(get(hObject,'String')) returns contents of editFunction as a double


% --- Executes during object creation, after setting all properties.
function editFunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over axes background.
function plotAxes_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to plotAxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function editXmin_Callback(hObject, eventdata, handles)
% hObject    handle to editXmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXmin as text
%        str2double(get(hObject,'String')) returns contents of editXmin as a double


% --- Executes during object creation, after setting all properties.
function editXmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editXmax_Callback(hObject, eventdata, handles)
% hObject    handle to editXmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXmax as text
%        str2double(get(hObject,'String')) returns contents of editXmax as a double


% --- Executes during object creation, after setting all properties.
function editXmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
