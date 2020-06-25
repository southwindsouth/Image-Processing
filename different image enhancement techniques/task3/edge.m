clear;
im=imread('lenna512.bmp');
grayimage=mat2gray(im);
[m,n]=size(grayimage);

newgrayimage=grayimage;
sobelNum=0;
sobelThreshold=0.7;
for j=2:m-1
    for k=2:n-1
        sobelNum=abs(grayimage(j-1,k-1)+2*grayimage(j-1,k)+grayimage(j-1,k+1)-grayimage(j+1,k-1)-2*grayimage(j+1,k)-grayimage(j+1,k+1));
        if(sobelNum > sobelThreshold)
            newgrayimage(j,k)=255;
        else
            newgrayimage(j,k)=0;
        end
    end
end
figure;
imshow(newgrayimage);
title('horizontal edges');

newgrayimage=grayimage;
sobelNum=0;
sobelThreshold=0.7;
for j=2:m-1
    for k=2:n-1
        sobelNum=abs(grayimage(j-1,k+1)+2*grayimage(j,k+1)+grayimage(j+1,k+1)-grayimage(j-1,k-1)-2*grayimage(j,k-1)-grayimage(j+1,k-1));
        if(sobelNum > sobelThreshold)
            newgrayimage(j,k)=255;
        else
            newgrayimage(j,k)=0;
        end
    end
end
figure;
imshow(newgrayimage);
title('vertical edges');

newgrayimage=grayimage;
sobelNum=0;
sobelThreshold=0.7;
for j=2:m-1
    for k=2:n-1
        sobelNum=abs(grayimage(j-1,k+1)+2*grayimage(j,k+1)+grayimage(j+1,k+1)-grayimage(j-1,k-1)-2*grayimage(j,k-1)-grayimage(j+1,k-1))+abs(grayimage(j-1,k-1)+2*grayimage(j-1,k)+grayimage(j-1,k+1)-grayimage(j+1,k-1)-2*grayimage(j+1,k)-grayimage(j+1,k+1));
        if(sobelNum > sobelThreshold)
            newgrayimage(j,k)=255;
        else
            newgrayimage(j,k)=0;
        end
    end
end
figure;
imshow(newgrayimage);
title('all edges ');