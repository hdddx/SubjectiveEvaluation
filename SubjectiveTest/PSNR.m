function main()
clc; 
clear;
number_method = 10;
number_gt = 8;
score_psnr = zeros(number_gt,number_method);
FilePath = 'image';
list = dir(FilePath);
rimg = [];
method_name = '';
for m = 3:size(list)
    sublist = dir([FilePath '/' list(m).name]);

    for n=3:size(sublist)
        img = imread([FilePath '/' list(m).name '/' sublist(n).name]);
        [height,width,channels] = size(img);
        if isequal(sublist(n).name,'gt.bmp')
            rimg = [img,rimg];
        else
            rimg = [rimg,img];      
            method_name = [method_name,' ',sublist(n).name(1:length(sublist(n).name)-4)];      
        end
    end  
    for i = 2:1:number_method
        img = rimg(1:height,(i-1)*width+1:i*width,1:channels);
        gt = rimg(1:height,1:width,1:channels);
        [PSNR, MSE] = psnr(gt, img);
        score_psnr(m-2,i) = PSNR;
    end
    rimg = [];
    method_name_temp = method_name;
    method_name = '';
end
method_name = method_name_temp(2:length(method_name_temp));
score_psnr_1 = score_psnr(1:number_gt,2:number_method);
disp(score_psnr_1);
score_psnr = zeros(1,number_method-1);
sum=0;
for g=1:1:(number_method-1)
    for h=1:1:number_gt
        sum = sum+score_psnr_1(h,g);
    end 
    score_psnr(1,g) = sum/number_gt;
    sum = 0;
end
disp(score_psnr);
fprintf('method_name=%s',method_name);
method_name = 'CGI CUBIC FCGI LMMSE NARM NEDI RSAI SAI SME';
names = regexp(method_name,'\s','split');
bar(score_psnr,0.5);
set(gca,'XTickLabel','');
set(gca,'YLim',[27 29]);%y轴的数据显示范围
set(gca,'YTick',27:0.4:29);
for i=1:1:length(score_psnr)
    text(i,26.99,names(i),'HorizontalAlignment','right','rotation',45,'fontsize',12);                                   
end
xlabel('The algorithms under evaluation','fontsize',16);
ylabel('PSNR','fontsize',18);
set(gca,'Fontsize',15);
set(gcf,'NumberTitle','off');
set(gcf,'Name','Results');




% 图像峰值信噪比PSNR、均方根误差MSE
function [PSNR, MSE] = psnr(X, Y)
% 计算峰值信噪比PSNR、均方根误差MSE
% 如果输入Y为空，则视为X与其本身来计算PSNR、MSE
[height,width,channel] = size(X);
m1 = double(X);
m2 = double(Y);
if nargin<2
    D = X;
else
    if any(size(X)~=size(Y))
        error('The input size is not equal to each other!');
    end
    D = X-Y;
end
sum = 0.0;
for i=1:1:height
    for j=1:1:width
        sum = sum + (m1(i,j)-m2(i,j))*(m1(i,j)-m2(i,j));
    end
end
MSE = sum/width/height;
PSNR = 10*log10(255^2/MSE);