im= imread('C:\Users\xuxun\Desktop\lab2\lab2-material\lenna512.bmp');
g=edge(im,'sobel',[],'both');
subplot(2,2,1);
imshow(g);
title('Sobel���ӷָ���');


x=edge(im,'sobel',[],'horizontal');
subplot(2,2,2);
imshow(x);
title('Sobel���ӷָ���');


y=edge(im,'sobel',[],'vertical');
subplot(2,2,3);
imshow(y);
title('Sobel���ӷָ���');