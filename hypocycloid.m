function varargout = hypocycloid(varargin)
% HYPOCYCLOID MATLAB code for hypocycloid.fig
%      HYPOCYCLOID, by itself, creates a new HYPOCYCLOID or raises the existing
%      singleton*.
%
%      H = HYPOCYCLOID returns the handle to a new HYPOCYCLOID or the handle to
%      the existing singleton*.
%
%      HYPOCYCLOID('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HYPOCYCLOID.M with the given input arguments.
%
%      HYPOCYCLOID('Property','Value',...) creates a new HYPOCYCLOID or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hypocycloid_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hypocycloid_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hypocycloid

% Last Modified by GUIDE v2.5 11-Dec-2013 20:14:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hypocycloid_OpeningFcn, ...
                   'gui_OutputFcn',  @hypocycloid_OutputFcn, ...
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

% --- Executes just before hypocycloid is made visible.
function hypocycloid_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hypocycloid (see VARARGIN)

% Choose default command line output for hypocycloid
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using hypocycloid.


% UIWAIT makes hypocycloid wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hypocycloid_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in btnstart.
function btnstart_Callback(hObject, eventdata, handles)
% hObject    handle to btnstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stop a n d b rounds
axes(handles.axes);
cla
hold on
xlabel('x')
ylabel('y')
axis square
stop=0;
% collect input values from textboxes
b_str=get(handles.edtb,'string');
b=str2num(b_str);
n_str=get(handles.edtn,'string');
n=str2num(n_str);
d_str=get(handles.edtd,'string');
d=str2num(d_str);
rounds_str=get(handles.edtrounds,'string');
rounds=str2num(rounds_str);

a=n/d;

% calculate outer circle coordinates
i=1;
for phi=0:pi/100:2*pi
    xa(i)=a*cos(phi);
    ya(i)=a*sin(phi);
    i=i+1;
end

plot(xa,ya,'linewidth',2)

ax=1.2*a;

% calculate coordinates for P and animate hypocycloid
i=1;
for phi=0:pi/100:2*pi*rounds
        cla
        xP(i)=(a-b)*cos(phi) + b*cos((a-b)/b *phi);
        yP(i)=(a-b)*sin(phi) - b*sin((a-b)/b *phi);
        xb(i)=(a-b)*cos(phi);
        yb(i)=(a-b)*sin(phi);
        plot(xa,ya,'linewidth',2)
        plot(xP,yP,'r')
        plot([0 xb(i) xP(i)],[0 yb(i) yP(i)],'--o');
        axis square
        i=i+1;
        if stop ==1
            break
        end
        pause(0.02)
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});



function edtb_Callback(hObject, eventdata, handles)
% hObject    handle to edtb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtb as text
%        str2double(get(hObject,'String')) returns contents of edtb as a double


% --- Executes during object creation, after setting all properties.
function edtb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtn_Callback(hObject, eventdata, handles)
% hObject    handle to edtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtn as text
%        str2double(get(hObject,'String')) returns contents of edtn as a double


% --- Executes during object creation, after setting all properties.
function edtn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtd_Callback(hObject, eventdata, handles)
% hObject    handle to edtd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtd as text
%        str2double(get(hObject,'String')) returns contents of edtd as a double


% --- Executes during object creation, after setting all properties.
function edtd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtrounds_Callback(hObject, eventdata, handles)
% hObject    handle to edtrounds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtrounds as text
%        str2double(get(hObject,'String')) returns contents of edtrounds as a double


% --- Executes during object creation, after setting all properties.
function edtrounds_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtrounds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnstop.
function btnstop_Callback(hObject, eventdata, handles)
% hObject    handle to btnstop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stop

stop=1;
