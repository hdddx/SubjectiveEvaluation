function varargout = subEva(varargin)
global FilePath;

FilePath = 'image';

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @subEva_OpeningFcn, ...
                   'gui_OutputFcn',  @subEva_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    list=dir(FilePath);  
    if length(list)>2   
        gui_mainfcn(gui_State, varargin{:});
    else
        s = sprintf('\n\n\nThere is no image in \nthe current directory��\n');
        hs = msgbox(s,'Warning','warn');%�Ի��򾯸�
        ht = findobj(hs,'Type','text');%Ѱ��msgbox���
        set(ht, 'FontSize',13,'Unit','normal');%���������С
        set(hs, 'Resize','on');%�Զ����ô��ڴ�С
%         ScreenSize = get(0,'ScreenSize');
%         set(hs, 'Position',[ScreenSize(3)/4 ScreenSize(4)/3 220 150]);%�ֶ�����
       
    end
end




function subEva_OpeningFcn(hObject, eventdata, handles, varargin)

global FilePath;

handles.output = hObject;
guidata(hObject, handles);
global list_order;

global round_score;
global image_score;
round_score = [];
image_score = [];

%                                 assignin('base', 'A', [1,2,3]);
%                                 
%                                 save('save/a.mat','image_score');

% movegui( handles.subEva, 'center' );
% [rimg,height,width,channels,method_name] = readImage(FilePath,3);
% if max(height,width)<=300
%     set(gcf,'position',[100,20,180,28]);
% else
%     set(gcf,'position',[60,10,width/3,height/10.6]);
% end

ex = importdata('property.txt');
setappdata(handles.subEva,'threshold',ex.data(1))%����2�ַ�����������ֵ
setappdata(handles.subEva,'number_methods',ex.data(2));%���÷�����
setappdata(handles.subEva,'number_groups',ex.data(3));%����ͼƬ����
setappdata(handles.subEva,'whether_display_results',ex.data(4));%���ò������Ƿ�ɿ����
list_order = cell((ex.data(2)+1),2);

switch (ex.data(2)+1)
    case 2
        list_order{1,1}='         1st';
        list_order{2,1}='         2nd';
        list_order{1,2}='          -';
        list_order{2,2}='          -';
    case 3
        list_order{1,1}='         1st';
        list_order{2,1}='         2nd';
        list_order{3,1}='         3cd';
        list_order{1,2}='          -';
        list_order{2,2}='          -';
        list_order{3,2}='          -';
    case 4
        list_order{1,1}='         1st';
        list_order{2,1}='         2nd';
        list_order{3,1}='         3cd';
        list_order{4,1}='         4st';
        list_order{1,2}='          -';
        list_order{2,2}='          -';
        list_order{3,2}='          -';
        list_order{4,2}='          -';
    case 5
        list_order{1,1}='         1st';
        list_order{2,1}='         2nd';
        list_order{3,1}='         3cd';
        list_order{4,1}='         4st';
        list_order{5,1}='         5st';
        list_order{1,2}='          -';
        list_order{2,2}='          -';
        list_order{3,2}='          -';
        list_order{4,2}='          -';
        list_order{5,2}='          -';
    case 6
        list_order{1,1}='         1st';
        list_order{2,1}='         2nd';
        list_order{3,1}='         3cd';
        list_order{4,1}='         4st';
        list_order{5,1}='         5st';
        list_order{6,1}='         6st';
        list_order{1,2}='          -';
        list_order{2,2}='          -';
        list_order{3,2}='          -';
        list_order{4,2}='          -';
        list_order{5,2}='          -';
        list_order{6,2}='          -';
    case 7
        list_order{1,1}='         1st';
        list_order{2,1}='         2nd';
        list_order{3,1}='         3cd';
        list_order{4,1}='         4st';
        list_order{5,1}='         5st';
        list_order{6,1}='         6st';
        list_order{7,1}='         7st';
        list_order{1,2}='          -';
        list_order{2,2}='          -';
        list_order{3,2}='          -';
        list_order{4,2}='          -';
        list_order{5,2}='          -';
        list_order{6,2}='          -';
        list_order{7,2}='          -';
    case 8
        list_order{1,1}='         1st';
        list_order{2,1}='         2nd';
        list_order{3,1}='         3cd';
        list_order{4,1}='         4st';
        list_order{5,1}='         5st';
        list_order{6,1}='         6st';
        list_order{7,1}='         7st';
        list_order{8,1}='         8st';
        list_order{1,2}='          -';
        list_order{2,2}='          -';
        list_order{3,2}='          -';
        list_order{4,2}='          -';
        list_order{5,2}='          -';
        list_order{6,2}='          -';
        list_order{7,2}='          -';
        list_order{8,2}='          -';
    case 9  
        list_order{1,1}='         1st';
        list_order{2,1}='         2nd';
        list_order{3,1}='         3cd';
        list_order{4,1}='         4st';
        list_order{5,1}='         5st';
        list_order{6,1}='         6st';
        list_order{7,1}='         7st';
        list_order{8,1}='         8st';
        list_order{9,1}='         9st';
        list_order{1,2}='          -';
        list_order{2,2}='          -';
        list_order{3,2}='          -';
        list_order{4,2}='          -';
        list_order{5,2}='          -';
        list_order{6,2}='          -';
        list_order{7,2}='          -';
        list_order{8,2}='          -';
        list_order{9,2}='          -';
end

set(handles.table_order,'Data',list_order);

iniRad(handles);
set(handles.rad_points_1,'Enable','off'); %���ô�ְ�ťrad_points_1����ѡȡ
set(handles.rad_points_2,'Enable','off'); %���ô�ְ�ťrad_points_2����ѡȡ
set(handles.rad_points_3,'Enable','off'); %���ô�ְ�ťrad_points_3����ѡȡ
set(handles.rad_points_4,'Enable','off'); %���ô�ְ�ťrad_points_4����ѡȡ
set(handles.rad_points_5,'Enable','off'); %���ô�ְ�ťrad_points_5����ѡȡ
setappdata(handles.subEva,'whetherImport',0);%���ó�ʼֵΪδ����ͼƬ
setappdata(handles.subEva,'SrollWheel',0);%���ù��ֳ�ʼֵ
setappdata(handles.subEva,'scollIndex',0);%���ù��ֵ�ǰͼƬ���
setappdata(handles.subEva,'numOfRounds',1);%���ò���������Ĭ��Ϊ1
setappdata(handles.subEva,'currentImg',0);%��ǰ��ʾͼƬ
setappdata(handles.subEva,'enlarge_whether_press',0)%���÷Ŵ�ťδ������
setappdata(handles.subEva,'trans_whether_press',0)%�����ƶ���ťδ������
setappdata(handles.subEva,'x_beforeEnlarge',0)%�Ŵ�ǰͼ�����ĵ�x����
setappdata(handles.subEva,'y_beforeEnlarge',0)%�Ŵ�ǰͼ�����ĵ�y����
setappdata(handles.subEva,'multiples',1);%ԭʼͼ����

im_open_ClickedCallback(hObject, eventdata, handles);

function [rimg,height,width,channels,method_name] = readImage(FilePath,randIndex)
    list = dir(FilePath);
    rimg = [];
    method_name = '';
    sublist = dir([FilePath '/' list(randIndex).name]);
    for n=3:size(sublist)
        img = imread([FilePath '/' list(randIndex).name '/' sublist(n).name]);
        [height,width,channels] = size(img);
        if isequal(sublist(n).name,'gt.bmp')
            rimg = [img,rimg];
            temp = img;
        else
            rimg = [rimg,img];      
            method_name = [method_name,' ',sublist(n).name(1:length(sublist(n).name)-4)];      
        end
    end 
    rimg = [rimg,temp];
    method_name = method_name(2:length(method_name));
return;


function varargout = subEva_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function iniRad(handles)
    set(handles.rad_img_GT,'Value',0);%����ͼƬGT��ťֵΪ1
    set(handles.rad_img_1,'Value',0);%����ͼƬ1��ťֵΪ0
    set(handles.rad_img_2,'Value',0);%����ͼƬ2��ťֵΪ0
    set(handles.rad_img_3,'Value',0);%����ͼƬ3��ťֵΪ0
    set(handles.rad_img_4,'Value',0);%����ͼƬ4��ťֵΪ0
    set(handles.rad_img_5,'Value',0);%����ͼƬ5��ťֵΪ0
    set(handles.rad_img_6,'Value',0);%����ͼƬ6��ťֵΪ0
    set(handles.rad_img_7,'Value',0);%����ͼƬ7��ťֵΪ0
    set(handles.rad_img_8,'Value',0);%����ͼƬ8��ťֵΪ0
    set(handles.rad_img_9,'Value',0);%����ͼƬ9��ťֵΪ0
    
    set(handles.rad_img_GT,'ForegroundColor',[0,0,0]);%����ͼƬGT��ť��������ɫ
    set(handles.rad_img_1,'ForegroundColor',[0,0,0]);%����ͼƬ1��ť��������ɫ
    set(handles.rad_img_2,'ForegroundColor',[0,0,0]);%����ͼƬ2��ť��������ɫ
    set(handles.rad_img_3,'ForegroundColor',[0,0,0]);%����ͼƬ3��ť��������ɫ
    set(handles.rad_img_4,'ForegroundColor',[0,0,0]);%����ͼƬ4��ť��������ɫ
    set(handles.rad_img_5,'ForegroundColor',[0,0,0]);%����ͼƬ5��ť��������ɫ
    set(handles.rad_img_6,'ForegroundColor',[0,0,0]);%����ͼƬ6��ť��������ɫ
    set(handles.rad_img_7,'ForegroundColor',[0,0,0]);%����ͼƬ7��ť��������ɫ
    set(handles.rad_img_8,'ForegroundColor',[0,0,0]);%����ͼƬ8��ť��������ɫ
    set(handles.rad_img_9,'ForegroundColor',[0,0,0]);%����ͼƬ9��ť��������ɫ

    
    set(handles.rad_points_1,'Value',0); %���ô�ְ�ťrad_points_1��ֵΪ��
    set(handles.rad_points_2,'Value',0); %���ô�ְ�ťrad_points_2��ֵΪ��
    set(handles.rad_points_3,'Value',0); %���ô�ְ�ťrad_points_3��ֵΪ��
    set(handles.rad_points_4,'Value',0); %���ô�ְ�ťrad_points_4��ֵΪ��
    set(handles.rad_points_5,'Value',0); %���ô�ְ�ťrad_points_5��ֵΪ��
return;


function im_open_ClickedCallback(hObject, eventdata, handles)
global handle
global rimg;
global width;
global height;
global channels;
global method_name;
global FilePath;
global h1;
handle = handles;
list=dir(FilePath);  
number_methods = getappdata(handles.subEva,'number_methods');%��ȡ������
number_groups = getappdata(handles.subEva,'number_groups');%��ȡͼƬ����
switch (number_methods+1)
    case 1
        set(handles.rad_img_2,'Enable','off');
        set(handles.rad_img_3,'Enable','off');
        set(handles.rad_img_4,'Enable','off');
        set(handles.rad_img_5,'Enable','off');
        set(handles.rad_img_6,'Enable','off');
        set(handles.rad_img_7,'Enable','off');
        set(handles.rad_img_8,'Enable','off');
        set(handles.rad_img_9,'Enable','off');
    case 2
        set(handles.rad_img_3,'Enable','off');
        set(handles.rad_img_4,'Enable','off');
        set(handles.rad_img_5,'Enable','off');
        set(handles.rad_img_6,'Enable','off');
        set(handles.rad_img_7,'Enable','off');
        set(handles.rad_img_8,'Enable','off');
        set(handles.rad_img_9,'Enable','off');
    case 3
        set(handles.rad_img_4,'Enable','off');
        set(handles.rad_img_5,'Enable','off');
        set(handles.rad_img_6,'Enable','off');
        set(handles.rad_img_7,'Enable','off');
        set(handles.rad_img_8,'Enable','off');
        set(handles.rad_img_9,'Enable','off');
    case 4
        set(handles.rad_img_5,'Enable','off');
        set(handles.rad_img_6,'Enable','off');
        set(handles.rad_img_7,'Enable','off');
        set(handles.rad_img_8,'Enable','off');
        set(handles.rad_img_9,'Enable','off');
    case 5
        set(handles.rad_img_6,'Enable','off');
        set(handles.rad_img_7,'Enable','off');
        set(handles.rad_img_8,'Enable','off');
        set(handles.rad_img_9,'Enable','off');
    case 6
        set(handles.rad_img_7,'Enable','off');
        set(handles.rad_img_8,'Enable','off');
        set(handles.rad_img_9,'Enable','off');
    case 7
        set(handles.rad_img_8,'Enable','off');
        set(handles.rad_img_9,'Enable','off');
    case 8
        set(handles.rad_img_9,'Enable','off');
    otherwise 
end

set(handles.rad_img_GT,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ
[rimg,height,width,channels,method_name] = readImage(FilePath,3);

numOfRounds = getappdata(handles.subEva,'numOfRounds');%��ȡ��������
if numOfRounds == 1
    axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
%     ScreenSize = get(0,'ScreenSize');
%     GcfSize = get(gcf,'Position');
%     if(ScreenSize(3)~=GcfSize(3)*5)
%         if max(height,width)<=500
%             set(gcf,'position',[100,20,150,30]);
%         else
%             set(gcf,'position',[60,10,width/3,height/10.6]);
%         end
%     end 
    img_src = rimg(1:height,1:width,1:channels);
    h1 = imshow(img_src);%��imread����ͼƬ������imshow��axes_src����ʾ

    m = number_groups;

    set(handles.rad_img_GT,'Value',1);%����ͼƬGT��ťֵΪ1
    setappdata(handles.subEva,'GTlist',1);%���õ�ǰ��ʾ��Ϊ��һ��GT
    setappdata(handles.subEva,'lengthGT',m);%����arr�ĳ���mΪȫ�ֱ���
    randFuc = randperm(number_methods+1);%Ϊ��һ��GT������Ӧ�������������
    for j=2:1:m
       randIndex = randperm(number_methods+1);%ѭ��Ϊ��j��GT������Ӧ�������������
       randFuc = [randFuc;randIndex];%���Ӷ������
    end
    score = zeros(m,number_methods+1);
    setappdata(handles.subEva,'score',score);%����score����Ϊȫ�ֱ���
    setappdata(handles.subEva,'randFuc',randFuc);%����randFuc����Ϊȫ�ֱ���
    setappdata(handles.subEva,'randIndex',0);%��¼��ǰGT����Ӧ�ķ������
    setappdata(handles.subEva,'currentImg',img_src);%��¼��ǰ��ʾͼƬ
else if numOfRounds == 2
%         ScreenSize = get(0,'ScreenSize');
%         GcfSize = get(gcf,'Position');
%         if(ScreenSize(3)~=GcfSize(3)*5)
%             if max(height,width)<=300
%                 set(gcf,'position',GcfSize);
%             else
%                 set(gcf,'position',GcfSize);
%             end
%         end
        set(handles.rad_img_GT,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ
        m = getappdata(handles.subEva,'lengthGT');%��ȡGTԪ��ĳ���
        axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
        img_src = rimg(1:height,1:width,1:channels);
        imshow(img_src);%��imread����ͼƬ������imshow��axes_src����ʾ
        setappdata(handles.subEva,'GTlist',1);%���õ�ǰ��ʾ��Ϊ��һ��GT
        randFuc = randperm(number_methods+1);%Ϊ��һ��GT������Ӧ�������������
        for j=2:1:m
           randIndex = randperm(number_methods+1);%ѭ��Ϊ��j��GT������Ӧ�������������
           randFuc = [randFuc;randIndex];%���Ӷ������
        end
        score = zeros(m,number_methods+1);
        setappdata(handles.subEva,'score',score);%����score����Ϊȫ�ֱ���
        setappdata(handles.subEva,'randFuc',randFuc);%����randFuc����Ϊȫ�ֱ���
        setappdata(handles.subEva,'randIndex',0);%��¼��ǰGT����Ӧ�ķ������
        setappdata(handles.subEva,'currentImg',img_src);%��¼��ǰ��ʾͼƬ
        iniRad(handles);
        set(handles.rad_img_GT,'Value',1);
        set(handles.rad_points_1,'Enable','off'); %���ô�ְ�ťrad_points_1����ѡȡ
        set(handles.rad_points_2,'Enable','off'); %���ô�ְ�ťrad_points_2����ѡȡ
        set(handles.rad_points_3,'Enable','off'); %���ô�ְ�ťrad_points_3����ѡȡ
        set(handles.rad_points_4,'Enable','off'); %���ô�ְ�ťrad_points_4����ѡȡ
        set(handles.rad_points_5,'Enable','off'); %���ô�ְ�ťrad_points_5����ѡȡ
    else if numOfRounds == 3
        set(handles.rad_img_GT,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ
%         ScreenSize = get(0,'ScreenSize');
%         GcfSize = get(gcf,'Position');
%         if(ScreenSize(3)~=GcfSize(3)*5)
%             if max(height,width)<=300
%                 set(gcf,'position',GcfSize);
%             else
%                 set(gcf,'position',GcfSize);
%             end
%         end
        m = getappdata(handles.subEva,'lengthGT');%��ȡGTԪ��ĳ���

        axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
        img_src = rimg(1:height,1:width,1:channels);
        imshow(img_src);%��imread����ͼƬ������imshow��axes_src����ʾ
        setappdata(handles.subEva,'GTlist',1);%���õ�ǰ��ʾ��Ϊ��һ��GT
        randFuc = randperm(number_methods+1);%Ϊ��һ��GT������Ӧ�������������
        for j=2:1:m
           randIndex = randperm(number_methods+1);%ѭ��Ϊ��j��GT������Ӧ�������������
           randFuc = [randFuc;randIndex];%���Ӷ������
        end
        score = zeros(m,number_methods+1);
        setappdata(handles.subEva,'score',score);%����score����Ϊȫ�ֱ���
        setappdata(handles.subEva,'randFuc',randFuc);%����randFuc����Ϊȫ�ֱ���
        setappdata(handles.subEva,'randIndex',0);%��¼��ǰGT����Ӧ�ķ������
        setappdata(handles.subEva,'currentImg',img_src);%��¼��ǰ��ʾͼƬ
        iniRad(handles);
        set(handles.rad_img_GT,'Value',1);

        set(handles.rad_points_1,'Enable','off'); %���ô�ְ�ťrad_points_1����ѡȡ
        set(handles.rad_points_2,'Enable','off'); %���ô�ְ�ťrad_points_2����ѡȡ
        set(handles.rad_points_3,'Enable','off'); %���ô�ְ�ťrad_points_3����ѡȡ
        set(handles.rad_points_4,'Enable','off'); %���ô�ְ�ťrad_points_4����ѡȡ
        set(handles.rad_points_5,'Enable','off'); %���ô�ְ�ťrad_points_5����ѡȡ 
        end 
    end
end



function rad_img_GT_Callback(hObject, eventdata, handles)
global h1;
global rimg;
global width;
global height;
global channels;
global FilePath;

iniRad(handles);

% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%     set(handles.im_enlarge,'state','off');
% end
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
set(handles.rad_img_GT,'Value',1);%����ͼƬGT��ťֵΪ1
set(handles.rad_img_GT,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ

set(handles.rad_points_1,'Enable','off'); %���ô�ְ�ťrad_points_1����ѡȡ
set(handles.rad_points_2,'Enable','off'); %���ô�ְ�ťrad_points_2����ѡȡ
set(handles.rad_points_3,'Enable','off'); %���ô�ְ�ťrad_points_3����ѡȡ
set(handles.rad_points_4,'Enable','off'); %���ô�ְ�ťrad_points_4����ѡȡ
set(handles.rad_points_5,'Enable','off'); %���ô�ְ�ťrad_points_5����ѡȡ
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��һ��ͼƬGT����Ԫ���±�
[rimg,height,width,channels,method_name] = readImage(FilePath,GTlist+2);
% ScreenSize = get(0,'ScreenSize');
% GcfSize = get(gcf,'Position');
% if ScreenSize(3)~=(GcfSize(3)*5)
%     if max(height,width)<=500
%         if ScreenSize(4)/15 <= (GcfSize(2) + 28)
%             set(gcf,'position',[GcfSize(1),(GcfSize(2)-(28+GcfSize(2)-72)),180,28]);
%         else
%             set(gcf,'position',[GcfSize(1),GcfSize(2),150,30]);
%         end
%     else
% %        fprintf('[%d,%d,%d,%d]\n',ScreenSize(1),ScreenSize(2),ScreenSize(3),ScreenSize(4));
% %         fprintf('[%d,%d,%d,%d]\n',GcfSize(1),GcfSize(2),GcfSize(3),GcfSize(4));
%         if ScreenSize(4)/15 <= (GcfSize(2) + height/10.6)
%             set(gcf,'position',[GcfSize(1),(GcfSize(2)-(height/10.6+GcfSize(2)-72)),width/3,height/10.6]);
% %             fprintf('[%d,%d,%d,%d]\n',GcfSize(1),(GcfSize(2)-(height/10.6+GcfSize(2)-72)),width/3,height/10.6);
%         else
%             set(gcf,'position',[GcfSize(1),GcfSize(2),width/3,height/10.6]);
%         end
%     end        
% end
% % GcfSize = get(gcf,'Position');
% % fprintf('[%d,%d,%d,%d]\n',GcfSize(1),GcfSize(2),GcfSize(3),GcfSize(4));
axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
img_src = rimg(1:height,1:width,1:channels);
setappdata(handles.subEva,'currentImg',img_src);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img_src = enlarge_or_narrow(img_src,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
h1 = imshow(img_src);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end
setappdata(handles.subEva,'randIndex',0);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�0��

function rad_img_1_Callback(hObject, eventdata, handles)
global h1;
global rimg;
global width;
global height;
global channels;
iniRad(handles);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%      set(handles.im_enlarge,'state','off');
% end
setappdata(handles.subEva,'scollIndex',1);%���ù��ֵ�ǰͼƬ���
set(handles.rad_img_1,'Value',1);%����ͼƬ1��ťֵΪ1
set(handles.rad_img_1,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ

set(handles.rad_points_1,'Enable','on'); %���ô�ְ�ťrad_points_1��ѡȡ
set(handles.rad_points_2,'Enable','on'); %���ô�ְ�ťrad_points_2��ѡȡ
set(handles.rad_points_3,'Enable','on'); %���ô�ְ�ťrad_points_3��ѡȡ
set(handles.rad_points_4,'Enable','on'); %���ô�ְ�ťrad_points_4��ѡȡ
set(handles.rad_points_5,'Enable','on'); %���ô�ְ�ťrad_points_5��ѡȡ

GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���   
score = getappdata(handles.subEva,'score');%��ȡ��������
switch score(GTlist,1)%��ǰͼƬ�ķ���
    case 1
        set(handles.rad_points_1,'Value',1); %���ô�ְ�ťrad_points_1�ѱ�ѡ
    case 2
        set(handles.rad_points_2,'Value',1); %���ô�ְ�ťrad_points_2�ѱ�ѡ
    case 3
        set(handles.rad_points_3,'Value',1); %���ô�ְ�ťrad_points_3�ѱ�ѡ
    case 4
        set(handles.rad_points_4,'Value',1); %���ô�ְ�ťrad_points_4�ѱ�ѡ
    case 5
        set(handles.rad_points_5,'Value',1); %���ô�ְ�ťrad_points_5�ѱ�ѡ
    case 0
end

axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow

randFuc = getappdata(handles.subEva,'randFuc');%��ȡGT����*number_methods�����ͼƬ��ʾ����
i = randFuc(GTlist,1);%��ȡimg_1����Ӧ��������λ�õķ������

img = rimg(1:height,i*width+1:(i+1)*width,1:channels);
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
%imwrite(img,'C:/Users/hdx/Desktop/ͼ����������/�Ŵ�ͼ/GT1.tiff');
h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end



setappdata(handles.subEva,'randIndex',1);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�1��

function rad_img_2_Callback(hObject, eventdata, handles)

global h1; 
global rimg; 
global width; 
global height; 
global channels;
iniRad(handles);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%     set(handles.im_enlarge,'state','off');
% end
setappdata(handles.subEva,'scollIndex',2);%���ù��ֵ�ǰͼƬ���
set(handles.rad_img_2,'Value',1);%����ͼƬ2��ťֵΪ1
set(handles.rad_img_2,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ
    
set(handles.rad_points_1,'Enable','on'); %���ô�ְ�ťrad_points_1��ѡȡ
set(handles.rad_points_2,'Enable','on'); %���ô�ְ�ťrad_points_2��ѡȡ
set(handles.rad_points_3,'Enable','on'); %���ô�ְ�ťrad_points_3��ѡȡ
set(handles.rad_points_4,'Enable','on'); %���ô�ְ�ťrad_points_4��ѡȡ
set(handles.rad_points_5,'Enable','on'); %���ô�ְ�ťrad_points_5��ѡȡ

GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���   
score = getappdata(handles.subEva,'score');%��ȡ��������
switch score(GTlist,2)%��ǰͼƬ�ķ���
    case 1
        set(handles.rad_points_1,'Value',1); %���ô�ְ�ťrad_points_1�ѱ�ѡ
    case 2
        set(handles.rad_points_2,'Value',1); %���ô�ְ�ťrad_points_2�ѱ�ѡ
    case 3
        set(handles.rad_points_3,'Value',1); %���ô�ְ�ťrad_points_3�ѱ�ѡ
    case 4
        set(handles.rad_points_4,'Value',1); %���ô�ְ�ťrad_points_4�ѱ�ѡ
    case 5
        set(handles.rad_points_5,'Value',1); %���ô�ְ�ťrad_points_5�ѱ�ѡ
    case 0
end
axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow

randFuc = getappdata(handles.subEva,'randFuc');%��ȡGT����*number_methods�����ͼƬ��ʾ����
i = randFuc(GTlist,2);%��ȡimg_1����Ӧ��������λ�õķ������
img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end
setappdata(handles.subEva,'randIndex',2);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�2��


function rad_img_3_Callback(hObject, eventdata, handles)
global h1; 
global rimg; 
global width; 
global height; 
global channels;
iniRad(handles);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%     set(handles.im_enlarge,'state','off');
% end
setappdata(handles.subEva,'scollIndex',3);%���ù��ֵ�ǰͼƬ���
set(handles.rad_img_3,'Value',1);%����ͼƬ3��ťֵΪ1
set(handles.rad_img_3,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ

set(handles.rad_points_1,'Enable','on'); %���ô�ְ�ťrad_points_1��ѡȡ
set(handles.rad_points_2,'Enable','on'); %���ô�ְ�ťrad_points_2��ѡȡ
set(handles.rad_points_3,'Enable','on'); %���ô�ְ�ťrad_points_3��ѡȡ
set(handles.rad_points_4,'Enable','on'); %���ô�ְ�ťrad_points_4��ѡȡ
set(handles.rad_points_5,'Enable','on'); %���ô�ְ�ťrad_points_5��ѡȡ

GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���   
score = getappdata(handles.subEva,'score');%��ȡ��������
switch score(GTlist,3)%��ǰͼƬ�ķ���
    case 1
        set(handles.rad_points_1,'Value',1); %���ô�ְ�ťrad_points_1�ѱ�ѡ
    case 2
        set(handles.rad_points_2,'Value',1); %���ô�ְ�ťrad_points_2�ѱ�ѡ
    case 3
        set(handles.rad_points_3,'Value',1); %���ô�ְ�ťrad_points_3�ѱ�ѡ
    case 4
        set(handles.rad_points_4,'Value',1); %���ô�ְ�ťrad_points_4�ѱ�ѡ
    case 5
        set(handles.rad_points_5,'Value',1); %���ô�ְ�ťrad_points_5�ѱ�ѡ
    case 0
end


axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
randFuc = getappdata(handles.subEva,'randFuc');%��ȡGT����*number_methods�����ͼƬ��ʾ����
i = randFuc(GTlist,3);%��ȡimg_1����Ӧ��������λ�õķ������
img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end
setappdata(handles.subEva,'randIndex',3);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�3��
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ


function rad_img_4_Callback(hObject, eventdata, handles)
global h1; 
global rimg; 
global width; 
global height; 
global channels;
iniRad(handles);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%     set(handles.im_enlarge,'state','off');
% end
setappdata(handles.subEva,'scollIndex',4);%���ù��ֵ�ǰͼƬ���
set(handles.rad_img_4,'Value',1);%����ͼƬ4��ťֵΪ1
set(handles.rad_img_4,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ

set(handles.rad_points_1,'Enable','on'); %���ô�ְ�ťrad_points_1��ѡȡ
set(handles.rad_points_2,'Enable','on'); %���ô�ְ�ťrad_points_2��ѡȡ
set(handles.rad_points_3,'Enable','on'); %���ô�ְ�ťrad_points_3��ѡȡ
set(handles.rad_points_4,'Enable','on'); %���ô�ְ�ťrad_points_4��ѡȡ
set(handles.rad_points_5,'Enable','on'); %���ô�ְ�ťrad_points_5��ѡȡ

GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���   
score = getappdata(handles.subEva,'score');%��ȡ��������
switch score(GTlist,4)%��ǰͼƬ�ķ���
    case 1
        set(handles.rad_points_1,'Value',1); %���ô�ְ�ťrad_points_1�ѱ�ѡ
    case 2
        set(handles.rad_points_2,'Value',1); %���ô�ְ�ťrad_points_2�ѱ�ѡ
    case 3
        set(handles.rad_points_3,'Value',1); %���ô�ְ�ťrad_points_3�ѱ�ѡ
    case 4
        set(handles.rad_points_4,'Value',1); %���ô�ְ�ťrad_points_4�ѱ�ѡ
    case 5
        set(handles.rad_points_5,'Value',1); %���ô�ְ�ťrad_points_5�ѱ�ѡ
    case 0
end

axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow

randFuc = getappdata(handles.subEva,'randFuc');%��ȡGT����*number_methods�����ͼƬ��ʾ����
i = randFuc(GTlist,4);%��ȡimg_1����Ӧ��������λ�õķ������
img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end
setappdata(handles.subEva,'randIndex',4);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�4��


function rad_img_5_Callback(hObject, eventdata, handles)
global h1; 
global rimg; 
global width; 
global height; 
global channels;
iniRad(handles);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%     set(handles.im_enlarge,'state','off');
% end
setappdata(handles.subEva,'scollIndex',5);%���ù��ֵ�ǰͼƬ���
set(handles.rad_img_5,'Value',1);%����ͼƬ5��ťֵΪ1
set(handles.rad_img_5,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ

set(handles.rad_points_1,'Enable','on'); %���ô�ְ�ťrad_points_1��ѡȡ
set(handles.rad_points_2,'Enable','on'); %���ô�ְ�ťrad_points_2��ѡȡ
set(handles.rad_points_3,'Enable','on'); %���ô�ְ�ťrad_points_3��ѡȡ
set(handles.rad_points_4,'Enable','on'); %���ô�ְ�ťrad_points_4��ѡȡ
set(handles.rad_points_5,'Enable','on'); %���ô�ְ�ťrad_points_5��ѡȡ

GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���   
score = getappdata(handles.subEva,'score');%��ȡ��������
switch score(GTlist,5)%��ǰͼƬ�ķ���
    case 1
        set(handles.rad_points_1,'Value',1); %���ô�ְ�ťrad_points_1�ѱ�ѡ
    case 2
        set(handles.rad_points_2,'Value',1); %���ô�ְ�ťrad_points_2�ѱ�ѡ
    case 3
        set(handles.rad_points_3,'Value',1); %���ô�ְ�ťrad_points_3�ѱ�ѡ
    case 4
        set(handles.rad_points_4,'Value',1); %���ô�ְ�ťrad_points_4�ѱ�ѡ
    case 5
        set(handles.rad_points_5,'Value',1); %���ô�ְ�ťrad_points_5�ѱ�ѡ
    case 0
end    
axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
randFuc = getappdata(handles.subEva,'randFuc');%��ȡGT����*number_methods�����ͼƬ��ʾ����
i = randFuc(GTlist,5);%��ȡimg_1����Ӧ��������λ�õķ������
img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end
setappdata(handles.subEva,'randIndex',5);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�5��



function rad_img_6_Callback(hObject, eventdata, handles)
global h1; 
global rimg; 
global width; 
global height; 
global channels;
iniRad(handles);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%     set(handles.im_enlarge,'state','off');
% end
setappdata(handles.subEva,'scollIndex',6);%���ù��ֵ�ǰͼƬ���
set(handles.rad_img_6,'Value',1);%����ͼƬ6��ťֵΪ1
set(handles.rad_img_6,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ

set(handles.rad_points_1,'Enable','on'); %���ô�ְ�ťrad_points_1��ѡȡ
set(handles.rad_points_2,'Enable','on'); %���ô�ְ�ťrad_points_2��ѡȡ
set(handles.rad_points_3,'Enable','on'); %���ô�ְ�ťrad_points_3��ѡȡ
set(handles.rad_points_4,'Enable','on'); %���ô�ְ�ťrad_points_4��ѡȡ
set(handles.rad_points_5,'Enable','on'); %���ô�ְ�ťrad_points_5��ѡȡ
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���   
score = getappdata(handles.subEva,'score');%��ȡ��������
switch score(GTlist,6)%��ǰͼƬ�ķ���
    case 1
        set(handles.rad_points_1,'Value',1); %���ô�ְ�ťrad_points_1�ѱ�ѡ
    case 2
        set(handles.rad_points_2,'Value',1); %���ô�ְ�ťrad_points_2�ѱ�ѡ
    case 3
        set(handles.rad_points_3,'Value',1); %���ô�ְ�ťrad_points_3�ѱ�ѡ
    case 4
        set(handles.rad_points_4,'Value',1); %���ô�ְ�ťrad_points_4�ѱ�ѡ
    case 5
        set(handles.rad_points_5,'Value',1); %���ô�ְ�ťrad_points_5�ѱ�ѡ
    case 0
end    

axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow

randFuc = getappdata(handles.subEva,'randFuc');%��ȡGT����*number_methods�����ͼƬ��ʾ����
i = randFuc(GTlist,6);%��ȡimg_1����Ӧ��������λ�õķ������
img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end
setappdata(handles.subEva,'randIndex',6);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�6��



function rad_img_7_Callback(hObject, eventdata, handles)
global h1; 
global rimg; 
global width; 
global height; 
global channels;
iniRad(handles);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%     set(handles.im_enlarge,'state','off');
% end
setappdata(handles.subEva,'scollIndex',7);%���ù��ֵ�ǰͼƬ���
set(handles.rad_img_7,'Value',1);%����ͼƬ7��ťֵΪ1
set(handles.rad_img_7,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ

set(handles.rad_points_1,'Enable','on'); %���ô�ְ�ťrad_points_1��ѡȡ
set(handles.rad_points_2,'Enable','on'); %���ô�ְ�ťrad_points_2��ѡȡ
set(handles.rad_points_3,'Enable','on'); %���ô�ְ�ťrad_points_3��ѡȡ
set(handles.rad_points_4,'Enable','on'); %���ô�ְ�ťrad_points_4��ѡȡ
set(handles.rad_points_5,'Enable','on'); %���ô�ְ�ťrad_points_5��ѡȡ
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���   
score = getappdata(handles.subEva,'score');%��ȡ��������
switch score(GTlist,7)%��ǰͼƬ�ķ���
    case 1
        set(handles.rad_points_1,'Value',1); %���ô�ְ�ťrad_points_1�ѱ�ѡ
    case 2
        set(handles.rad_points_2,'Value',1); %���ô�ְ�ťrad_points_2�ѱ�ѡ
    case 3
        set(handles.rad_points_3,'Value',1); %���ô�ְ�ťrad_points_3�ѱ�ѡ
    case 4
        set(handles.rad_points_4,'Value',1); %���ô�ְ�ťrad_points_4�ѱ�ѡ
    case 5
        set(handles.rad_points_5,'Value',1); %���ô�ְ�ťrad_points_5�ѱ�ѡ
    case 0
end

axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow

randFuc = getappdata(handles.subEva,'randFuc');%��ȡGT����*number_methods�����ͼƬ��ʾ����
i = randFuc(GTlist,7);%��ȡimg_1����Ӧ��������λ�õķ������
img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end
setappdata(handles.subEva,'randIndex',7);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�7��
    


function rad_img_8_Callback(hObject, eventdata, handles)
global h1; 
global rimg; 
global width; 
global height; 
global channels;
iniRad(handles);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%     set(handles.im_enlarge,'state','off');
% end
setappdata(handles.subEva,'scollIndex',8);%���ù��ֵ�ǰͼƬ���
set(handles.rad_img_8,'Value',1);%����ͼƬ8��ťֵΪ1
set(handles.rad_img_8,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ

set(handles.rad_points_1,'Enable','on'); %���ô�ְ�ťrad_points_1��ѡȡ
set(handles.rad_points_2,'Enable','on'); %���ô�ְ�ťrad_points_2��ѡȡ
set(handles.rad_points_3,'Enable','on'); %���ô�ְ�ťrad_points_3��ѡȡ
set(handles.rad_points_4,'Enable','on'); %���ô�ְ�ťrad_points_4��ѡȡ
set(handles.rad_points_5,'Enable','on'); %���ô�ְ�ťrad_points_5��ѡȡ
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���   
score = getappdata(handles.subEva,'score');%��ȡ��������
switch score(GTlist,8)%��ǰͼƬ�ķ���
    case 1
        set(handles.rad_points_1,'Value',1); %���ô�ְ�ťrad_points_1�ѱ�ѡ
    case 2
        set(handles.rad_points_2,'Value',1); %���ô�ְ�ťrad_points_2�ѱ�ѡ
    case 3
        set(handles.rad_points_3,'Value',1); %���ô�ְ�ťrad_points_3�ѱ�ѡ
    case 4
        set(handles.rad_points_4,'Value',1); %���ô�ְ�ťrad_points_4�ѱ�ѡ
    case 5
        set(handles.rad_points_5,'Value',1); %���ô�ְ�ťrad_points_5�ѱ�ѡ
    case 0
end

axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow

randFuc = getappdata(handles.subEva,'randFuc');%��ȡGT����*number_methods�����ͼƬ��ʾ����
i = randFuc(GTlist,8);%��ȡimg_1����Ӧ��������λ�õķ������
img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end
setappdata(handles.subEva,'randIndex',8);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�8��


function rad_img_9_Callback(hObject, eventdata, handles)
global h1; 
global rimg; 
global width; 
global height; 
global channels;
iniRad(handles);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end
% enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
% if enlarge_whether_press==1
%     im_enlarge_ClickedCallback(hObject, eventdata, handles);
%     set(handles.im_enlarge,'state','off');
% end

setappdata(handles.subEva,'scollIndex',9);%���ù��ֵ�ǰͼƬ���
set(handles.rad_img_9,'Value',1);%����ͼƬ9��ťֵΪ1
set(handles.rad_img_9,'ForegroundColor',[0,0,1]);%����ͼƬGT��ť��������ɫ

set(handles.rad_points_1,'Enable','on'); %���ô�ְ�ťrad_points_1��ѡȡ
set(handles.rad_points_2,'Enable','on'); %���ô�ְ�ťrad_points_2��ѡȡ
set(handles.rad_points_3,'Enable','on'); %���ô�ְ�ťrad_points_3��ѡȡ
set(handles.rad_points_4,'Enable','on'); %���ô�ְ�ťrad_points_4��ѡȡ
set(handles.rad_points_5,'Enable','on'); %���ô�ְ�ťrad_points_5��ѡȡ
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���   
score = getappdata(handles.subEva,'score');%��ȡ��������
switch score(GTlist,9)%��ǰͼƬ�ķ���
    case 1
        set(handles.rad_points_1,'Value',1); %���ô�ְ�ťrad_points_1�ѱ�ѡ
    case 2
        set(handles.rad_points_2,'Value',1); %���ô�ְ�ťrad_points_2�ѱ�ѡ
    case 3
        set(handles.rad_points_3,'Value',1); %���ô�ְ�ťrad_points_3�ѱ�ѡ
    case 4
        set(handles.rad_points_4,'Value',1); %���ô�ְ�ťrad_points_4�ѱ�ѡ
    case 5
        set(handles.rad_points_5,'Value',1); %���ô�ְ�ťrad_points_5�ѱ�ѡ
    case 0
end

axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow

randFuc = getappdata(handles.subEva,'randFuc');%��ȡGT����*9�����ͼƬ��ʾ����
i = randFuc(GTlist,9);%��ȡimg_1����Ӧ��������λ�õķ������
img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ
setappdata(handles.subEva,'currentImg',img);%��¼��ǰ��ʾͼƬ
multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
if multiple ~= 1
    x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
    img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
end
h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press == 1
    set(h1,'UIContextMenu',handles.figure_imshow_menu);
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end
setappdata(handles.subEva,'randIndex',9);%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�9�� 


function rad_points_1_Callback(hObject, eventdata, handles)
global list_order;
set(handles.rad_points_2,'Value',0);
set(handles.rad_points_3,'Value',0);
set(handles.rad_points_4,'Value',0);
set(handles.rad_points_5,'Value',0);

score = getappdata(handles.subEva,'score');%��ȡ��һ�ַ�������
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��һ��ͼƬGT����Ԫ���±�
randIndex = getappdata(handles.subEva,'randIndex');%��ȡ��ǰ��ʾͼƬ����������±�
score(GTlist,randIndex) = 1;%���õ�ǰͼƬ����
setappdata(handles.subEva,'score',score);%�����������

list_order{randIndex,2}='          1';
set(handles.table_order,'Data',list_order);

% --- Executes on button press in rad_points_2.
function rad_points_2_Callback(hObject, eventdata, handles)
global list_order;
set(handles.rad_points_1,'Value',0);
set(handles.rad_points_3,'Value',0);
set(handles.rad_points_4,'Value',0);
set(handles.rad_points_5,'Value',0);

score = getappdata(handles.subEva,'score');%��ȡ��һ�ַ�������
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��һ��ͼƬGT����Ԫ���±�
randIndex = getappdata(handles.subEva,'randIndex');%��ȡ��ǰ��ʾͼƬ����������±�
score(GTlist,randIndex) = 2;%���õ�ǰͼƬ����
setappdata(handles.subEva,'score',score);%�����������
list_order{randIndex,2}='          2';
set(handles.table_order,'Data',list_order);

function rad_points_3_Callback(hObject, eventdata, handles)
global list_order;
set(handles.rad_points_1,'Value',0);
set(handles.rad_points_2,'Value',0);
set(handles.rad_points_4,'Value',0);
set(handles.rad_points_5,'Value',0);

score = getappdata(handles.subEva,'score');%��ȡ��һ�ַ�������
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��һ��ͼƬGT����Ԫ���±�
randIndex = getappdata(handles.subEva,'randIndex');%��ȡ��ǰ��ʾͼƬ����������±�
score(GTlist,randIndex) = 3;%���õ�ǰͼƬ����
setappdata(handles.subEva,'score',score);%�����������
list_order{randIndex,2}='          3';
set(handles.table_order,'Data',list_order);

function rad_points_4_Callback(hObject, eventdata, handles)
global list_order;
set(handles.rad_points_1,'Value',0);
set(handles.rad_points_2,'Value',0);
set(handles.rad_points_3,'Value',0);
set(handles.rad_points_5,'Value',0);

score = getappdata(handles.subEva,'score');%��ȡ��һ�ַ�������
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��һ��ͼƬGT����Ԫ���±�
randIndex = getappdata(handles.subEva,'randIndex');%��ȡ��ǰ��ʾͼƬ����������±�
score(GTlist,randIndex) = 4;%���õ�ǰͼƬ����
setappdata(handles.subEva,'score',score);%�����������
list_order{randIndex,2}='          4';
set(handles.table_order,'Data',list_order);

function rad_points_5_Callback(hObject, eventdata, handles)
global list_order;
set(handles.rad_points_1,'Value',0);
set(handles.rad_points_2,'Value',0);
set(handles.rad_points_3,'Value',0);
set(handles.rad_points_4,'Value',0);

score = getappdata(handles.subEva,'score');%��ȡ��һ�ַ�������
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��һ��ͼƬGT����Ԫ���±�
randIndex = getappdata(handles.subEva,'randIndex');%��ȡ��ǰ��ʾͼƬ����������±�
score(GTlist,randIndex) = 5;%���õ�ǰͼƬ����
setappdata(handles.subEva,'score',score);%�����������
list_order{randIndex,2}='          5';
set(handles.table_order,'Data',list_order);


function btn_pre_Callback(hObject, eventdata, handles)
global list_order;
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��һ��ͼƬGT����Ԫ���±�
GTlist = GTlist -1;%��ȡ��һ��ͼƬGT����Ԫ���±�
if GTlist == 0 %����ǰΪ��һ��ͼƬ������ʾ��This already is the first group����
    s = sprintf('\n\n\nThis already is the first \none��\n');
    hs = msgbox(s,'Warning','warn');%�Ի��򾯸�
    ht = findobj(hs,'Type','text');%Ѱ��msgbox���
    set(ht, 'FontSize',13,'Unit','normal');%���������С
    set(hs, 'Resize','on');%�Զ����ô��ڴ�С
 else
    setappdata(handles.subEva,'GTlist',GTlist);
    rad_img_GT_Callback(hObject, eventdata, handles);
    
    score = getappdata(handles.subEva,'score');%��ȡ��һ�ַ�������
    randFuc = getappdata(handles.subEva,'randFuc');%h��ȡrandFuc����
    
%     length(randFuc)
%     randFuc(GTlist,number_methods+1);
%     score(GTlist,randFuc(GTlist,number_methods+1));
    [order_height,order_width] = size(list_order);
    switch order_height
        case 2
            list_order{1,2}=['          ',num2str(score(GTlist,1))];
            list_order{2,2}=['          ',num2str(score(GTlist,2))];    
        case 3
            list_order{1,2}=['          ',num2str(score(GTlist,1))];
            list_order{2,2}=['          ',num2str(score(GTlist,2))];
            list_order{3,2}=['          ',num2str(score(GTlist,3))];
        case 4
            list_order{1,2}=['          ',num2str(score(GTlist,1))];
            list_order{2,2}=['          ',num2str(score(GTlist,2))];
            list_order{3,2}=['          ',num2str(score(GTlist,3))];
            list_order{4,2}=['          ',num2str(score(GTlist,4))]; 
        case 5
            list_order{1,2}=['          ',num2str(score(GTlist,1))];
            list_order{2,2}=['          ',num2str(score(GTlist,2))];
            list_order{3,2}=['          ',num2str(score(GTlist,3))];
            list_order{4,2}=['          ',num2str(score(GTlist,4))];
            list_order{5,2}=['          ',num2str(score(GTlist,5))];
        case 6
            list_order{1,2}=['          ',num2str(score(GTlist,1))];
            list_order{2,2}=['          ',num2str(score(GTlist,2))];
            list_order{3,2}=['          ',num2str(score(GTlist,3))];
            list_order{4,2}=['          ',num2str(score(GTlist,4))];
            list_order{5,2}=['          ',num2str(score(GTlist,5))];
            list_order{6,2}=['          ',num2str(score(GTlist,6))];
        case 7
            list_order{1,2}=['          ',num2str(score(GTlist,1))];
            list_order{2,2}=['          ',num2str(score(GTlist,2))];
            list_order{3,2}=['          ',num2str(score(GTlist,3))];
            list_order{4,2}=['          ',num2str(score(GTlist,4))];
            list_order{5,2}=['          ',num2str(score(GTlist,5))];
            list_order{6,2}=['          ',num2str(score(GTlist,6))];
            list_order{7,2}=['          ',num2str(score(GTlist,7))];
        case 8
            list_order{1,2}=['          ',num2str(score(GTlist,1))];
            list_order{2,2}=['          ',num2str(score(GTlist,2))];
            list_order{3,2}=['          ',num2str(score(GTlist,3))];
            list_order{4,2}=['          ',num2str(score(GTlist,4))];
            list_order{5,2}=['          ',num2str(score(GTlist,5))];
            list_order{6,2}=['          ',num2str(score(GTlist,6))];
            list_order{7,2}=['          ',num2str(score(GTlist,7))];
            list_order{8,2}=['          ',num2str(score(GTlist,8))];
        case 9
            list_order{1,2}=['          ',num2str(score(GTlist,1))];
            list_order{2,2}=['          ',num2str(score(GTlist,2))];
            list_order{3,2}=['          ',num2str(score(GTlist,3))];
            list_order{4,2}=['          ',num2str(score(GTlist,4))];
            list_order{5,2}=['          ',num2str(score(GTlist,5))];
            list_order{6,2}=['          ',num2str(score(GTlist,6))];
            list_order{7,2}=['          ',num2str(score(GTlist,7))];
            list_order{8,2}=['          ',num2str(score(GTlist,8))];
            list_order{9,2}=['          ',num2str(score(GTlist,9))];             
    end
    set(handles.table_order,'Data',list_order);
end



function btn_next_Callback(hObject, eventdata, handles)
global method_name;
global final_score;

global list_order;
global round_score;
global image_score;
score = getappdata(handles.subEva,'score');%��ȡ��һ�ַ�������
randFuc = getappdata(handles.subEva,'randFuc');%h��ȡrandFuc����
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬGT����Ԫ���±�
number_methods = getappdata(handles.subEva,'number_methods');%��ȡ������
str = true; %��¼�Ƿ���δ���ͼƬ
for i=1:1:number_methods+1
    if score(GTlist,i) == 0 %������Ϊ0������δ�����
        str = false;
    end
end
if isequal(str,true)

    for i = 1:1:number_methods+1
        if randFuc(GTlist,i)==(number_methods+1)
            order_GT = i;
        end
    end
%     randFuc(GTlist,number_methods+1)
%     score(GTlist,randFuc(GTlist,number_methods+1))
%     score(GTlist,order_GT)
    
    if  score(GTlist,order_GT)~=5
        s = sprintf('\nYou have not carefully \nmarked each image yet��\n');
        hs = msgbox(s,'Warning','warn');%�Ի��򾯸�
        ht = findobj(hs,'Type','text');%Ѱ��msgbox���
        set(ht, 'FontSize',10,'Unit','normal');%���������С
        set(hs, 'Resize','on');%�Զ����ô��ڴ�С
    else
        [order_height,order_width] = size(list_order);
        switch order_height
            case 2
                list_order{1,2}='          -';
                list_order{2,2}='          -';    
            case 3
                list_order{1,2}='          -';
                list_order{2,2}='          -';
                list_order{3,2}='          -';
            case 4
                list_order{1,2}='          -';
                list_order{2,2}='          -';
                list_order{3,2}='          -';
                list_order{4,2}='          -'; 
            case 5
                list_order{1,2}='          -';
                list_order{2,2}='          -';
                list_order{3,2}='          -';
                list_order{4,2}='          -';
                list_order{5,2}='          -';
            case 6
                list_order{1,2}='          -';
                list_order{2,2}='          -';
                list_order{3,2}='          -';
                list_order{4,2}='          -';
                list_order{5,2}='          -';
                list_order{6,2}='          -';
            case 7
                list_order{1,2}='          -';
                list_order{2,2}='          -';
                list_order{3,2}='          -';
                list_order{4,2}='          -';
                list_order{5,2}='          -';
                list_order{6,2}='          -';
                list_order{7,2}='          -';
            case 8
                list_order{1,2}='          -';
                list_order{2,2}='          -';
                list_order{3,2}='          -';
                list_order{4,2}='          -';
                list_order{5,2}='          -';
                list_order{6,2}='          -';
                list_order{7,2}='          -';
                list_order{8,2}='          -';
            case 9
                list_order{1,2}='          -';
                list_order{2,2}='          -';
                list_order{3,2}='          -';
                list_order{4,2}='          -';
                list_order{5,2}='          -';
                list_order{6,2}='          -';
                list_order{7,2}='          -';
                list_order{8,2}='          -';
                list_order{9,2}='          -';             
        end
        set(handles.table_order,'Data',list_order);
        lengthGT = getappdata(handles.subEva,'lengthGT');%��ȡGTԪ��ĳ���
        numOfRounds = getappdata(handles.subEva,'numOfRounds');%��ȡ��������
        GTlist = GTlist + 1;%��ȡ��һ��ͼƬGT����Ԫ���±�
        if (GTlist-1) == lengthGT %����ǰΪ���һ��ͼƬ
            if numOfRounds == 2
                s = sprintf('\nTwo rounds of tests have ended��\nConfirm submission?\n');
                button = questdlg(s,'Question','OK','Cancel','OK');
                switch button
                    case 'OK'
                        firstRoundScore = getappdata(handles.subEva,'firstRoundScore');%��ȡ��1�ַ���
                        firstRoundRandFuc = getappdata(handles.subEva,'firstRoundRandFuc');%��ȡ��1���������
    %                         disp(firstRoundScore);
    %                         disp(firstRoundRandFuc);
    %                         disp(score);
    %                         disp(randFuc);
%     global round_score;
% global image_score;
                        firstRound_findal_score = zeros(1,number_methods); %������1���ܷ־���
                        secondRound_findal_score = zeros(1,number_methods); %������2���ܷ־���
                        [m,n] = size(firstRoundRandFuc); %��ȡ��������ά��
                        for k=1:1:number_methods %����1-number_methods
                            sum = 0; %����k��Ӧ���ܷ֣���ʼֵΪ0
                            for i=1:1:m
                                for j=1:1:n
                                    if firstRoundRandFuc(i,j) == k %��������������ж�ӦֵΪk
                                        sum = sum + firstRoundScore(i,j); %k�������ܷ��ۼ�
                                    end
                                end
                            end
                            firstRound_findal_score(1,k) = sum; %�����1�ַ���k���ܷ�
                        end

                        
                        %��¼���������µ�ͼƬ����
                        image_score_one_round = zeros(m,n);
                        for i=1:1:m
                            for j=1:1:n                      
                                image_score_one_round(i,firstRoundRandFuc(i,j)) = firstRoundScore(i,j);
                            end
                        end
                        [image_score_one_round_m,image_score_one_round_n] = size(image_score_one_round); 
                        
                        image_score = [image_score;image_score_one_round(:,1:(image_score_one_round_n-1))];
                        round_score = [round_score;firstRound_findal_score];
%                        
%                         firstRoundRandFuc
%                         firstRoundScore
%                         image_score_one_round
%                         image_score
                       
                        for k=1:1:number_methods %����1-number_methods
                            sum = 0; %����k��Ӧ���ܷ֣���ʼֵΪ0
                            for i=1:1:m
                                for j=1:1:n
                                    if randFuc(i,j) == k%��������������ж�ӦֵΪk
                                        sum = sum + score(i,j);%k�������ܷ��ۼ�
                                    end
                                end
                            end
                            secondRound_findal_score(1,k) = sum; %�����2�ַ���k���ܷ�
                        end
    %                         disp(firstRound_findal_score);
    %                         disp(secondRound_findal_score);
    
                            %��¼���������µ�ͼƬ����
                      
                        image_score_second_round = zeros(m,n);
                        for i=1:1:m
                            for j=1:1:n
                                image_score_second_round(i,randFuc(i,j)) = score(i,j);
                            end
                        end
                        [image_score_second_round_m,image_score_second_round_n] = size(image_score_second_round); 
                        image_score = [image_score;image_score_second_round(:,1:(image_score_second_round_n-1))];
                        
                        round_score = [round_score;secondRound_findal_score];
                        
                        threshold = getappdata(handles.subEva,'threshold');
                        whetherCon = 0;
                        for i=1:1:number_methods
                            if abs(firstRound_findal_score(1,i)-secondRound_findal_score(1,i))>threshold
                                whetherCon = 1;
                            end
                        end
                        if whetherCon == 0
                            whether_display_results = getappdata(handles.subEva,'whether_display_results');
                            if whether_display_results~=1
                                s = sprintf('\nTest completed��\n');
                                hs = msgbox(s,'Warning','warn');%�Ի��򾯸�
                                ht = findobj(hs,'Type','text');%Ѱ��msgbox���
                                set(ht, 'FontSize',13,'Unit','normal');%���������С
                                set(hs, 'Resize','on');%�Զ����ô��ڴ�С
                                %set(hs, 'Position',[100 100 100 100]);%�ֶ�����
                                final_score = ceil((firstRound_findal_score + secondRound_findal_score)/2);
                                path = [num2str(year(now)),'-',num2str(month(now)),'-',num2str(day(now)),' ',num2str(hour(now)),'-',num2str(minute(now)),'-',num2str(floor(second(now)))];
                                
%                                 assignin('base', 'final_score', final_score);
%                                 assignin('base', 'round_score', round_score);
%                                 assignin('base', 'method_name', method_name);

                                save(['save/' path '.mat'],'final_score','round_score','method_name','image_score');

                                close(handles.subEva);
                            else
                                final_score = ceil((firstRound_findal_score + secondRound_findal_score)/2);
                                path = [num2str(year(now)),'-',num2str(month(now)),'-',num2str(day(now)),' ',num2str(hour(now)),'-',num2str(minute(now)),'-',num2str(floor(second(now)))];

                                save(['save/' path '.mat'],'final_score','round_score','method_name','image_score');


                                s = sprintf('\nTest completed��\nWill you see the results?\n');
                                button = questdlg(s,'Question','OK','Cancel','OK');
                                switch button
                                    case 'OK'    
                                        close(handles.subEva);
                                        h = results;
    %                                      method_name = 'CGI CUBIC FCGI LMMSE NARM NEDI RSAI SAI SME';
    %                                      final_score = [20 12 20 10 19 11 20 19 18];
                                        names = regexp(method_name,'\s','split');
                                        bar(final_score',0.5);
                                        set(gca,'XTickLabel',names);
                                        set(gca,'YLim',[0 (max(final_score)+floor(max(final_score)/9))]);%y���������ʾ��Χ
                                        set(gca,'YTick',0:5:(max(final_score)+floor(max(final_score)/9)));
    %                                     for i=1:1:length(final_score)
    %                                         t = text(i,final_score(i)+0.5,num2str(final_score(i)));
    %                                         t.FontSize = 12;                                    
    %                                     end
                                        xlabel('The algorithms under evaluation','fontsize',16);
                                        ylabel('MOSs','fontsize',18);
                                        title('The results of evaluation','fontsize',18);
                                        set(gca,'Fontsize',15);
                                        set(gcf,'NumberTitle','off');
                                        set(gcf,'Name','Results');
                                    case 'Cancel'
                                        close(handles.subEva);
                                end  
                            end

                        else
                            s = sprintf('\nThe 2 round scores are inconsistent��\nWill you enter the third round?\n');
                            button = questdlg(s,'Question','OK','Cancel','OK');
                            switch button
                                case 'OK'                
                                    setappdata(handles.subEva,'firstRound_findal_score',firstRound_findal_score);%�����1�ַ���
                                    setappdata(handles.subEva,'secondRound_findal_score',secondRound_findal_score);%�����2�ַ���
%                                     disp(firstRound_findal_score);
%                                     disp(secondRound_findal_score);
                                    setappdata(handles.subEva,'numOfRounds',3);%���ò�������Ϊ3
                                    im_open_ClickedCallback(hObject, eventdata, handles);%��ʼ��3�ֲ���
                                case 'Cancel'
                                    close(handles.subEva);
                            end                         
                        end

                    case 'Cancel'
                        return;
                end
            else if numOfRounds == 1
                    s = sprintf('\nThis already is the last one��\nWill you enter the second round?\n');
                    button = questdlg(s,'Question','OK','Cancel','OK');
                    switch button
                        case 'OK'
                            setappdata(handles.subEva,'firstRoundScore',score);%�����1�ַ���
                            setappdata(handles.subEva,'firstRoundRandFuc',randFuc);%�����1���������                        
                            setappdata(handles.subEva,'numOfRounds',2);%���ò�������Ϊ2
                            im_open_ClickedCallback(hObject, eventdata, handles);%��ʼ��2�ֲ���
                            %     global round_score;
                            %     global image_score;
                        case 'Cancel'
                            return;
                    end
                else
                    s = sprintf('\nThe 2 consecutive rounds of tests have ended��\nConfirm submission?\n');
                    button = questdlg(s,'Question','OK','Cancel','OK');
                    switch button
                        case 'OK'
                            secondRound_findal_score = getappdata(handles.subEva,'secondRound_findal_score');%��ȡ��2�ַ���                 
                            thirdRound_findal_score = zeros(1,number_methods); %������3���ܷ־���
                            [m,n] = size(randFuc); %��ȡ��������ά��
                            for k=1:1:number_methods %����1-number_methods
                                sum = 0; %����k��Ӧ���ܷ֣���ʼֵΪ0
                                for i=1:1:m
                                    for j=1:1:n
                                        if randFuc(i,j) == k%��������������ж�ӦֵΪk
                                            sum = sum + score(i,j);%k�������ܷ��ۼ�
                                        end
                                    end
                                end
                                thirdRound_findal_score(1,k) = sum; %�����3�ַ���k���ܷ�
                            end   
                            
                            image_score_third_round = zeros(m,n);
                            for i=1:1:m
                                for j=1:1:n
                                    image_score_third_round(i,randFuc(i,j)) = score(i,j);
                                end
                            end
                            [image_score_third_round_m,image_score_third_round_n] = size(image_score_third_round); 
                            image_score = [image_score;image_score_third_round(:,1:(image_score_third_round_n-1))];
                            round_score = [round_score;thirdRound_findal_score];

                            
                            threshold = getappdata(handles.subEva,'threshold');
                            whetherCon = 0;
                            for i=1:1:number_methods
                                if abs(thirdRound_findal_score(1,i)-secondRound_findal_score(1,i))>threshold
                                    whetherCon = 1;
                                end
                            end


                            if whetherCon == 0                                      
                                whether_display_results = getappdata(handles.subEva,'whether_display_results');
                                if whether_display_results~=1
                                    s = sprintf('\nTest completed��\n');
                                    hs = msgbox(s,'Warning','warn');%�Ի��򾯸�
                                    ht = findobj(hs,'Type','text');%Ѱ��msgbox���
                                    set(ht, 'FontSize',13,'Unit','normal');%���������С
                                    set(hs, 'Resize','on');%�Զ����ô��ڴ�С
                                    %set(hs, 'Position',[100 100 100 100]);%�ֶ�����
                                    final_score = ceil((thirdRound_findal_score + secondRound_findal_score)/2);
                                    path = [num2str(year(now)),'-',num2str(month(now)),'-',num2str(day(now)),' ',num2str(hour(now)),'-',num2str(minute(now)),'-',num2str(floor(second(now)))];
                                    
                                    save(['save/' path '.mat'],'final_score','round_score','method_name','image_score');
                                    
                                    close(handles.subEva);
                                else
                                    final_score = ceil((thirdRound_findal_score + secondRound_findal_score)/2);
                                    path = [num2str(year(now)),'-',num2str(month(now)),'-',num2str(day(now)),' ',num2str(hour(now)),'-',num2str(minute(now)),'-',num2str(floor(second(now)))];
                                    
                                    save(['save/' path '.mat'],'final_score','round_score','method_name','image_score');
                                    
                                    s = sprintf('\nTest completed��\nWill you see the results?\n');
                                    button = questdlg(s,'Question','OK','Cancel','OK');
                                    switch button
                                        case 'OK'    
                                            close(handles.subEva);
                                            h = results;
                                            names = regexp(method_name,'\s','split');
                                            bar(final_score',0.5);
                                            set(gca,'XTickLabel',names);
                                            set(gca,'YLim',[0 (max(final_score)+floor(max(final_score)/lengthGT))]);%y���������ʾ��Χ
                                            set(gca,'YTick',0:5:(max(final_score)+floor(max(final_score)/lengthGT)));
    %                                         for i=1:1:length(final_score)
    %                                             t = text(i,final_score(i)+0.5,num2str(final_score(i)));
    %                                             t.FontSize = 12;                                    
    %                                         end
                                            xlabel('The algorithms under evaluation','fontsize',16);
                                            ylabel('MOSs','fontsize',18);
                                            title('The results of evaluation','fontsize',18);
                                            set(gca,'Fontsize',15);
                                            set(gcf,'NumberTitle','off');
                                            set(gcf,'Name','Results');
                                        case 'Cancel'
                                            close(handles.subEva);
                                    end  
                                end

                            else
                                s = sprintf('\nThe 2 consecutive rounds round scores are inconsistent��\nWill you enter the next round?\n');
                                button = questdlg(s,'Question','OK','Cancel','OK');
                                switch button
                                    case 'OK'
                                        setappdata(handles.subEva,'firstRound_findal_score',secondRound_findal_score); %�����1�ַ���
                                        setappdata(handles.subEva,'secondRound_findal_score',thirdRound_findal_score); %�����2�ַ���                       
                                        setappdata(handles.subEva,'numOfRounds',3);%���ò�������Ϊ3
                                        im_open_ClickedCallback(hObject, eventdata, handles);%��ʼ��3�ֲ���
                                    case 'Cancel'
                                        close(handles.subEva);
                                end

                            end 
                        case 'Cancel'
                            return;
                    end

                end
            end

         else
            setappdata(handles.subEva,'GTlist',GTlist);
            setappdata(handles.subEva,'multiples',1);
            rad_img_GT_Callback(hObject, eventdata, handles);
         end        
    end

else
    order_noscore = '';
    for i=1:1:number_methods+1
        if score(GTlist,i) == 0 %������Ϊ0������δ�����
            if i==1
                order_noscore = [order_noscore,num2str(i),'st,'];
            else if i==2
                    order_noscore = [order_noscore,num2str(i),'nd,'];
                else if i==3
                       order_noscore = [order_noscore,num2str(i),'rd,'];
                    else
                        order_noscore = [order_noscore,num2str(i),'th,'];
                    end
                end
            end
        end
    end
    order_noscore = [order_noscore(1:length(order_noscore)-1),' '];

        s = sprintf(['\n\n\nYou have not scored the\n', order_noscore, '\nimages yet��\n']);
            hs = msgbox(s,'Warning','warn');%�Ի��򾯸�
            ht = findobj(hs,'Type','text');%Ѱ��msgbox���
            set(ht, 'FontSize',11,'Unit','normal');%���������С
            set(hs, 'Resize','on');%�Զ����ô��ڴ�С

end


function subEva_WindowScrollWheelFcn(hObject, eventdata, handles)
SrollWheel = getappdata(handles.subEva,'SrollWheel');%��ȡ���ֳ�ʼֵ
scollIndex = getappdata(handles.subEva,'scollIndex');%��ȡ��ǰͼƬ���
switch SrollWheel 
    case 0
        setappdata(handles.subEva,'SrollWheel',1);%ѭ�����֣�0-1
        rad_img_GT_Callback(hObject, eventdata, handles);%ѭ�����֣���ʾGT
    case 1
        setappdata(handles.subEva,'SrollWheel',0);%ѭ�����֣�1-0
        switch scollIndex
            case 1
                rad_img_1_Callback(hObject, eventdata, handles)%ѭ�����֣���ʾimage_1
            case 2
                rad_img_2_Callback(hObject, eventdata, handles)%ѭ�����֣���ʾimage_2
            case 3
                rad_img_3_Callback(hObject, eventdata, handles)%ѭ�����֣���ʾimage_3
            case 4
                rad_img_4_Callback(hObject, eventdata, handles)%ѭ�����֣���ʾimage_4
            case 5
                rad_img_5_Callback(hObject, eventdata, handles)%ѭ�����֣���ʾimage_5
            case 6
                rad_img_6_Callback(hObject, eventdata, handles)%ѭ�����֣���ʾimage_6
            case 7
                rad_img_7_Callback(hObject, eventdata, handles)%ѭ�����֣���ʾimage_7
            case 8
                rad_img_8_Callback(hObject, eventdata, handles)%ѭ�����֣���ʾimage_8
            case 9
                rad_img_9_Callback(hObject, eventdata, handles)%ѭ�����֣���ʾimage_9
            otherwise 
                return;
        end
end




function im_enlarge_ClickedCallback(hObject, eventdata, handles)
global hObjec;
global eventdat;
global handle;
global h1;
global rimg; 
global width; 
global height; 
global channels;
hObjec = hObject;
eventdat = handles;
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    im_trans_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_trans,'state','off');
end

if enlarge_whether_press == 0
    set(gcf,'WindowButtonMotionFcn',@changeMouse);
    setappdata(handles.subEva,'enlarge_whether_press',1);
    GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���  
    randFuc = getappdata(handles.subEva,'randFuc');%h��ȡrandFuc����
    randIndex = getappdata(handles.subEva,'randIndex');%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�7��
    if randIndex==0
        i = 0;
    else
        i = randFuc(GTlist,randIndex);%��ȡimg����Ӧ��������λ�õķ������
    end
    img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ
    axes(handles.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
    multiple = getappdata(handles.subEva,'multiples');%��ǰͼ����
    if multiple ~= 1
        x_beforeEnlarge = getappdata(handles.subEva,'x_beforeEnlarge');
        y_beforeEnlarge = getappdata(handles.subEva,'y_beforeEnlarge');
        img = enlarge_or_narrow(img,multiple,x_beforeEnlarge,y_beforeEnlarge);  
    end
    h1 = imshow(img);%��imread����ͼƬ������imshow��axes_src����ʾ
    enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
    if enlarge_whether_press == 1
        set(h1,'UIContextMenu',handles.figure_imshow_menu);
    end
    handle = handles;
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
else
    set(h1,'ButtonDownFcn','');
    set(gcf,'WindowButtonUpFcn','');
    set(gcf, 'WindowButtonMotionFcn', '');    %ȡ������ƶ���Ӧ
    setappdata(handles.subEva,'enlarge_whether_press',0);
end

function ButtonDownFcn(varargin)
    global x;
    global y;
    if strcmp(get(gcf,'SelectionType'),'normal')
        % ��ʱ��Ϊ���
        
        pt = get(gca,'CurrentPoint');
        x = pt(1,1);
        y = pt(2,2);
        set(gcf, 'WindowButtonMotionFcn', '');    %ȡ������ƶ���Ӧ
        set(gcf,'WindowButtonMotionFcn',@ButtonMotionFcn);  
    end
return;
function ButtonUpFcn(varargin)
    global handle;
    global hObjec;
    global eventdat;
    global width; 
    global height; 
    global channels;
    global m;
    global n;
    global x;
    global y;
    global h1;
    if strcmp(get(gcf,'SelectionType'),'open')
        reset_Callback(hObjec, eventdat, handle);
%         printf('%s','ssssssssssssssss');
    else if strcmp(get(gcf,'SelectionType'),'normal')
        pt = get(gca,'CurrentPoint'); 
        m = pt(1,1);  
        n = pt(1,2);
        if (x>1&&y>1&&x<=width&&y<=height)
            if m>width
                m=width;
            end
            if m<1
                m=1;
            end
            if n>height
                n=height;
            end
            if n<1
                n=1;
            end
            
            set(gcf, 'WindowButtonMotionFcn', '');    %ȡ������ƶ���Ӧ
            box_height = floor(abs(y-n));
            box_width = floor(abs(x-m));
            img = getappdata(handle.subEva,'currentImg');
            x_beforeEnlarge = getappdata(handle.subEva,'x_beforeEnlarge');
            y_beforeEnlarge = getappdata(handle.subEva,'y_beforeEnlarge');
            if floor((x+m)/2)~=x_beforeEnlarge
                multiples = getappdata(handle.subEva,'multiples');%��ǰͼ����
                multiple = floor(max(height*multiples/box_height,width*multiples/box_width));%�Ŵ��ͼ����
                if box_height==0
                    multiple = multiples*2;
                end
                if multiple>min(height,width)
                        multiple = floor(min(height,width)/2);
                end
                setappdata(handle.subEva,'multiples',multiple);%��ǰͼ����
                if x_beforeEnlarge==0 && y_beforeEnlarge==0

                    img = enlarge_or_narrow(img,multiple,floor((x+m)/2),floor((y+n)/2));
                    setappdata(handle.subEva,'x_beforeEnlarge',floor((x+m)/2))%ͼ�����ĵ�x����
                    setappdata(handle.subEva,'y_beforeEnlarge',floor((y+n)/2))%ͼ�����ĵ�y����
                    x=0;y=0;
                else
                    x_distance = (floor((x+m)/2)-width/2)/multiples;
                    y_distance = (floor((y+n)/2)-height/2)/multiples;
                    if x_distance>0
                        x_distance = floor(x_distance);
                    else 
                        x_distance = ceil(x_distance);                   
                    end
                    if y_distance>0
                        y_distance = floor(y_distance);
                    else 
                        y_distance = ceil(y_distance);                  
                    end                
                    obj_x = x_distance+x_beforeEnlarge;
                    obj_y = y_distance+y_beforeEnlarge;

                    img = enlarge_or_narrow(img,multiple,obj_x,obj_y);
                  
                    x=0;y=0;
                    setappdata(handle.subEva,'x_beforeEnlarge',obj_x)%ͼ�����ĵ�x����
                    setappdata(handle.subEva,'y_beforeEnlarge',obj_y)%ͼ�����ĵ�y����
                end
                axes(handle.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
                h1 = imshow(img);
                enlarge_whether_press = getappdata(handle.subEva,'enlarge_whether_press');
                if enlarge_whether_press == 1
                    set(h1,'UIContextMenu',handle.figure_imshow_menu);
                end
                set(gcf,'WindowButtonMotionFcn',@changeMouse);
                set(h1,'ButtonDownFcn',@ButtonDownFcn);
                set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);          
            end
        end     
        end
    end
return;
function ButtonMotionFcn(varargin)
    pt = get(gca,'CurrentPoint');  
    global x;
    global y;
    global a;
    global b;
    global c;
    global d;
    global m;
    global n;
    m = pt(1,1);  
    n = pt(1,2);
    delete(a);
    delete(b);
    delete(c);
    delete(d);
%     a = line([x,m],[y,y],'color',[1,0,0],'linewidth',4);
%     b = line([x,x],[y,n],'color',[1,0,0],'linewidth',4);
%     c = line([x,m],[n,n],'color',[1,0,0],'linewidth',4);
%     d = line([m,m],[y,n],'color',[1,0,0],'linewidth',4);  
    a = line([x,m],[y,y],'color',[0.5,0.5,0.5],'linewidth',2);
    b = line([x,x],[y,n],'color',[0.5,0.5,0.5],'linewidth',2);
    c = line([x,m],[n,n],'color',[0.5,0.5,0.5],'linewidth',2);
    d = line([m,m],[y,n],'color',[0.5,0.5,0.5],'linewidth',2); 
return;

function changeMouse(varargin)
global width; 
global height; 
    pt = get(gca,'CurrentPoint');
    cpt_x = pt(1,1);  
    cpt_y = pt(1,2);
    if (cpt_x>1&&cpt_y>1&&cpt_x<=width&&cpt_y<=height)
        set(gcf,'Pointer','hand');
    else
        set(gcf,'Pointer','arrow');
    end
return;

function reset_Callback(hObject, eventdata, handles)
global handle;
global h1;
global x;
global y;
global m;
global n;
global rimg; 
global width; 
global height; 
global channels;
x = 0;
y = 0;
m = 0;
n = 0;
GTlist = getappdata(handles.subEva,'GTlist');%��ȡ��ǰͼƬ���  
randFuc = getappdata(handles.subEva,'randFuc');%h��ȡrandFuc����
randIndex = getappdata(handles.subEva,'randIndex');%��¼��ǰ��ʾͼƬΪһ��ͼƬ�еĵ�7��
if randIndex==0
    i = 0;
else
    i = randFuc(GTlist,randIndex);%��ȡimg����Ӧ��������λ�õķ������
end
img = rimg(1:height,i*width+1:(i+1)*width,1:channels);%�ӽ�������н�ȡͼƬ

axes(handle.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow

setappdata(handle.subEva,'x_beforeEnlarge',0);
setappdata(handle.subEva,'y_beforeEnlarge',0);
setappdata(handle.subEva,'multiples',1);%��ǰͼ����
axes(handle.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
h1 = imshow(img);
trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==1
    return;
else
    set(h1,'ButtonDownFcn',@ButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@ButtonUpFcn);
end



function im_trans_ClickedCallback(hObject, eventdata, handles)

global h1;
enlarge_whether_press = getappdata(handles.subEva,'enlarge_whether_press');
if enlarge_whether_press==1
    im_enlarge_ClickedCallback(hObject, eventdata, handles);
    set(handles.im_enlarge,'state','off');
end

trans_whether_press = getappdata(handles.subEva,'trans_whether_press');
if trans_whether_press==0
    set(gcf,'WindowButtonMotionFcn',@changeMouse);
    setappdata(handles.subEva,'trans_whether_press',1);
    set(h1,'ButtonDownFcn',@tranButtonDownFcn);
    set(gcf,'WindowButtonUpFcn',@tranButtonUpFcn);
else
    set(h1,'ButtonDownFcn','');
    set(gcf,'WindowButtonUpFcn','');
    set(gcf, 'WindowButtonMotionFcn', '');    %ȡ������ƶ���Ӧ
    setappdata(handles.subEva,'trans_whether_press',0);    
end




function tranButtonDownFcn(varargin)
    global trans_x;
    global trans_y;
    if strcmp(get(gcf,'SelectionType'),'normal')
        pt = get(gca,'CurrentPoint');
        trans_x = pt(1,1);
        trans_y = pt(2,2);
        set(gcf,'WindowButtonMotionFcn',@transButtonMotionFcn);  
    end

return;


function tranButtonUpFcn(varargin)
    global h1;
    global trans_x;
    global trans_y;
    global handle;
    global hObjec;
    global eventdat;
    trans_x = 0;trans_y = 0;
    if strcmp(get(gcf,'SelectionType'),'normal')
        set(gcf, 'WindowButtonMotionFcn', '');    %ȡ������ƶ���Ӧ  
        set(gcf,'WindowButtonMotionFcn',@changeMouse);
        set(h1,'ButtonDownFcn',@tranButtonDownFcn);
        set(gcf,'WindowButtonUpFcn',@tranButtonUpFcn);
    else if strcmp(get(gcf,'SelectionType'),'open')
            reset_Callback(hObjec, eventdat, handle);
        end
    end
return;
function transButtonMotionFcn(varargin)
    global trans_x;
    global trans_y;
    global trans_m;
    global trans_n;
    global handle;
    global width; 
    global height; 
    global h1;
    pt = get(gca,'CurrentPoint');
    trans_m = pt(1,1);
    trans_n = pt(2,2);
    x_beforeEnlarge = getappdata(handle.subEva,'x_beforeEnlarge');
    y_beforeEnlarge = getappdata(handle.subEva,'y_beforeEnlarge');
    multiples = getappdata(handle.subEva,'multiples');%��ǰͼ����
    img = getappdata(handle.subEva,'currentImg');
    if (trans_x>1&&trans_y>1&&trans_x<=width&&trans_y<=height)
        if trans_m>width
            trans_m=width;
        end
        if trans_m<1
            trans_m=1;
        end
        if trans_n>height
            trans_n=height;
        end
        if trans_n<1
            trans_n=1;
        end
        if x_beforeEnlarge~=0 && y_beforeEnlarge~=0
            trans_distance_x = floor(trans_x - trans_m);
            trans_distance_y = floor(trans_y - trans_n);
            obj_x = floor(trans_distance_x/multiples) + x_beforeEnlarge;
            obj_y = floor(trans_distance_y/multiples) + y_beforeEnlarge;
            img = enlarge_or_narrow(img,multiples,obj_x,obj_y);
            setappdata(handle.subEva,'x_beforeEnlarge',obj_x)%ͼ�����ĵ�x����
            setappdata(handle.subEva,'y_beforeEnlarge',obj_y)%ͼ�����ĵ�y����
            axes(handle.axes_imshow);%��axes�����趨��ǰ��������������axes_imshow
            h1 = imshow(img);
        end
    end
return;



function readme_ClickedCallback(hObject, eventdata, handles)
c = subEva_Readme;


% --- Executes when subEva is resized.
function subEva_SizeChangedFcn(hObject, eventdata, handles)
position_state_panel = get(handles.state_panel,'position');
position_order_panel = get(handles.order_panel,'position');
position_score_panel = get(handles.score_panel,'position');
position_image_panel = get(handles.image_panel,'position');
position_btn_next = get(handles.btn_next,'position');
position_btn_pre = get(handles.btn_pre,'position');
position_axes_imshow = get(handles.axes_imshow,'position');
position_table_order = get(handles.table_order,'position');

% ScreenSize = get(0,'ScreenSize');
GcfSize = get(gcf,'Position');
if and(GcfSize(3)>=644,GcfSize(3)>=365)
    set(handles.order_panel,'position',[GcfSize(3)-218,+GcfSize(4)-361,position_order_panel(3),position_order_panel(4)]);
    set(handles.score_panel,'position',[GcfSize(3)-112,+GcfSize(4)-263,position_score_panel(3),position_score_panel(4)]);
    set(handles.btn_next,'position',[GcfSize(3)-110,+GcfSize(4)-312,position_btn_next(3),position_btn_next(4)]);
    set(handles.btn_pre,'position',[GcfSize(3)-110,+GcfSize(4)-356,position_btn_pre(3),position_btn_pre(4)]);
    set(handles.image_panel,'position',[position_image_panel(1),position_image_panel(2),GcfSize(3)-236,GcfSize(4)-12]);
    set(handles.axes_imshow,'position',[14,15,GcfSize(3)-236-2*14,GcfSize(4)-12-2*15]);
    if(GcfSize(4)-position_order_panel(4)-13)>0
        set(handles.state_panel,'position',[GcfSize(3)-218,position_image_panel(2),position_state_panel(3),GcfSize(4)-position_order_panel(4)-13]);
    end
    if (GcfSize(4)-position_order_panel(4)-13)>100
      set(handles.table_order,'position',[(position_state_panel(3)-151)/2,50,position_table_order(3),GcfSize(4)-position_order_panel(4)-13-100]);
    else
      set(handles.table_order,'position',[(position_state_panel(3)-151)/2,50,position_table_order(3),0]); 
    end
end
