%Task1
im = imread('lenna512.bmp','bmp');
%(1)error function
[im_e_DPCM] = Raster_Scan_DPCM(im);
subplot(1,2,1);
imshow(im);title('Original Image');
subplot(1,2,2);
imshow(im_e_DPCM,[]);title('Processed Image');

%(2)Entropy
E_in  = entropy(im)
E_out = entropy(uint8(im_e_DPCM))