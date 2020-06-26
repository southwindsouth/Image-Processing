xx=imread('C:\Users\xuxun\Desktop\EEE412-Lab1-xunxu-1926930\EEE412-Lab1-xunxu-1926930\Lab1-Materials\lenna512.bmp');

x1=im2double(xx);
figure(1);
subplot(2,2,1);
imshow(x1);
title('512*512');
x2=x1(1:4:end,1:4:end);
subplot(2,2,2);
imshow(x2);
title('128*128');
x3=histeq(x2,16);
subplot(2,2,3);
imshow(x3);
title('16*16');