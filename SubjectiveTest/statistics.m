clc
clear
number_method = 10;


list = dir('save/');
size_list = length(list);
fprintf('size_list=%d\n',size_list);
score_all = [];
for n=3:length(list)
    ex = importdata(['save/' list(n).name]);
    score_all = [score_all;ex.data];
    method_name = ex.textdata;
end
disp(score_all);
score_all = score_all(1:(size_list-2),2:number_method);
score = zeros(1,number_method-1);
sum=0;
for g=1:1:(number_method-1)
    for h=1:1:(size_list-2)
        sum = sum+score_all(h,g);
    end 
    score(1,g) = sum/(size_list-2);
    sum = 0;
end
disp(score);
% names = regexp(method_name,'\s','split');
% name = names(2:number_method);
name = 'CGI CUBIC FCGI LMMSE NARM NEDI RSAI SAI SME';
names = regexp(name,'\s','split');
bar(score,0.5);
set(gca,'XTickLabel','');
set(gca,'YLim',[10 20]);%y轴的数据显示范围
set(gca,'YTick',10:2:20);
for i=1:1:length(score)
    text(i,9.8,names(i),'HorizontalAlignment','right','rotation',45,'fontsize',12);                                   
end
xlabel('The algorithms under evaluation','fontsize',16);
ylabel('MOSs','fontsize',18);
set(gca,'Fontsize',15);
set(gcf,'NumberTitle','off');
set(gcf,'Name','Results');