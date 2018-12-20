function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 29-May-2018 16:05:18

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUI_OpeningFcn, ...
    'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;
handles.Ie2=0;
handles.Ie3=0;
handles.Ruido=false;
handles.Gauss=false;
handles.Pulsos=false;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in actualizar.
function actualizar_Callback(hObject, eventdata, handles)
% hObject    handle to actualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tiempofinal=str2double(get(handles.tiempofinal_txt,'string'));
inicioPulso=str2double(get(handles.iniciopulso_txt,'string'));
finpulso=str2double(get(handles.finpulso_txt,'string'));
imax=str2double(get(handles.imax_txt,'string'));
umbralmembrana1=str2double(get(handles.umbralmembrana1_txt,'string'));
topedisparo=str2double(get(handles.topedisparo_txt,'string'));
umbralreset=str2double(get(handles.umbraldisparo_txt,'string'));
peso=str2double(get(handles.peso_txt,'string'));
umbralmembrana2=str2double(get(handles.umbralmembrana2_txt,'string'));
numPulsos=str2double(get(handles.edit10,'string'));

if get(handles.radiobutton1,'Value')
    main(tiempofinal,inicioPulso,finpulso,imax,umbralmembrana1,topedisparo,umbralreset,handles.Ruido,handles.Gauss,handles.Pulsos,numPulsos);
    handles.Ie2=sinapsis(tiempofinal,inicioPulso,finpulso,imax,umbralmembrana1,topedisparo,umbralreset,peso,handles.Ruido,handles.Gauss,handles.Pulsos,numPulsos);
    guidata(hObject, handles);
end
if get(handles.radiobutton3,'Value')
    main(tiempofinal,inicioPulso,finpulso,imax,umbralmembrana1,topedisparo,umbralreset,handles.Ruido,handles.Gauss,handles.Pulsos,numPulsos);
    handles.Ie3=sinapsis(tiempofinal,inicioPulso,finpulso,imax,umbralmembrana1,topedisparo,umbralreset,peso,handles.Ruido,handles.Gauss,handles.Pulsos,numPulsos);
    guidata(hObject, handles);
end
if get(handles.radiobutton2,'Value')
    Ie4=handles.Ie2+handles.Ie3;
    
    
    dt=0.1;
    tiempofinal=str2double(get(handles.tiempofinal_txt,'string'));
    arrayTiempo = 0:dt:tiempofinal;
    
    subplot(2,1,1);
    plot(arrayTiempo, Ie4);
    xlabel('TIEMPO')
    ylabel('CORRIENTE')
    title('Simulacion sinapsis','FontSize',12)
    subplot(2,1,2);
    intFire(tiempofinal,0.1,Ie4,umbralmembrana2,topedisparo,umbralreset,-70);
end





% --- Executes on button press in cerrar.
function cerrar_Callback(hObject, eventdata, handles)
% hObject    handle to cerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);



function umbraldisparo_txt_Callback(hObject, eventdata, handles)
% hObject    handle to umbraldisparo_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of umbraldisparo_txt as text
%        str2double(get(hObject,'String')) returns contents of umbraldisparo_txt as a double


% --- Executes during object creation, after setting all properties.
function umbraldisparo_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to umbraldisparo_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function topedisparo_txt_Callback(hObject, eventdata, handles)
% hObject    handle to topedisparo_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of topedisparo_txt as text
%        str2double(get(hObject,'String')) returns contents of topedisparo_txt as a double


% --- Executes during object creation, after setting all properties.
function topedisparo_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to topedisparo_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function umbralmembrana1_txt_Callback(hObject, eventdata, handles)
% hObject    handle to umbralmembrana1_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of umbralmembrana1_txt as text
%        str2double(get(hObject,'String')) returns contents of umbralmembrana1_txt as a double


% --- Executes during object creation, after setting all properties.
function umbralmembrana1_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to umbralmembrana1_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function finpulso_txt_Callback(hObject, eventdata, handles)
% hObject    handle to finpulso_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of finpulso_txt as text
%        str2double(get(hObject,'String')) returns contents of finpulso_txt as a double


% --- Executes during object creation, after setting all properties.
function finpulso_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to finpulso_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iniciopulso_txt_Callback(hObject, eventdata, handles)
% hObject    handle to iniciopulso_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iniciopulso_txt as text
%        str2double(get(hObject,'String')) returns contents of iniciopulso_txt as a double


% --- Executes during object creation, after setting all properties.
function iniciopulso_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iniciopulso_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tiempofinal_txt_Callback(hObject, eventdata, handles)
% hObject    handle to tiempofinal_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiempofinal_txt as text
%        str2double(get(hObject,'String')) returns contents of tiempofinal_txt as a double


% --- Executes during object creation, after setting all properties.
function tiempofinal_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiempofinal_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function imax_txt_Callback(hObject, eventdata, handles)
% hObject    handle to imax_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of imax_txt as text
%        str2double(get(hObject,'String')) returns contents of imax_txt as a double


% --- Executes during object creation, after setting all properties.
function imax_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imax_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function peso_txt_Callback(hObject, eventdata, handles)
% hObject    handle to peso_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of peso_txt as text
%        str2double(get(hObject,'String')) returns contents of peso_txt as a double


% --- Executes during object creation, after setting all properties.
function peso_txt_CreateFcn(hObject, eventdata, ~)
% hObject    handle to peso_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function umbralmembrana2_txt_Callback(hObject, eventdata, handles)
% hObject    handle to umbralmembrana2_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of umbralmembrana2_txt as text
%        str2double(get(hObject,'String')) returns contents of umbralmembrana2_txt as a double


% --- Executes during object creation, after setting all properties.
function umbralmembrana2_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to umbralmembrana2_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function  checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

value = get(hObject,'Value');
if value
    handles.Ruido=true;
    guidata(hObject, handles);
else
    handles.Ruido=false;
    guidata(hObject, handles);
    
end


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

value = get(hObject,'Value');
if value
    handles.Gauss=true;
    guidata(hObject, handles);
else
    handles.Gauss=false;
    guidata(hObject, handles);
    
end


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
value = get(hObject,'Value');
if value
    handles.Pulsos=true;
    guidata(hObject, handles);
else
    handles.Pulsos=false;
    guidata(hObject, handles);
    
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on radiobutton3 and none of its controls.
function radiobutton3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
