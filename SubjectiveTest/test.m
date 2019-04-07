clc
clear

global image_score;
global method_name;
global final_score;
global round_score;
image_score_1 = round(rand(16,1)*1)+3;
image_score_2 = round(rand(16,1)*1)+3;
image_score_3 = round(rand(16,1)*1)+3;
image_score_4 = round(rand(16,1)*1)+3;
image_score_5 = round(rand(16,1)*1)+3;
image_score_6 = round(rand(16,1)*1)+3;
image_score_7 = round(rand(16,1)*1)+3;
image_score_8 = round(rand(16,1)*1)+3;
% image_score_1 = ones(16,1)*4;
% image_score_2 = ones(16,1)*4;
% image_score_3 = ones(16,1)*4;
% image_score_4 = ones(16,1)*4;
% image_score_5 = ones(16,1)*4;
% image_score_6 = ones(16,1)*4;
% image_score_7 = ones(16,1)*4;
% image_score_8 = ones(16,1)*4;
method_name = 'cgi cubic fcgi lmmse narm rsai sai sme';
image_score = [image_score_1 image_score_2 image_score_3 image_score_4 image_score_5 image_score_6 image_score_7 image_score_8];

round_score = [sum(image_score(1:8,:));sum(image_score(9:16,:))];

final_score = ceil(sum(image_score)/2);

path = [num2str(year(now)),'-',num2str(month(now)),'-',num2str(day(now)),' ',num2str(hour(now)),'-',num2str(minute(now)),'-',num2str(floor(second(now)))];
save(['save/' path '.mat'],'final_score','round_score','method_name','image_score');

% global image_score;
% global method_name;
% global final_score;
% global round_score;
% image_score_1 = round(rand(16,1)*1)+4;
% image_score_2 = round(rand(16,1)*1)+4;
% image_score_3 = round(rand(16,1)*1)+4;
% image_score_4 = round(rand(16,1)*1)+4;
% image_score_5 = round(rand(16,1)*1)+4;
% image_score_6 = round(rand(16,1)*1)+4;
% image_score_7 = round(rand(16,1)*1)+4;
% image_score_8 = round(rand(16,1)*1)+4;
% method_name = 'cgi cubic fcgi lmmse narm rsai sai sme';
% image_score = [image_score_1 image_score_2 image_score_3 image_score_4 image_score_5 image_score_6 image_score_7 image_score_8];
% image_score
% round_score = [sum(image_score(1:8,:));sum(image_score(9:16,:))];
% 
% final_score = ceil(sum(image_score)/2);
% 
% path = [num2str(year(now)),'-',num2str(month(now)),'-',num2str(day(now)),' ',num2str(hour(now)),'-',num2str(minute(now)),'-',num2str(floor(second(now)))];
% save(['save/' path '_outlier.mat'],'final_score','round_score','method_name','image_score');