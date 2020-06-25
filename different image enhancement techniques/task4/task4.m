im=imread('lenna512.bmp');
J=im_SP(im);
subplot(231),imshow(im);title('Original');
subplot(232),imshow(J);title('salt&pepper noise')
k1=medfilt2(J); %3¡Á3 template median filtering
k2=medfilt2(J,[5 5]); %5¡Á5 template median filtering
h1=fspecial('average',3);
k3=imfilter(J,h1);%   3¡Á3 template average filtering

subplot(233),imshow(k1);title(['3¡Á3 median',num2str(psnr(k1,im))])
subplot(234),imshow(k2);title(['5¡Á5 median',num2str(psnr(k2,im))])
subplot(235),imshow(k3);title(['3¡Á3 average',num2str(psnr(k3,im))])

a=psnr(k1,im);
disp(a);
b=psnr(k2,im);
disp(b);
c=psnr(k3,im);
disp(c);



