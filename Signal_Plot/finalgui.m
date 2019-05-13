function varargout = finalgui(varargin)
% FINALGUI MATLAB code for finalgui.fig
%      FINALGUI, by itself, creates a new FINALGUI or raises the existing
%      singleton*.
%
%      H = FINALGUI returns the handle to a new FINALGUI or the handle to
%      the existing singleton*.
%
%      FINALGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALGUI.M with the given input arguments.
%
%      FINALGUI('Property','Value',...) creates a new FINALGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before finalgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to finalgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help finalgui

% Last Modified by GUIDE v2.5 20-Feb-2019 15:39:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finalgui_OpeningFcn, ...
                   'gui_OutputFcn',  @finalgui_OutputFcn, ...
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


% --- Executes just before finalgui is made visible.
function finalgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to finalgui (see VARARGIN)

% Choose default command line output for finalgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes finalgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes (handles.axes3) ;

ah = axes ('unit' , 'normalized' , 'position' , [0 0 1 1] ) ;
bg = imread  ('Background.jpg') ; imagesc(bg) ; 
set (ah , 'handlevisibility' , 'off' , 'visible' , 'off' ) ;    

    

% --- Outputs from this function are returned to the command line.
function varargout = finalgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Signal  
global y
global filename 

[filename,pathname] =uigetfile ( {'*.mat'} , 'Select File' ) ; 
ExPath = fullfile(pathname, filename);
load ( filename ) ;
Signal = val ;
y = 1:1:length(Signal) ; 
set(handles.text4, 'String', filename  );

% --- Executes on slider movement.
function Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global Signal 
global s 
global part 

s = get (handles.Slider , 'value' ) ; 

Size = length (Signal)  ;
constant = Size/10 ; 
front = (s-1)*constant+1 ;
back = s*constant ;
axes (handles.axes7) ;

if s==0
   
    plot (Signal ) ;
    
elseif     s == 1 
    
    Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
    
elseif s == 2   
    
    Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
    
elseif s == 3 
    
     Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
elseif s == 4   
    
     Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
    
elseif s == 5   
    
     Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
    
elseif s == 6  
    
    Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
    
elseif s == 7  
    
    Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
    
elseif s == 8  
    
    Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
    
elseif s == 9  
    
    Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
    
elseif s == 10  
    Signal ( [front :back] ) ;
    part = ans ;
    plot (part) ;
end 


% --- Executes during object creation, after setting all properties.
function Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Signal 
global s 
global part 
global flag 
global ss 
global filename 
flag = 0 ; 
ss = 1 ; 


axes ( handles.axes7 ) ;
Size = length (Signal)  ;
constant = Size/10 ; 

while  flag == 0   
    
  for s = ss : 1 : 10
    front = (s-1)*constant+1 ;
    back = s*constant ;
    
   set (handles.Slider , 'value' , s ) ; 
   Signal ( [front:back] ) ;
    part = ans ;
    plot (ans) ; 
   pause (1) ; 
   
   currnet = s ; 
  end 
  
      
 if s == 10 ;
       s = 1  ; 
 end 
   
end 
return ; 

axes ( handles.axes1) ;

global y 
    curve = animatedline ;
    for i = 1 : length (Signal) 
        addpoints ( curve , y(i) , Signal(i) ) ;
        drawnow
    end
% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in Pause.
function Pause_Callback(hObject, eventdata, handles)
% hObject    handle to Pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag  
flag = 1 ; 
pause (5) ; 

% --- Executes during object creation, after setting all properties.
function Pause_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in SIGNALPLAY.
function SIGNALPLAY_Callback(hObject, eventdata, handles)
% hObject    handle to SIGNALPLAY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Signal 
global flag 
flag = 0 ;
x = 1 : 1 : length(Signal) ;
axes (handles.axes7 ) ;
if  flag == 0 
B=Signal(1);
h = plot(B,'YDataSource','B');
for k = 1:length(Signal)
   B=Signal(1:k);
   refreshdata(h,'caller') 
   drawnow
end
end 
