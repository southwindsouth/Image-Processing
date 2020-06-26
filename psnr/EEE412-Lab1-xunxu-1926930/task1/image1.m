a=imread('C:\Users\xuxun\Desktop\EEE412-Lab1-xunxu-1926930\EEE412-Lab1-xunxu-1926930\Lab1-Materials\lenna512color.bmp');
figure;
image(a);

rgb = im2double(a);
r = a(:, :, 1);
g = a(:, :, 2);
b = a(:, :, 3);
z=zeros(512,512);
m=cat(3,r,z,z);
n=cat(3,z,g,z);
p=cat(3,z,z,b);
 
figure;
imshow(m);
figure;
imshow(n);
figure;
imshow(p);



% % c=rgb2hsi(a);
% % figure;
% % imshow(c);
% 
[hsi,H,S,I ] = rgb2hsi(a);
figure;
imshow(hsi);
figure;
imshow(H);
figure;
imshow(S);
figure;
imshow(I);



greyimg=rgb2gray(a);
figure;
imshow(greyimg);
imwrite(greyimg,'C:\Users\xuxun\Desktop\image\Lab1-Materials\mm.bmp','bmp');


binary_img = im2bw(a,0.5);
figure;
imshow(binary_img);
 


