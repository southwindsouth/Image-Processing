f=imread('sawtooth.bmp');

figure;
subplot(1,2,1);
imshow(f);
title('original');

f=im2bw(f);%Image binarization

se=strel('square',10);%ѡȡ3*3�����νṹԪ��
Ie=imerode(f,se);%��ԭͼ����и�ʴ��
boundary=f-Ie;%ԭͼ���ȥ��ʴ���
subplot(1,2,2);
imshow(boundary);
title('bouadary');