im =imread('lenna512.bmp');
quantized_image =quan(im,30);
figure(1)
imshow(quantized_image);
title('Quantized DCT image');