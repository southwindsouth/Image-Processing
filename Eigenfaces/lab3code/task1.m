clear;
load data_for_labC.mat;
b=0;
flag=0;
for  i=1:1:100
   for j=(i+1):1:100
   b=sum(eignfaces_blk(:,:,i).*eignfaces_blk(:,:,j),'all');
   if(b>1e-05)
       disp('non_orthogonal');
       flag=1;
   end
   %disp(round(b));
    %c=c+round(b);
   end
end
if(flag==0)
    disp('orthogonal');
end
%如果是一组基向量，那么必须满足正交与最小满足条件，一组向量正交的定义，公式，所以，为了方便查看结果，设定阈值为，如果，则，如果，则，设置标志位
%% 
clear;
load data_for_labC.mat;
flag=0;
d=0;
new_eignfaces_blk=eignfaces_blk;
% for  i=1:1:450
%    for j=1:1:300
%判断是否标准正交
   for  i=1:1:100
       b=norm(eignfaces_blk(:,:,i));
       if((b-1)>1e-05)%一个是1为什么不能用，一个是为什么是1e-05
           disp('orthonormal');
           flag=1;
           d=d+1;
           new_eignfaces_blk(:,:,i)=eignfaces_blk(:,:,i)/b;
       end
   end
   disp(d);

%task2
im=imread('find_id.jpg');
weights_of_face=get_face_weights(im,new_eignfaces_blk);
% figure;
% plot(weights_of_face);
% title('The weights of the face image');
% ylabel('Weights');
% xlabel('Number');
% grid on;



%进行正交化,手工复杂计算  
% [m,n]=size(eignfaces_blk(:,:,i));
% a=0;
% for j=1:n
%     for i=1:m
%         a=a+X(i,j)^2;
%     end
%     A(1,j)=sqrt(a);
%     a=0;
% end
% A=repmat(A,m,1);
% Y=X./A



%task3
image=generate_face_from_weights(weights_of_face,new_eignfaces_blk);
figure;
imshow(image);
figure;
subplot(211);
imshow(im);
title('The original image');
subplot(212);
imshow(image);
title('The generating image by the weights');
%disp(psnr(im,image));


