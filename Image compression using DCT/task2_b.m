im =imread('lenna512.bmp');
quantized_image =quantize(im,25);
figure;
imshow(quantized_image);
title('Quantized DCT image');

