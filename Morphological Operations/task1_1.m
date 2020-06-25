f=imread('sawtooth.bmp');

figure;
subplot(1,2,1);
imshow(f);
title('original');

f=im2bw(f);%Image binarization

se=strel('square',10);%选取3*3正方形结构元素
Ie=imerode(f,se);%对原图像进行腐蚀，
boundary=f-Ie;%原图像减去腐蚀结果
subplot(1,2,2);
imshow(boundary);
title('bouadary');