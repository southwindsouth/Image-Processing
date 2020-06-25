im= imread('C:\Users\xuxun\Desktop\lab2\lab2-material\lenna512.bmp');
g=edge(im,'sobel',[],'both');
subplot(2,2,1);
imshow(g);
title('Sobel算子分割结果');


x=edge(im,'sobel',[],'horizontal');
subplot(2,2,2);
imshow(x);
title('Sobel算子分割结果');


y=edge(im,'sobel',[],'vertical');
subplot(2,2,3);
imshow(y);
title('Sobel算子分割结果');