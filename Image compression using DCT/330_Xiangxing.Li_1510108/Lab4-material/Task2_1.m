im = imread('lenna512.bmp','bmp');
ims = DCT2_8x8(im);
subplot(121);
imshow(im);
title('Original Image 512*512')
subplot(122);
imshow(ims,[]);
title('Compressed image 64*64')