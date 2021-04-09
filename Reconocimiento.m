function varargout = Reconocimiento100100(varargin)
% RECONOCIMIENTO MATLAB code for Reconocimiento.fig
%      RECONOCIMIENTO, by itself, creates a new RECONOCIMIENTO or raises the existing
%      singleton*.
%
%      H = RECONOCIMIENTO returns the handle to a new RECONOCIMIENTO or the handle to
%      the existing singleton*.
%
%      RECONOCIMIENTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONOCIMIENTO.M with the given input arguments.
%
%      RECONOCIMIENTO('Property','Value',...) creates a new RECONOCIMIENTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reconocimiento_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reconocimiento_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reconocimiento

% Last Modified by GUIDE v2.5 10-Jan-2019 13:45:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reconocimiento_OpeningFcn, ...
                   'gui_OutputFcn',  @Reconocimiento_OutputFcn, ...
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

% --- Executes just before Reconocimiento is made visible.
function Reconocimiento_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reconocimiento (see VARARGIN)

% Choose default command line output for Reconocimiento
handles.output = hObject;
axes(handles.axes1)
Emociones=imresize(rgb2gray(imread('zEmociones.jpg')),[500 500]);
imshow(Emociones)

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Reconocimiento wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Reconocimiento_OutputFcn(hObject, eventdata, handles) 
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

%Matriz para guardar fecha y hora
reloj1=zeros(100,6);

%Contador para guardar fecha y hora
cont1=1;
c = clock;
reloj1(cont1,:)=c;
cont1=cont1 + 1;

%Se crean vectores para guardar los bloques
Ibloque1=zeros(500,500,60,'uint8');
Ibloque2=zeros(500,500,60,'uint8');
Ibloque3=zeros(500,500,60,'uint8');

%Se cargan est?mulos, cruz de fijaci?n y pausas entre bloques
Enojo=imresize(rgb2gray(imread('1.jpg')),[500 500]);
Alegria=imresize(rgb2gray(imread('2.jpg')),[500 500]);
Neutra=imresize(rgb2gray(imread('3.jpg')),[500 500]);
Tristeza=imresize(rgb2gray(imread('5.jpg')),[500 500]);
Miedo=imresize(rgb2gray(imread('4.jpg')),[500 500]);
Balon=imresize(rgb2gray(imread('6.jpg')),[500 500]);
Mariposa=imresize(rgb2gray(imread('7.jpg')),[500 500]);
Avion=imresize(rgb2gray(imread('8.jpg')),[500 500]);
Cruz=imresize(rgb2gray(imread('zCruz.jpg')),[500 500]);
Bloque1=imresize(rgb2gray(imread('zBloque1.jpg')),[500 500]);
Bloque2=imresize(rgb2gray(imread('zBloque2.jpg')),[500 500]);
Bloque3=imresize(rgb2gray(imread('zBloque3.jpg')),[500 500]);

%Lugar en que apareceran los est?mulos de los objetos
pBalon=[9 16 22 24 27 33 39 45 51 59];
pMariposa=[7 9 20 31 39 44 49 53 58 60];
pAvion=[2 12 16 18 22 30 35 39 52 56];

%Se genera la matriz para el bloque 1
k=1;
i=1;
while i<60
    if pBalon(k)==i
        Ibloque1(:,:,i)=Balon;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque1(:,:,i)=Enojo;
    i=i+1;
    if pBalon(k)==i
        Ibloque1(:,:,i)=Balon;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque1(:,:,i)=Alegria;
    i=i+1;
    if pBalon(k)==i
        Ibloque1(:,:,i)=Balon;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque1(:,:,i)=Neutra;
    i=i+1;
    if pBalon(k)==i
        Ibloque1(:,:,i)=Balon;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque1(:,:,i)=Miedo;
    i=i+1;
    if pBalon(k)==i
        Ibloque1(:,:,i)=Balon;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque1(:,:,i)=Tristeza;
    i=i+1;
end

%Se genera la matriz para el bloque 2
k=1;
i=1;
while i<60
    if pMariposa(k)==i
        Ibloque2(:,:,i)=Mariposa;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque2(:,:,i)=Miedo;
    i=i+1;
    if pMariposa(k)==i
        Ibloque2(:,:,i)=Mariposa;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque2(:,:,i)=Neutra;
    i=i+1;
    if pMariposa(k)==i
        Ibloque2(:,:,i)=Mariposa;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque2(:,:,i)=Enojo;
    i=i+1;
    if pMariposa(k)==i
        Ibloque2(:,:,i)=Mariposa;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque2(:,:,i)=Alegria;
    i=i+1;
    if pMariposa(k)==i
        Ibloque2(:,:,i)=Mariposa;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque2(:,:,i)=Tristeza;
    i=i+1;
end
Ibloque2(:,:,60)=Mariposa;

%Se genera la matriz para el bloque 3
k=1;
i=1;
while i<60
    if pAvion(k)==i
        Ibloque3(:,:,i)=Avion;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque3(:,:,i)=Alegria;
    i=i+1;
    if pAvion(k)==i
        Ibloque3(:,:,i)=Avion;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque3(:,:,i)=Tristeza;
    i=i+1;
    if pAvion(k)==i
        Ibloque3(:,:,i)=Avion;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque3(:,:,i)=Neutra;
    i=i+1;
    if pAvion(k)==i
        Ibloque3(:,:,i)=Avion;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque3(:,:,i)=Enojo;
    i=i+1;
    if pAvion(k)==i
        Ibloque3(:,:,i)=Avion;
        k=k+1;
        i=i+1;
        if k>10
            k=1;
        end
    end
    Ibloque3(:,:,i)=Miedo;
    i=i+1;
end

estim=0.850;
estim2=0.200;


%Despliegue de bloque1
i=1;
j=1;
imshow(Bloque1)
pause(1.600);
while j < 3
     if estim2 >= 0.500
        c = clock;
        reloj1(cont1,:)=c;
        imshow(Ibloque1(:,:,i))
        cont1=cont1 + 1;
        pause(estim);
        imshow(Cruz)
        pause(estim2);
        i=i+1;
     end
     estim2=randi(1600,1);
     estim2=estim2/1000;
     if i==61
         j=j+1;
         i=1;
     end
end

%Despliegue de bloque2
i=1;
j=1;
imshow(Bloque2)
pause(1.600);
while j < 3
     if estim2 >= 0.500
        c = clock;
        reloj1(cont1,:)=c;
        imshow(Ibloque2(:,:,i))
        toc
        cont1=cont1 + 1;
        pause(estim);
        imshow(Cruz)
        pause(estim2);
        i=i+1;
     end
     estim2=randi(1600,1);
     estim2=estim2/1000;
     if i==61
         j=j+1;
         i=1;
     end
end

%Despliegue de bloque3
i=1;
j=1;
imshow(Bloque3)
pause(1.600);
while j < 3
     if estim2 >= 0.500
        imshow(Ibloque3(:,:,i))
        c = clock;
        reloj1(cont1,:)=c;
        cont1=cont1 + 1;
        pause(estim);
        imshow(Cruz)
        pause(estim2);
        i=i+1;
     end
     estim2=randi(1600,1);
     estim2=estim2/1000;
     if i==61
         j=j+1;
         i=1;
     end
end
xlswrite('Reloj1.xlsx',reloj1)


% --- Executes on button press in pushbutton2.

function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

persistent reloj2;
if isempty(reloj2)
    reloj2=zeros(80,6);
end

persistent cont2;
if isempty(cont2)
  cont2=1;
end

c = clock;
reloj2(cont2,:)=c;
cont2=cont2+1;

xlswrite('Reloj2.xlsx',reloj2)
