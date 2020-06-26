%task3
xx=imread('C:\Users\xuxun\Desktop\EEE412-Lab1-xunxu-1926930\EEE412-Lab1-xunxu-1926930\Lab1-Materials\lenna512.bmp');
[r1,c1]=size(xx);
img=im2double(xx);




%(a)Down_Sampling mean value 
for i=1:2:r1;
    for j=1:2:c1;
        if(i>1&&j>1)
            img2(i,j)=(img(i-1,j)+img(i,j+1)+img(i+1,j)+img(i,j-1))/4;
        else
            img2(i,j)=img(i,j);  
        end
        
    end
end

img2=img2(1:2:end,1:2:end);
[r2,c2]=size(img2);
figure;
subplot(121);
imshow(img); 
axis on;
title(['Original','(',num2str(r1),'*',num2str(c1) ,')']);
subplot(122); 
imshow (img2);
axis on;
title(['down-sampling' ,'(',num2str(r2),'*' ,num2str( c2),')']);

%(b) Up-sampling:nearest neighbor interpolation

T=2;
img3=zeros(T*r2,T*c2);


for i=1:r2*T;
    for j=1:c2*T;
        m=ceil(i/T);
        n=ceil(j/T);
        img3(i,j)=img2(m,n);   
    end
end
[r3,c3]=size(img3);
figure;
subplot(1,2,1); 
imshow (img); 
axis on;
title(['down-sampling' ,'(',num2str(r2),'*' ,num2str( c2),')']);
subplot(1,2,2);
imshow(img3);
axis on;
title(['up-sampling','(',num2str(r3),'*',num2str(c3),')']);


img4=imresize(img2,2,'nearest');% bilinear interpolation 
img5=imresize(img2,2,'bicubic' );% bicubic interpolation
[r4,c4]= size(img4);
[r5,c5]= size(img5);


figure;
subplot(1,2,1); 
imshow (img); 
axis on;
title(['down-sampling' ,'(',num2str(r2),'*' ,num2str( c2),')']);
subplot(1,2,2);
imshow(img3);
axis on;
title(['bicubic interpolation','(',num2str(r5),'*',num2str(c5),')']);


figure;
subplot(1,2,1); 
imshow (img); 
axis on;
title(['down-sampling' ,'(',num2str(r2),'*' ,num2str( c2),')']);
subplot(1,2,2);
imshow(img3);
axis on;
title(['bilinear interpolation ','(',num2str(r4),'*',num2str(c4),')']);



 psnr1=problem2m( img , img3 );%
 psnr2=problem2m( img , img4 );%
 psnr3=problem2m( img , img5 );%

disp(psnr1);
disp(psnr2);
disp(psnr3);







