function varargout = CompressGui(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CompressGui_OpeningFcn, ...
                   'gui_OutputFcn',  @CompressGui_OutputFcn, ...
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



function CompressGui_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);

function varargout = CompressGui_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function Browse_Callback(hObject, eventdata, handles)


[filename pathname] = uigetfile({'*.*',  'All Files (*.*)'} ,'File Selector');
handles.filename = strcat(filename );  % browse the specific file 

set(handles.Filename, 'String',handles.filename) % showing file name on static text  
global Signal 
Signal = importdata(filename) ;    % load signal to matlab 
axes (handles.OriginalPlot) ;  % control the axes show

    if isa(Signal,'struct')==1  % if data is an array plot it 
        plot(Signal.data) ; 
    else                        % if data is matrix plot it 
        plot (Signal) ;
    end


function Compress_Callback(hObject, eventdata, handles)


function Decompress_Callback(hObject, eventdata, handles)

function Filename_Callback(hObject, eventdata, handles)

function Filename_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function View_Callback(hObject, eventdata, handles)

global Signal 
global flag 
global g 
axes (handles.OriginalPlot) ;  % control the axes show
flag = 0 ;
if isa(Signal,'struct')==1
    
        for i = 0 : length(Signal)/5000 :length(Signal.data) 
            plot ( Signal.data ) ;     % plot Signal
            axis ([ i+1 i+length(Signal)/1000  -1 1 ]); % control the axis limits
            pause (0.01) ; 
            g = i ;
            if flag == 1
                break ;
            end 
        end 
else 
    
     for i = 0 : length(Signal)/5000 :length(Signal) 
            plot ( Signal) ;     % plot Signal
            axis ([ i+1 i+length(Signal)/1000  min(Signal) max(Signal) ]); % control the axis limits
            pause (0.01) ; 
            g = i ;
            if flag == 1
                break ;
            end 
      end 
end


function Toggle_Callback(hObject, eventdata, handles)

 global flag 
 global g 
 global Signal
x = get(hObject,'Value') ;

if x == 1 
   
    flag = 1 ;
    pause ;
elseif x == 0
    
    if isa(Signal,'struct')==1

            for f = g : 10000 :length(Signal.data) 
                plot ( Signal.data ) ;     % plot Signal
                axis ([ f+1 f+100000  min(Signal.data) max(Signal.data) ]); % control the axis limits
                g = g ;
                pause (0.1) ; 
              
            end 
    else 

             for f = g : 50 :length(Signal) 
                    plot ( Signal) ;     % plot Signal
                    axis ([ f+1 f+1000  min(Signal) max(Signal) ]); % control the axis limits
                    g = g ;
                    pause (0.1) ;
             end 
end

    
end