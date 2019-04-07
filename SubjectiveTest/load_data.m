clc
clear

FilePath = 'E:/Program files/matlab/R2016a/bin/SubjectiveTest/save';
list = dir(FilePath);


% x = load([FilePath '/' list(5).name]);
% x.final_score
% x.round_score
% x.method_name
% x.image_score
MOS = [];
for n=3:size(list)
    x = load([FilePath '/' list(n).name]);
    MOS = [MOS;x.final_score];
end 

MOS_final_score = ceil(sum(MOS)/(length(list)-2))