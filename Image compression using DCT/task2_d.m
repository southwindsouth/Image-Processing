%Task2_3_4
im = imread('lenna512.bmp');
QP = 20;
quan_result = quantize(im,QP);
imdecompress = decompress(quan_result,QP);
PSNR = psnr(im,uint8(imdecompress));
PSNR_i=zeros(1,8);
j=1;
for QP = 1:14:99
    quan_result = quantize(im,QP);
    imdecompress = decompress(quan_result,QP);
    PSNR_i(j) = psnr(im,uint8(imdecompress));
    j=j+1;
end
PSNR_out=PSNR_i;
disp(PSNR_out);

