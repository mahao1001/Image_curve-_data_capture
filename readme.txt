%% 图片数据提取并绘制
By：Ma Haohao   eMail：mahao1001@outlook.com

% 只能处理单独的一条曲线，先需要将图片PS处理只留曲线，RGB为黑色（0,0,0）
% 导入本文件夹 A=imread('3.jpg');
% 按照图片中的坐标登记X轴和Y轴的区间
% X轴的区间为：starx -  endx 。这个数值是按照原图曲线最左和最右取值的
% Y轴的区间为：miny - maxy。这个数值是按照原图曲线的最大和最小取值的，因为有可能最左和最右相等就没法缩放了

1. 原始的图片：Original.jpg 含有图框等复杂的信息
2. PS处理后的图片为 Orignal_RGB.jpg
3. 运行主函数：Capture_image_main.m。
需要设置  X轴的区间为：starx -  endx
需要设置 Y轴的区间为：miny - maxy
4. 函数pic2data.m 实现了图片像素点信息提取



