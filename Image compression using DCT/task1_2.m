%calculate the entropy of the original image
im=imread('lenna512.bmp');
outcome1=entropy(im);
disp('original image');
disp(outcome1);

%calculate the entropy of the image reduced the to the half size 
fun = @(block_struct)mean(block_struct.data,'all');
img2= blockproc(im,[2 2],fun);
outcome2=entropy(uint8(img2));
disp('image reduced the to the half size');
disp(outcome2);

%calculate the entropy of the image reduced the gray level of ¡°lenna512.bmp¡± to 16 values 
fun = @(block_struct)block_struct.data/16;
img3= blockproc(im,[1 1],fun);
outcome3=entropy(img3);
disp('image reduced the gray level of ¡°lenna512.bmp¡± to 16 values ');
disp(outcome3);