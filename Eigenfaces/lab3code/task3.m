clear;

% load data_for_labC.mat;
% flag=0;
% d=0;
% new_eignfaces_blk=eignfaces_blk;

%判断是否标准正交
%    for  i=1:1:100
%        b=norm(eignfaces_blk(:,:,i));
%        if((b-1)>1e-05)%一个是1为什么不能用，一个是为什么是1e-05
%            disp('orthonormal');
%            flag=1;
%            d=d+1;
%            new_eignfaces_blk(:,:,i)=eignfaces_blk(:,:,i)/b;
%        end
%    end

im=imread('find_id.jpg');
load data_for_labC.mat;

weights_of_face=get_face_weights(im,eignfaces_blk);
imre= generate_face_from_weights(weights_of_face,eignfaces_blk);

figure;
subplot(121);
imshow(im);
title('The original image');
subplot(122);
imshow(imre);
title('The reconstruction image by the weights');
disp(psnr(im,imre));

%使用基向量还原后的人脸很黑，标准化后的基的还原人脸直接全黑