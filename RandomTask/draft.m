% Draft 
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



