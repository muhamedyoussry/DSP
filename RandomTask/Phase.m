function varargout = Phase(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Phase_OpeningFcn, ...
                   'gui_OutputFcn',  @Phase_OutputFcn, ...
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
function Phase_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
% code starts here 
clc
% clear the window 
axes(handles.image1)
axis off 
axis image
axes(handles.image2)
axis off 
axis image
axes(handles.image3)
axis off 
axis image


function varargout = Phase_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function Browse1_Callback(hObject, eventdata, handles)

global FT1
global firstimage
global x1
global mag1 
global phase1 
global S1

[filename pathname] = uigetfile({'*.jpeg;*.jpg' ,'Image' ; '*.*' , 'All files' } ,'Select a Photo');
handles.filename = strcat(filename );  % browse the specific file 

axes(handles.image1)
firstimage = imread(filename);
imshow(firstimage)
axis off
axis image

pause (0.5) ;

axes(handles.image1) 
x1 = rgb2gray (firstimage) ;
imshow(x1) 
axis off
axis image 

FT1 = fft2 (x1) ;
FT1 = fftshift (FT1) ;
mag1 = abs (FT1) ;
phase1 = angle (FT1) ;




function Browse2_Callback(hObject, eventdata, handles)
% hObject    handle to Browse2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FT2
global secondimage
global x2
global mag2
global phase2 
global S2

[filename pathname] = uigetfile({'*.jpeg;*.jpg' ,'Image' ; '*.*' , 'All files' } ,'Select a Photo');
handles.filename = strcat(filename );  % browse the specific file 

axes(handles.image2)
secondimage = imread(filename);
imshow(secondimage)
axis off
axis image

pause (0.5) ;

axes(handles.image2) 
x2 = rgb2gray (secondimage) ;
imshow(x2) 
axis off
axis image 

FT2 = fft2 (x2) ;
FT2 = fftshift (FT2) ;
mag2 = abs (FT2) ;
phase2 = angle (FT2) ;
S2 = log(1+mag2) ;




function Slider_Callback(hObject, eventdata, handles)
global S 
global M 

S = get(handles.Slider , 'Value') ;

    if M == 1 
            set(handles.mag1 ,'String' ,  'Zero' ) ;
            set(handles.mag2 ,'String' ,  'Zero' ) ;
            set(handles.phase1 ,'String' ,  'Zero' ) ;
            set(handles.phase2 ,'String' ,   'Zero' ) ;
        
        
    elseif M == 2
            set(handles.mag1 ,'String' ,  'Zero' ) ;
            set(handles.mag2 ,'String' ,  'Zero' ) ;
            set(handles.phase1 ,'String' ,  (1-S)*100 ) ;
            set(handles.phase2 ,'String' ,   S*100 ) ;
            
    elseif M == 3 
            set(handles.mag1 ,'String' ,  (1-S)*100 ) ;
            set(handles.mag2 ,'String' ,  S*100 ) ;
            set(handles.phase1 ,'String' ,  'Zero' ) ;
            set(handles.phase2 ,'String' ,  'Zero' ) ;
        
    elseif M == 4 
            set(handles.mag1 ,'String' ,  (1-S)*100 ) ;
            set(handles.mag2 ,'String' ,  S*100 ) ;
            set(handles.phase1 ,'String' ,  (1-S)*100 ) ;
            set(handles.phase2 ,'String' ,  S*100 ) ;
            
    else 
            set(handles.mag1 ,'String' ,  S*100 ) ;
            set(handles.mag2 ,'String' ,  (1-S)*100 ) ;
            set(handles.phase1 ,'String' ,  (1-S)*100 ) ;
            set(handles.phase2 ,'String' ,  S*100 ) ;

    end
    
    
menu_Callback(handles.menu, eventdata, handles);


function Slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function menu_Callback(hObject, eventdata, handles)
global S 
global phase1
global phase2
global mag1 
global mag2
global M 

M = get (handles.menu , 'Value') ;

switch M 
    case 1 
        axes(handles.image3) 
        axis off 
        axis image 
        
    case 2 
        axes(handles.image3) 
        pic3 = exp(1i*( ((1-S)*phase1) + (S*phase2) ) ) ;        
        pic3 = ifftshift(pic3) ;
        pic3 = ifft2 (pic3) ;
        imshow(pic3 ,[]) 
        
    case 3
         axes(handles.image3) 
        pic3 = ( ((1-S)*mag1) + (S*mag2) ) ;        
        pic3 = ifftshift(pic3) ;
        pic3 = ifft2 (pic3) ;
        imshow(pic3 ,[]) 
        
    case 4 
        axes(handles.image3) 
        pic3 = ( ((1-S)*mag1) + (S*mag2) ).* exp(1i*( ((1-S)*phase1) + (S*phase2) ) ) ;        
        pic3 = ifftshift(pic3) ;
        pic3 = ifft2 (pic3) ;
        imshow(pic3 ,[]) 
        
    case 5
        axes(handles.image3) 
        pic3 = ( ((1-S)*mag2) + (S*mag1) ).* exp(1i*( ((1-S)*phase1) + (S*phase2) ) ) ;        
        pic3 = ifftshift(pic3) ;
        pic3 = ifft2 (pic3) ;
        imshow(pic3 ,[]) 
        
end


function menu_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
