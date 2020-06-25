%Task2_3_4
im = imread('lenna512.bmp');
QP = 30;
quan_result = quan(im,QP);
imo = decompress(quan_result,QP);
PSNR = psnr(im,uint8(imo));
PSNR_i=zeros(1,8);
j=1;

for QP_i = 1:14:99
    quan_result = quan(im,QP_i);
    imo = decompress(quan_result,QP_i);
    PSNR_i(j) = psnr(im,uint8(imo));
    j=j+1;
end
SNR_ouput=PSNR_i

figure(1)
subplot(1,2,1);imshow(im);title('0riginal Image');
subplot(1,2,2);imshow(imo,[]);title('Processed Image');