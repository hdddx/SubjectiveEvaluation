function varargout = subEva_Readme(varargin)
% SUBEVA_README MATLAB code for subEva_Readme.fig
%      SUBEVA_README, by itself, creates a new SUBEVA_README or raises the existing
%      singleton*.
%
%      H = SUBEVA_README returns the handle to a new SUBEVA_README or the handle to
%      the existing singleton*.
%
%      SUBEVA_README('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUBEVA_README.M with the given input arguments.
%
%      SUBEVA_README('Property','Value',...) creates a new SUBEVA_README or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before subEva_Readme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to subEva_Readme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help subEva_Readme

% Last Modified by GUIDE v2.5 04-Dec-2017 15:21:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @subEva_Readme_OpeningFcn, ...
                   'gui_OutputFcn',  @subEva_Readme_OutputFcn, ...
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


% --- Executes just before subEva_Readme is made visible.
function subEva_Readme_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to subEva_Readme (see VARARGIN)

% Choose default command line output for subEva_Readme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes subEva_Readme wait for user response (see UIRESUME)
% uiwait(handles.subEva_Readme);


% --- Outputs from this function are returned to the command line.
function varargout = subEva_Readme_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
