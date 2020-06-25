image=imread('sawtooth.bmp');

figure;
subplot(2,2,1);
imshow(image);
title('original');

image=im2bw(image);%Image binarization

se=strel('disk',40);

erode_im=imerode(image,se);
dilate_im=imdilate(image,se);
open_im=imopen(image,se); 
close_im=imclose(image,se);


figure;
subplot(2,2,1);
imshow(erode_im);
subplot(2,2,2);
imshow(dilate_im);
subplot(2,2,3);
imshow(open_im);
subplot(2,2,4);
imshow(close_im);


num_erode=length(find(erode_im==1));
disp(num_erode);
num_dilate=length(find(dilate_im==1));
disp(num_dilate);
num_open=length(find(open_im==1));
disp(num_open);
num_close=length(find(close_im==1));
disp(num_close);