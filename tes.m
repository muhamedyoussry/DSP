function varargout = tes(varargin)
% TES MATLAB code for tes.fig
%      TES, by itself, creates a new TES or raises the existing
%      singleton*.
%
%      H = TES returns the handle to a new TES or the handle to
%      the existing singleton*.
%
%      TES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TES.M with the given input arguments.
%
%      TES('Property','Value',...) creates a new TES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tes

% Last Modified by GUIDE v2.5 28-Feb-2019 12:21:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tes_OpeningFcn, ...
                   'gui_OutputFcn',  @tes_OutputFcn, ...
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


% --- Executes just before tes is made visible.
function tes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tes (see VARARGIN)
guidata(hObject, handles);
% --- Outputs from this function are returned to the command line.
function varargout = tes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    [filename pathname] = uigetfile({'*.wav'},'Select File');
    handles.fullpathname = strcat(filename);
    [handles.y,handles.Fs] = audioread(handles.fullpathname);
    set(handles.text3, 'String',handles.fullpathname) %showing fullpathname
    global flag
    flag = 1
    subplot(2,1,1)
    plot(handles.y)
 catch
    set(handles.text3, 'String',' ')
    errordlg('please enter .wav file','error');     
end

guidata(hObject,handles)


function play_equalizer(hObject, handles)
    global flag
    flag = 0
global player;
[handles.y,handles.Fs] = audioread(handles.fullpathname);
handles.g1=get(handles.lp,'value');
handles.g2=get(handles.bp1,'value');
handles.g3=get(handles.bp2,'value');
handles.g4=get(handles.bp3,'value');
handles.g5=get(handles.bp4,'value');
handles.g6=get(handles.bp5,'value');
handles.g7=get(handles.bp6,'value');
handles.g8=get(handles.bp7,'value');
handles.g9=get(handles.bp8,'value');
handles.g10=get(handles.hp,'value');
set(handles.gain1, 'String',handles.g1);
set(handles.gain2, 'String',handles.g2);
set(handles.gain3, 'String',handles.g3);
set(handles.gain4, 'String',handles.g4);
set(handles.gain5, 'String',handles.g5);
set(handles.gain6, 'String',handles.g6);
set(handles.gain7, 'String',handles.g7);
set(handles.gain8, 'String',handles.g8);
set(handles.gain9, 'String',handles.g9);
set(handles.gain10, 'String',handles.g10);

cut_off=30; %cut off low pass dalama Hz
orde=25;
a=fir1(orde,cut_off/(handles.Fs/2),'low');
y1=handles.g1*filter(a,1,handles.y);

% %bandpass1
f1=31;
f2=60;
b1=fir1(orde,[f1/(handles.Fs/2) f2/(handles.Fs/2)],'bandpass');
y2=handles.g2*filter(b1,1,handles.y);
% 
% %bandpass2
f3=61;
f4=120;
b2=fir1(orde,[f3/(handles.Fs/2) f4/(handles.Fs/2)],'bandpass');
y3=handles.g3*filter(b2,1,handles.y);
% 
% %bandpass3
 f4=121;
f5=240;
 b3=fir1(orde,[f4/(handles.Fs/2) f5/(handles.Fs/2)],'bandpass');
 y4=handles.g4*filter(b3,1,handles.y);
% 
% %bandpass4
 f5=241;
f6=480;
 b4=fir1(orde,[f5/(handles.Fs/2) f6/(handles.Fs/2)],'bandpass');
 y5=handles.g5*filter(b4,1,handles.y);
% 
% %bandpass5
 f7=481;
f8=960;
  b5=fir1(orde,[f7/(handles.Fs/2) f8/(handles.Fs/2)],'bandpass');
  y6=handles.g6*filter(b5,1,handles.y);
% 
% %bandpass6
  f9=961;
f10=1900;
  b6=fir1(orde,[f9/(handles.Fs/2) f10/(handles.Fs/2)],'bandpass');
  y7=handles.g7*filter(b6,1,handles.y);
% 
% %bandpass7
  f11=1901;
f12=3800;
  b7=fir1(orde,[f11/(handles.Fs/2) f12/(handles.Fs/2)],'bandpass');
  y8=handles.g8*filter(b7,1,handles.y);
% 
 % %bandpass8
  f13=3801;
f14=7700;
  b8=fir1(orde,[f13/(handles.Fs/2) f14/(handles.Fs/2)],'bandpass');
  y9=handles.g9*filter(b8,1,handles.y);

 %highpass
cut_off2=15400;
c=fir1(orde,cut_off2/(handles.Fs/2),'high');
y10=handles.g10*filter(c,1,handles.y);
 handles.yT=y1+y2+y3+y4+y5+y6+y7+y8+y9+y10;
 player = audioplayer(handles.yT, handles.Fs);
 subplot(2,1,1);
 plot(handles.y);
 subplot(2,1,2);
 plot(handles.yT);
guidata(hObject,handles)

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
global flag
if flag == 1     
[handles.audio,fs]= audioread(handles.fullpathname);
handles.player=audioplayer(handles.audio,fs);
play(handles.player);
else
global player
play_equalizer(hObject, handles);
play(player)
end
guidata(hObject,handles) 

function Pause_Callback(hObject, eventdata, handles)
% hObject    handle to Pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
global flag
if flag == 1    
    pause(handles.player)
else
    pause(player);
end
guidata(hObject,handles)
% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
global flag
if flag == 1
stop(handles.player) 
else
stop(player);
end
guidata(hObject,handles)
% --- Executes on button press in Resume.
function Resume_Callback(hObject, eventdata, handles)
global player
global flag
if flag == 1 ;
    resume(handles.player)
else
    resume(player);
end
guidata(hObject,handles)

function Pop_Callback(hObject, eventdata, handles)
% hObject    handle to Pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag
flag = 0
g1 = -1.5;
g2 = 3.9;
g3 = 5.4;
g4 = 4.5;
g5 =  0.9;
g6 = -1.5;
g7 = -1.8;
g8= -2.1;
g9 = -2.1;
g10 = -0.3;
set(handles.lp,'value',g1);
set(handles.bp1,'value',g2);
set(handles.bp2,'value',g3);
set(handles.bp3,'value',g4);
set(handles.bp4,'value',g5);
set(handles.bp5,'value',g6);
set(handles.bp6,'value',g7);
set(handles.bp7,'value',g8);
set(handles.bp8,'value',g9);
set(handles.hp,'value',g10);
set(handles.gain1, 'String',g1);
set(handles.gain2, 'String',g2);
set(handles.gain3, 'String',g3);
set(handles.gain4, 'String',g4);
set(handles.gain5, 'String',g5);
set(handles.gain6, 'String',g6);
set(handles.gain7, 'String',g7);
set(handles.gain8, 'String',g8);
set(handles.gain9, 'String',g9);
set(handles.gain10, 'String',g10);

% --- Executes on button press in Reggae.
function Reggae_Callback(hObject, eventdata, handles)
global flag
flag = 0
g1 = 0;
g2 = 0;
g3 = -0.3;
g4 = -2.7;
g5 =  0;
g6 = 2.1;
g7 = 4.5;
g8= 3;
g9 = 0.6;
g10 = 0;
set(handles.lp,'value',g1);
set(handles.bp1,'value',g2);
set(handles.bp2,'value',g3);
set(handles.bp3,'value',g4);
set(handles.bp4,'value',g5);
set(handles.bp5,'value',g6);
set(handles.bp6,'value',g7);
set(handles.bp7,'value',g8);
set(handles.bp8,'value',g9);
set(handles.hp,'value',g10);
set(handles.gain1, 'String',g1);
set(handles.gain2, 'String',g2);
set(handles.gain3, 'String',g3);
set(handles.gain4, 'String',g4);
set(handles.gain5, 'String',g5);
set(handles.gain6, 'String',g6);
set(handles.gain7, 'String',g7);
set(handles.gain8, 'String',g8);
set(handles.gain9, 'String',g9);
set(handles.gain10, 'String',g10);
% hObject    handle to Reggae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Rock.
function Rock_Callback(hObject, eventdata, handles)
% hObject    handle to Rock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag
flag = 0
g1 = 4.5;
g2 = -3.6;
g3 = -6.6;
g4 = -2.7;
g5 =  2.1;
g6 = 6;
g7 = 7.5;
g8= 7.8;
g9 =7.8;
g10 = 8.1;
set(handles.lp,'value',g1);
set(handles.bp1,'value',g2);
set(handles.bp2,'value',g3);
set(handles.bp3,'value',g4);
set(handles.bp4,'value',g5);
set(handles.bp5,'value',g6);
set(handles.bp6,'value',g7);
set(handles.bp7,'value',g8);
set(handles.bp8,'value',g9);
set(handles.hp,'value',g10);
set(handles.gain1, 'String',g1);
set(handles.gain2, 'String',g2);
set(handles.gain3, 'String',g3);
set(handles.gain4, 'String',g4);
set(handles.gain5, 'String',g5);
set(handles.gain6, 'String',g6);
set(handles.gain7, 'String',g7);
set(handles.gain8, 'String',g8);
set(handles.gain9, 'String',g9);
set(handles.gain10, 'String',g10);

% --- Executes on button press in Techno.
function Techno_Callback(hObject, eventdata, handles)
% hObject    handle to Techno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag
flag = 0
g1 = 4.8;
g2 = 4.2;
g3 = 1.5;
g4 = -2.4;
g5 =  -3.3;
g6 = -1.5;
g7 = 1.5;
g8= 5.1;
g9 = 5.7;
g10 = 5.4;
set(handles.lp,'value',g1);
set(handles.bp1,'value',g2);
set(handles.bp2,'value',g3);
set(handles.bp3,'value',g4);
set(handles.bp4,'value',g5);
set(handles.bp5,'value',g6);
set(handles.bp6,'value',g7);
set(handles.bp7,'value',g8);
set(handles.bp8,'value',g9);
set(handles.hp,'value',g10);
set(handles.gain1, 'String',g1);
set(handles.gain2, 'String',g2);
set(handles.gain3, 'String',g3);
set(handles.gain4, 'String',g4);
set(handles.gain5, 'String',g5);
set(handles.gain6, 'String',g6);
set(handles.gain7, 'String',g7);
set(handles.gain8, 'String',g8);
set(handles.gain9, 'String',g9);
set(handles.gain10, 'String',g10);

% --- Executes on button press in Party.
function Party_Callback(hObject, eventdata, handles)
% hObject    handle to Party (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag
flag = 0
g1 = 5.4;
g2 = 0;
g3 = 0;
g4 = 0;
g5 =  0;
g6 = 0;
g7 = 0;
g8= 0;
g9 = 0;
g10 = 5.4;
set(handles.lp,'value',g1);
set(handles.bp1,'value',g2);
set(handles.bp2,'value',g3);
set(handles.bp3,'value',g4);
set(handles.bp4,'value',g5);
set(handles.bp5,'value',g6);
set(handles.bp6,'value',g7);
set(handles.bp7,'value',g8);
set(handles.bp8,'value',g9);
set(handles.hp,'value',g10);
set(handles.gain1, 'String',g1);
set(handles.gain2, 'String',g2);
set(handles.gain3, 'String',g3);
set(handles.gain4, 'String',g4);
set(handles.gain5, 'String',g5);
set(handles.gain6, 'String',g6);
set(handles.gain7, 'String',g7);
set(handles.gain8, 'String',g8);
set(handles.gain9, 'String',g9);
set(handles.gain10, 'String',g10);

% --- Executes on button press in Classical.
function Classical_Callback(hObject, eventdata, handles)
% hObject    handle to Classical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag
flag = 0
g1 = 0;
g2 = 0;
g3 = 0;
g4 = 0;
g5 =  0;
g6 = 0;
g7 = -0.3;
g8= -5.7;
g9 = -6;
g10 = -8.1;
set(handles.lp,'value',g1);
set(handles.bp1,'value',g2);
set(handles.bp2,'value',g3);
set(handles.bp3,'value',g4);
set(handles.bp4,'value',g5);
set(handles.bp5,'value',g6);
set(handles.bp6,'value',g7);
set(handles.bp7,'value',g8);
set(handles.bp8,'value',g9);
set(handles.hp,'value',g10);

set(handles.gain1, 'String',g1);
set(handles.gain2, 'String',g2);
set(handles.gain3, 'String',g3);
set(handles.gain4, 'String',g4);
set(handles.gain5, 'String',g5);
set(handles.gain6, 'String',g6);
set(handles.gain7, 'String',g7);
set(handles.gain8, 'String',g8);
set(handles.gain9, 'String',g9);
set(handles.gain10, 'String',g10);
% --------------------------------------------------------------------
% --- Executes on slider movement.
function hp_Callback(hObject, eventdata, handles)
g10 = get(handles.hp,'value');
set(handles.gain10, 'String',g10);
global flag
flag = 0
 guidata(hObject,handles)
 function hp_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function bp8_Callback(hObject, eventdata, handles)
g9 = get(handles.bp8,'value');
set(handles.gain9, 'String',g9);
global flag
flag = 0 
guidata(hObject,handles)

function bp8_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function bp7_Callback(hObject, eventdata, handles)
g8 = get(handles.bp7,'value');
set(handles.gain8, 'String',g8);
global flag
flag = 0 
guidata(hObject,handles)

function bp7_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function bp6_Callback(hObject, eventdata, handles)
g7 = get(handles.bp6,'value');
set(handles.gain7, 'String',g7);
global flag
flag = 0 
guidata(hObject,handles)

function bp6_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function bp5_Callback(hObject, eventdata, handles)
g6 = get(handles.bp5,'value');
set(handles.gain6, 'String',g6);
global flag
flag = 0 
guidata(hObject,handles)

function bp5_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function bp4_Callback(hObject, eventdata, handles)
g5 = get(handles.bp4,'value');
set(handles.gain5, 'String',g5);
global flag
flag = 0 
guidata(hObject,handles)

function bp4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function bp3_Callback(hObject, eventdata, handles)
g4 = get(handles.bp3,'value');
set(handles.gain4, 'String',g4);
global flag
flag = 0 
guidata(hObject,handles)

function bp3_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function bp2_Callback(hObject, eventdata, handles)
g3 = get(handles.bp2,'value');
set(handles.gain3, 'String',g3);
global flag
flag = 0 
guidata(hObject,handles)


function bp2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function bp1_Callback(hObject, eventdata, handles)
g2 = get(handles.bp1,'value');
set(handles.gain2, 'String',g2);
global flag
flag = 0 
guidata(hObject,handles)

function bp1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function lp_Callback(hObject, eventdata, handles)
g1 = get(handles.lp,'value');
set(handles.gain1, 'String',g1);
global flag
flag = 0 
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function lp_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in applyEffect.
function applyEffect_Callback(hObject, eventdata, handles)
global flag 
flag = 0;
stop(handles.player)
guidata(hObject,handles)

% --- Executes on button press in removeEffect.
function removeEffect_Callback(hObject, eventdata, handles)
set(handles.lp,'value',0);
set(handles.bp1,'value',0);
set(handles.bp2,'value',0);
set(handles.bp3,'value',0);
set(handles.bp4,'value',0);
set(handles.bp5,'value',0);
set(handles.bp6,'value',0);
set(handles.bp7,'value',0);
set(handles.bp8,'value',0);
set(handles.hp,'value',0);
set(handles.gain1, 'String','');
set(handles.gain2, 'String','');
set(handles.gain3, 'String','');
set(handles.gain4, 'String','');
set(handles.gain5, 'String','');
set(handles.gain6, 'String','');
set(handles.gain7, 'String','');
set(handles.gain8, 'String','');
set(handles.gain9, 'String','');
set(handles.gain10, 'String','');
global flag
flag = 1
global player
stop(player)

guidata(hObject,handles)
