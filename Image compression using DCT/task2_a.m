im = imread('lenna512.bmp','bmp');
ims = DCT2(im);
subplot(121);
imshow(im);
title('Original Image 512*512');
subplot(122);
% imshow(ims,[]);
imshow(ims,[]);
title('Compressed image 64*64');



% Q：为什么imshow(g,[])可以正常显示，而imshow(g)却显示空白图像？
% A：数据类型如果是double，imshow的处理范围是0-1
% 数据类型如果是uint8，imshow的处理范围是0-255
%   
% 如果数据是0-255的，类型又是double，直接imshow会把大于1的都当成1，就是一片白了
% 解决方法
% 1 imshow(uint8(img));
% 2 imshow(img, []);
%   
% 注：图像处理的时候用double类型处理，不会丢失精度，显示的时候用uint8
% 
% imshow(K)直接显示K；
% imshow(K,[])显示K，并将K的最大值和最小值分别作为纯白(255)和纯黑(0)，中间的K值映射为0到255之间的标准灰度值