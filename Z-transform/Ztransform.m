function varargout = Ztransform(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ztransform_OpeningFcn, ...
                   'gui_OutputFcn',  @Ztransform_OutputFcn, ...
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


% --- Executes just before Ztransform is made visible.
function Ztransform_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

axes(handles.UnitCircle);
grid on ;
zplane (0,0) 

axes(handles.Frequency);
grid on ;

function varargout = Ztransform_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in Zeros.
function Zeros_Callback(hObject, eventdata, handles)
% hObject    handle to Zeros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global z
global p 
[xz,yz] = ginput(1) ;
z = xz + yz*i 
zplane (z,p) 


% --- Executes on button press in Poles.
function Poles_Callback(hObject, eventdata, handles)
% hObject    handle to Poles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p
global z
[xp,yp] = ginput(1) ;
p = xp + yp*i 
zplane (z,p) 


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global z 
global p 
axes(handles.UnitCircle) 
zplane (0,0) 


% --- Executes on button press in Filter.
function Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global z
global p 
axes(handles.Frequency) 
freqz(z,p) 