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
% handles axes and make it empty axis to show an image 
axes(handles.pic1)
axis off
axis image
axes(handles.pic2)
axis off
axis image
axes(handles.pic3)
axis off
axis image
axes(handles.pic4)
axis off
axis image
% handles axes and make it empty axis to show an image 


function varargout = Phase_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in Browse1.
function Browse1_Callback(hObject, eventdata, handles)
% hObject    handle to Browse1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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

pause (1) ;

axes(handles.image1) 
x1 = rgb2gray (firstimage) ;
imshow(x1) 
axis off
axis image 

FT1 = fft2 (x1) ;
FT1 = fftshift (FT1) ;
mag1 = abs (FT1) ;
phase1 = angle (FT1) ;
S1 = log(1+mag1) ;



% --- Executes on button press in Browse2.
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

pause (1) ;

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

function push1_Callback(hObject, eventdata, handles)

axes (handles.pic1)
%handles the axes 
global FT1 
global FT2 
global firstimage
global secondimage 
global x1
global x2
global S1 
global S2
global mag1 
global phase1 
global mag2 
global phase2
% some global variables to use 
imshow(firstimage)
% show colored image 1
pause(0.5) ;
imshow(x1)
% show gray scale image 1 
pause(0.5) ;
imshow(S1 , []) 
% show fourier transform centeralized log abs 
pause (0.5) ;
pic1 = mag1.*exp(1i*phase1);
pic1 = ifftshift(pic1) ;
pic1 = ifft2 (pic1) ;
imshow(pic1 ,[]) 




function push2_Callback(hObject, eventdata, handles)

axes (handles.pic2)
%handles the axes 
global FT1 
global FT2 
global firstimage
global secondimage 
global x1
global x2
global S1 
global S2
global mag1 
global phase1 
global mag2 
global phase2
% some global variables to use 
imshow(firstimage)
% show colored image 1
pause(0.5) ;
imshow(x1)
% show gray scale image 1 
pause(0.5) ;
imshow(S1 , []) 
% show fourier transform centeralized log abs 
pause (0.5) ;
pic2 = mag2.*exp(1i*phase1);
pic2 = ifftshift(pic2) ;
pic2 = ifft2 (pic2) ;
imshow(pic2 ,[]) 





function push3_Callback(hObject, eventdata, handles)

axes (handles.pic3)
%handles the axes 
global FT1 
global FT2 
global firstimage
global secondimage 
global x1
global x2
global S1 
global S2
global mag1 
global phase1 
global mag2 
global phase2
% some global variables to use 
imshow(secondimage)
% show colored image 1
pause(0.5) ;
imshow(x2)
% show gray scale image 1 
pause(0.5) ;
imshow(S2 , []) 
% show fourier transform centeralized log abs 
pause (0.5) ;
pic3 = mag1.*exp(1i*phase2);
pic3 = ifftshift(pic3) ;
pic3 = ifft2 (pic3) ;
imshow(pic3 ,[]) 





function push4_Callback(hObject, eventdata, handles)

axes (handles.pic4)
global FT1 
global FT2 
global firstimage
global secondimage 
global x1
global x2
global S1 
global S2
global mag1 
global phase1 
global mag2 
global phase2
% some global variables to use 
imshow(secondimage)
% show colored image 1
pause(0.5) ;
imshow(x2)
% show gray scale image 1 
pause(0.5) ;
imshow(S2 , []) 
% show fourier transform centeralized log abs 
pause (0.5) ;
pic4 = mag2.*exp(1i*phase2);
pic4 = ifftshift(pic4) ;
pic4 = ifft2 (pic4) ;
imshow(pic4 ,[]) 




% --- Executes during object creation, after setting all properties.
function background_CreateFcn(hObject, eventdata, handles)
% hObject    handle to background (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pic1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pic1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate pic1

