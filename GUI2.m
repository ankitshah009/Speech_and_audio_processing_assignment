function varargout = GUI2(varargin)
% GUI2 MATLAB code for GUI2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI2

% Last Modified by GUIDE v2.5 26-Oct-2014 22:29:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_OutputFcn, ...
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


% --- Executes just before GUI2 is made visible.
function GUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI2 (see VARARGIN)
handles.audio = audiorecorder;
%handles.a=0;
% Choose default command line output for GUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%handles.a = 0;
%[filename pathname] = uigetfile({'*.wav','File Selector'});
%handles.a = audioread(filename);
%fullpathname = strcat(pathname,filename);
%axes(handles.axes1);
%plot(handles.a);
%axes(handles.axes2);
%specgram(handles.a, 1024, 8000);
%title('Spectrogram of Original Signal');
%guidata(hObject,handles);
[FileName,PathName] = uigetfile({'*.wav'},'Load Wav File');
    [x,fs] = wavread([PathName '/' FileName]);
    handles.x = x;
    handles.fs = fs;
    axes(handles.axes1);
    time = 0:1/fs:(length(handles.x)-1)/fs;
    plot(time,handles.x);
    title('Original Signal');
    axes(handles.axes2);
    specgram(handles.x, 1024, handles.fs);
    title('Spectrogram of Original Signal');
guidata(hObject,handles);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

record(handles.audio);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

stop(handles.audio);
a = getaudiodata(handles.audio);
axes(handles.axes1);
plot(a);


% --- Executes on button press in pushbutton5.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=8000;
axes(handles.axes3);
time = 0:1/fs:(length(handles.x)-1)/fs;
plot(time,handles.x);
RECT = (ginput(2));
xmin = RECT(1);
xmax = RECT(2);
% zoom in on the time data
axis([xmin xmax -0.5 0.5]);
s=handles.x(xmin:xmax);
title('Zoomed Signal');



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
%handles.FSQ = (get(hObject,'Value'));

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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=8000;
axes(handles.axes3);
time = 0:1/fs:(length(handles.x)-1)/fs;
plot(time,handles.x);
RECT = (ginput(2));
xmin = RECT(1);
xmax = RECT(2);
% zoom in on the time data
axis([xmin xmax -0.5 0.5]);
s=handles.x(xmin*fs:xmax*fs);
sound(s, fs);
axes(handles.axes4);
plot(abs(fft(s)));


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=8000;
axes(handles.axes3);
time = 0:1/fs:(length(handles.x)-1)/fs;
plot(time,handles.x);
RECT = (ginput(2));
xmin = RECT(1);
xmax = RECT(2);
% zoom in on the time data
axis([xmin xmax -0.5 0.5]);
x=handles.x(xmin*fs:xmax*fs);
frame_length = 8*20;
m = length(x);
no_frames = m / frame_length;
count = 0;count1 = 0;
for k = 1 : no_frames
    frame = x((k-1)*frame_length + 1 : k * frame_length);
    max_val = max(frame);
    min_val = min(frame);
    
    if(max_val > 0.3 && min_val < -0.3)
        count1 = count1 + 1;
        voiced_speech((count1-1)*frame_length + 1 : count1 * frame_length) = frame;
    else
        count = count + 1;
        unvoiced_speech((count-1)*frame_length + 1 : count * frame_length) = frame;
    end
end
y = voiced_speech;
[autocor,lags] = xcorr(y);
autocor = autocor(find(lags==0):end);
auto=autocor(21:160);
 
max1=0;
  for uu=1:140
    if(auto(uu)>max1)
      max1=auto(uu);
      sample_no=uu;
    end 
  end
  
  pitch_period_To=(20+sample_no)*(1/fs);
  pitch_freq_Fo=1/pitch_period_To;
  disp('OBSERVATIONS');
  disp('Pitch :')
  disp(pitch_freq_Fo);
