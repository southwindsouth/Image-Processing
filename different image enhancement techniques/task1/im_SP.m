function [ image ] =  im_SP( image )

[width,height,z]=size(image);
if(z>1)
    image=rgb2gray(image);%if it is not a grey image,then transform it
end
k1=0.1;%Set the ratio of the random number
k2=0.1;
a1=rand(width,height)<k1;%Generate a random number for the ordinate
a2=rand(width,height)<k2;%Generate random numbers for the abscissa
image(a1&a2)=0;
image(a1& ~a2)=255;
subplot(1,2,2);
end

