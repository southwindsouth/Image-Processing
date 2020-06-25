
im= imread('lenna512.bmp');

im_sum=im_wn(im);
k=10;
for i=2:k
    im_k=im_wn(im);
    im_sum=double(im_sum)+im_k;
end
im_ave=im_sum/k;
im_wn10=im_ave;

im_sum=im_wn(im);
k=100;
for i=2:k
    im_k=im_wn(im);
    im_sum=double(im_sum)+im_k;
end
im_ave=im_sum/k;
im_wn100=im_ave;


im_sum=im_wn(im);
k=1000;
for i=2:k
    im_k=im_wn(im);
    im_sum=double(im_sum)+im_k;
end
im_ave=im_sum/k;
im_wn1000=im_ave;


disp(psnr(uint8(im_wn10),im));
disp(psnr(uint8(im_wn100),im));
disp(psnr(uint8(im_wn1000),im));


figure;
subplot(141);
imshow(im,[]); 
title('Original');
axis on;
subplot(142); 
imshow(im_wn10,[]);
title('imwn10');
axis on;
subplot(143);
imshow(im_wn100,[]); 
title('imwn100');
axis on;
subplot(144); 
imshow(im_wn1000,[]);
title('imwn1000');
axis on;


