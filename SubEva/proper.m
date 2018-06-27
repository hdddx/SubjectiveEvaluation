function varargout = proper(varargin)
% PROPER MATLAB code for proper.fig
%      PROPER, by itself, creates a new PROPER or raises the existing
%      singleton*.
%
%      H = PROPER returns the handle to a new PROPER or the handle to
%      the existing singleton*.
%
%      PROPER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROPER.M with the given input arguments.
%
%      PROPER('Property','Value',...) creates a new PROPER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proper_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proper_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proper

% Last Modified by GUIDE v2.5 25-Jan-2018 18:54:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proper_OpeningFcn, ...
                   'gui_OutputFcn',  @proper_OutputFcn, ...
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


% --- Executes just before proper is made visible.
function proper_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to proper (see VARARGIN)

% Choose default command line output for proper
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global pro_path;
pro_path = 'property.txt';
ex = importdata('property.txt');
set(handles.txt_tolerance,'String',ex.data(1))%设置2轮分数的容忍阈值
set(handles.txt_methods,'String',ex.data(2));%设置方法数
set(handles.txt_groups,'String',ex.data(3));%设置图片组数
if ex.data(4)==1
  set(handles.rad_yes,'Value',1);%设置测试者是否可看结果 
  set(handles.rad_no,'Value',0);%设置测试者是否可看结果 
else
  set(handles.rad_yes,'Value',0);%设置测试者是否可看结果 
  set(handles.rad_no,'Value',1);%设置测试者是否可看结果  
end



% UIWAIT makes proper wait for user response (see UIRESUME)
% uiwait(handles.proper);


% --- Outputs from this function are returned to the command line.
function varargout = proper_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in btn_sub.
function btn_sub_Callback(hObject, eventdata, handles)
% hObject    handle to btn_sub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fid = fopen('property.txt','w');
fprintf(fid,'%s','threshold');
fprintf(fid,' %d\n',str2num(get(handles.txt_tolerance,'String')));
fprintf(fid,'%s','number_methods');
fprintf(fid,' %d\n',str2num(get(handles.txt_methods,'String')));
fprintf(fid,'%s','number_groups');
fprintf(fid,' %d\n',str2num(get(handles.txt_groups,'String')));
fprintf(fid,'%s','display_results');
if get(handles.rad_yes,'Value')==1
    fprintf(fid,' %d\n',1);
else
    fprintf(fid,' %d\n',0);
end
fclose(fid);
