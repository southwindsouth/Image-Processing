%Task1_3
im = imread('lenna512.bmp','bmp');
%error function
[im_DPCM,k] = Raster_Scan_DPCM(im);
subplot(1,2,1);
imshow(im);title('Original Image');
subplot(1,2,2);
imshow(im_DPCM,[]);title('DPCM Image');
%Entropy
outcome1=entropy(im);
outcome2=entropy(uint8(im_DPCM));
disp(outcome1);
disp(outcome2);