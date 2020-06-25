im= imread('lenna512.bmp');

img_noise1=im_wn(im);
figure;
subplot(121);
imshow(im,[]); 
title('Original');
axis on;
subplot(122); 
imshow(img_noise1,[]);
title('Gaussian white noise noise');
axis on;

%Check if the properties of the noise are reasonable
noise = img_noise1 - double(im);
std=std2(noise)    ;        % Standard deviation
mean=mean2(noise)  ;        % Mean of two-dimensional array
disp(std*std);
disp(mean);

img_noise2=im_SP(im);
figure;
subplot(121);
imshow(im,[]); 
title('Original');
axis on;
subplot(122); 
imshow(img_noise2,[]);
title('salt&pepper noise');
axis on;


b=uint8(img_noise1);
disp(psnr(b,im));

c=uint8(img_noise2);
disp(psnr(c,im));


im_low= imread('lenna512_low_dynamic_range.bmp');
d=uint8(im_low);
disp(psnr(d,im));



figure;
subplot(411);
%imshow(im,[]); 
histogram(im);
title('Original');
axis on;
subplot(412); 
%imshow(img_noise1,[]);
histogram(img_noise1);
title('Gaussian white noise noise');
axis on;
subplot(413); 
%imshow(img_noise2,[]);
histogram(img_noise2);
title('salt&pepper noise');
axis on;
subplot(414); 
%imshow(im_low,[]);
histogram(im_low);
title('low dynamic range');
axis on;