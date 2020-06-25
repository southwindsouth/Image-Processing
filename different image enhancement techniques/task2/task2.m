im=imread('lenna512_low_dynamic_range.bmp'); 
im1=imread('lenna512.bmp');

figure;
out1=linear_mapping_transform(im,0.05,0.05,0.95,0.95);
subplot(3,2,1);
imshow(out1,[]);
disp(psnr(out1,im2double(im1)));
title(['psnr=',num2str(psnr(out1,im2double(im1)))]);

out2=linear_mapping_transform(im,0.3,0.15,0.7,0.83);
subplot(3,2,2);
imshow(out2,[]);
disp(psnr(out2,im2double(im1)));
title(['psnr=',num2str(psnr(out2,im2double(im1)))]);

out3=linear_mapping_transform(im,0.1,0.15,0.85,0.95);
subplot(3,2,3);
imshow(out3,[]);
disp(psnr(out3,im2double(im1)));
title(['psnr=',num2str(psnr(out3,im2double(im1)))]);

out4=linear_mapping_transform(im,0.3,0.7,0.4,0.75);
subplot(3,2,4);
imshow(out4,[]);
disp(psnr(out4,im2double(im1)));
title(['psnr=',num2str(psnr(out4,im2double(im1)))]);

out5=linear_mapping_transform(im,0.3,0.8,0.8,0.85);
subplot(3,2,5);
imshow(out5,[]);
disp(psnr(out5,im2double(im1)));
title(['psnr=',num2str(psnr(out5,im2double(im1)))]);


figure;
histeq(im);
subplot(1,2,1);
imshow(out2);
title(['psnr=',num2str(psnr(out2,im2double(im1)))]);
subplot(1,2,2);
imshow(b);
title(['psnr=',num2str(psnr(histeq(im),im1))]);