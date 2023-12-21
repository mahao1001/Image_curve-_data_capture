%% 图片数据提取并绘制 By：Ma Haohao   eMail：mahao1001@outlook.com
% 只能处理单独的一条曲线，先需要将图片PS处理只留曲线，RGB为黑色（0,0,0）
% 导入本文件夹 A=imread('3.jpg');
% 按照图片中的坐标登记X轴和Y轴的区间
% X轴的区间为：starx -  endx 。这个数值是按照原图曲线最左和最右取值的
% Y轴的区间为：miny - maxy。这个数值是按照原图曲线的最大和最小取值的，因为有可能最左和最右相等就没法缩放了
%%
clear;clc
close all;

A=imread('Orignal_RGB.jpg');    % 导入曲线的图片是由PS处理成黑色，RGB(0,0,0)
starx = 0;            % 设置X轴的最左的值
endx = 100;           % 设置X轴的最右的值
miny = 0;             % 设置Y轴的最小的值
maxy = 8.5;           % 设置Y轴的最大的值

data=pic2data(A,starx,endx);  % 图片RGB获取到数据A转化为两列数值
X = data(:,1)';               % 数值第一列是X轴的值已经按照starx-endx缩放
Y = data(:,2)';               % 数值第二列是Y轴的值

k =(maxy-miny) / (max(Y)-min(Y)) ;  % Y轴的值缩放比率 要求的值差/获取的值差
Y = Y.*k - (min(Y)-miny);           % Y轴的值缩放，移动到最小值重合

figure;                       % 绘制结果
plot(X,Y,LineWidth=1.5);
xlim([X(1),X(end)]);          % X轴固定区间
% ylim([miny,maxy]);          % Y轴固定区间，大多数不需要
box on;                       % 图片边框开关 on off
title('Image curve data capture and redraw');         % 图标题
xlabel('Time (ms)');          % X轴标尺
ylabel('Velocity (m/s)');     % Y轴标尺
legend('Vehicle collision sensor curve');    % 解释曲线