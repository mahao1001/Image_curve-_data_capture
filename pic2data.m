function data=pic2data(A,stary,endy)
% # *************************作者信息********************************
% #                       Ma Haohao                                *
% #                       TSNU,Tianshui,China                      *
% #          mahao1001@outlook.com / mahao1001@tsnu.edu.cn         *
% #*****************************************************************
%*******************************************************************                                                          
%在研究中，有时候需要的数据无法根据图片所提供的地址获得，因此我们不得不暴力*
%地将图片数据提取出来，本程序可以从图片曲线中近似地提取数据，再根据适当的坐*
%标比例转换，近似得到原序列数据。
%%
%图片准备
yearlength=endy-stary+1;
thresh1=graythresh(A);
tu2 = im2bw(A,thresh1); %建议不要使用imbinarize
[n,m]=size(tu2);
datan=zeros();
%提取图片值
for i=1:m
    for j=1:n
        if tu2(j,i)==0
            datan(i,1)=n-j;
             break;
        end
    end 
end
tg=length(datan)/yearlength;
timeN=zeros();
%横向采样
for i=1:length(datan)
        timeN(i,1)=round(i*tg);
end
time=timeN(1:yearlength);
data1=datan(time);
year=stary:1:endy;
%结果输出
data=[year' data1];