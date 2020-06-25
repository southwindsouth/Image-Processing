image=imread('sawtooth.bmp');

figure;
subplot(2,2,1);
imshow(image);
title('original');

image=im2bw(image);%Image binarization

se=strel('disk',10);


% open_im1=imopen(image,se); 
% subplot(2,2,2);
% imshow(open_im1);
% title('open1');
% open_im2=imopen(open_im1,se); 
% subplot(2,2,3);
% imshow(open_im2);
% title('open2');
% open_im3=imopen(open_im2,se); 
% subplot(2,2,4);
% imshow(open_im3);
% title('open3');

in=image;
for i=1:1:10

out=imopen(in,se); 
figure;
%suplot(2 5 i);
imshow(out);
title('open1');
in=out;

end