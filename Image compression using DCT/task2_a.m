im = imread('lenna512.bmp','bmp');
ims = DCT2(im);
subplot(121);
imshow(im);
title('Original Image 512*512');
subplot(122);
% imshow(ims,[]);
imshow(ims,[]);
title('Compressed image 64*64');



% Q��Ϊʲôimshow(g,[])����������ʾ����imshow(g)ȴ��ʾ�հ�ͼ��
% A���������������double��imshow�Ĵ���Χ��0-1
% �������������uint8��imshow�Ĵ���Χ��0-255
%   
% ���������0-255�ģ���������double��ֱ��imshow��Ѵ���1�Ķ�����1������һƬ����
% �������
% 1 imshow(uint8(img));
% 2 imshow(img, []);
%   
% ע��ͼ�����ʱ����double���ʹ������ᶪʧ���ȣ���ʾ��ʱ����uint8
% 
% imshow(K)ֱ����ʾK��
% imshow(K,[])��ʾK������K�����ֵ����Сֵ�ֱ���Ϊ����(255)�ʹ���(0)���м��Kֵӳ��Ϊ0��255֮��ı�׼�Ҷ�ֵ