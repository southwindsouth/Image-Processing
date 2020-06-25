clc;
image=imread('alphanumeric_templates .bmp');
image_grey=rgb2gray(image);
image_binary=imbinarize(image_grey);
image_binary=~image_binary;
[r,c]=size(image_binary);
% figure;
% imshow(image_binary);


%% 字母表方法1
  se1=cell(36,1);
  se2=cell(36,1);
  se3=cell(36,1);
  k=1;
  se=strel('square',3);
 for i=1:80:c
      for j=1:80:r
          if(((i+80)<512)&&((j+80)<512))                        
              se1{k}=padarray(cut_edge(image_binary(i:i+80,j:j+80)),[5 5]);
              se3{k}=~se1{k};
              se2{k}=imerode(se3{k},se);
              k=k+1;
          end
      end
 end
 
 
%  figure;
%  for n=1:1:36
%      subplot(6,6,n);
%      imshow(se1{n});
%  end 
%  figure;
%  for n=1:1:36
%      subplot(6,6,n);
%      imshow(se2{n});
%  end
%  figure;
%   for n=1:1:36
%      subplot(6,6,n);
%      imshow(se3{n});
% end
%%
%车牌
 image_carplate=imread('car_license_plate.bmp');
 image_carplate=imbinarize(rgb2gray( image_carplate));
 image_carplate=image_carplate(85:134,160:413);
 chepai=image_carplate;
 fanchepai=~chepai;
 
 
%  figure;
%  imshow(image_carplate); 
%  figure;
%  imshow(fanchepai);
 
 

 


%  识别
out1=zeros(1,300);
out2=zeros(1,8); 
k=1;
 for n=1:1:36   
     
      outcome1=bwhitmiss(chepai,se1{n},se2{n});
      [r_1,c_1]=size(outcome1);
      
%       figure;
%       imshow(outcome1);
      
      m=floor(r_1/2);
      o=floor(c_1/2);
      test1=sum(outcome1,'all');   

      if(test1==1)
       [heng1,zong1]=find(outcome1==1);
       out1(1,zong1)=n;
       out2(1,k)=zong1;
       k=k+1;
      end    
 end

 
chepai_jieguo=[];
shunxu=zeros(1,8);
 out3=sort(out2);
 jieguo="";
 alphanumeric_template= ['A', 'B', 'C', 'D', 'E', 'F', ...
                         'G', 'H', 'I', 'J', 'K', 'L', ...
                         'M', 'N', 'O', 'P', 'Q', 'R', ...
                         'S', 'T', 'U', 'V', 'X', 'Y', ...
                         'Z', 'W', '1', '2', '3', '4', ...
                         '5', '6', '7', '8', '9', '0'];  
 for i=1:1:length(out3)
     shunxu(i)=out1(out3(i));
     chepai_jieguo{i}=alphanumeric_template(shunxu(i));
     q=string(chepai_jieguo{i});
     jieguo=strcat(jieguo,q);
     disp(chepai_jieguo{i});
 end

