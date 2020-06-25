image=imread('alphanumeric_templates .bmp');
image_grey=rgb2gray(image);
image_binary=imbinarize(image_grey);
image_binary=~image_binary;


[r,c]=size(image_binary);
% figure;
% imshow(image_binary);


%% 字母表方法1
  temp1=cell(36,1);
  temp2=cell(36,1);
  se1=cell(36,1);
  se2=cell(36,1);
  k=1;
 for i=1:80:c
      for j=1:80:r
          if(((i+80)<512)&&((j+80)<512))
                        
              se1{k}=padarray(cut_edge(image_binary(i:i+80,j:j+80)),[1 1]);
              se2{k}=~se1{k};
%           se1{k}=cut_edge(image_binary(i:i+80,j:j+80));
%           se2{k}=~padarray(se1{k},[1 1]);
          k=k+1;
          end
      end
 end
 
 
 figure;
 for n=1:1:36
     subplot(6,6,n);
     imshow(se1{n});
 end 
 figure;
 for n=1:1:36
     subplot(6,6,n);
     imshow(se2{n});
 end
 
 
%se=a;

%% 字母表方法2
%  [r,c] = size(image_binary);
% f = @(block_struct)sum(block_struct.data);
% sumc(:) = blockproc(image_binary,[1 c],f);
% sumr(:) = blockproc(image_binary,[r 1],f);
% edgec = find_edge22(sumc);
% edger = find_edge22(sumr);
% edge2 = [edger;edgec];
% n = 1;
% se1=cell(36,1);
% se2=cell(36,1);
% for i = 1:2:11
%     for j = 1:2:11
%         temp = imcrop(image_binary,[edge2(1,j),edge2(2,i),edge2(1,j+1)-edge2(1,j),edge2(2,i+1)-edge2(2,i)]);
%         %vp(n) = libpointer('voidPtr',temp);
%         se1{n}=temp;
%         se2{n}=~temp;
%         n = n + 1;
%     end
% end
% figure;
%  for n=1:1:36
%      subplot(6,6,n);
%      %imshow(vp(n).Value);
%      imshow(se1{n});
%  end 
%  figure;
%  for n=1:1:36
%      subplot(6,6,n);
%      %imshow(vp(n).Value);
%      imshow(se2{n});
%  end 

%%
%车牌
 image_carplate=imread('car_license_plate.bmp');
 image_carplate=imbinarize(rgb2gray( image_carplate));
 image_carplate=image_carplate(85:134,160:413);
 chepai=image_carplate;
 
 figure;
 imshow(image_carplate); 
 fanchepai=~chepai;
  figure;
 imshow(fanchepai);

 
 
%   b=cell(8,1);
%   b_rev=cell(8,1);
% b{1}=image_carplate(30:80,32:58);
% b{2}=image_carplate(30:80,62:89);
% b{3}=image_carplate(30:80,95:120);
% b{4}=image_carplate(30:80,122:132);
% b{5}=image_carplate(30:80,139:172);
% b{6}=image_carplate(30:80,177:206);
% b{7}=image_carplate(30:80,211:239);
% b{8}=image_carplate(30:85,240:297);

% b{1}=image_carplate(30:80,32:58);
% b{2}=image_carplate(30:80,62:89);
% b{3}=image_carplate(30:80,95:120);
% b{4}=image_carplate(30:80,122:132);
% b{5}=image_carplate(30:80,139:172);
% b{6}=image_carplate(30:80,177:206);
% b{7}=image_carplate(30:80,211:239);
% b{8}=image_carplate(30:85,240:297);
%  
% b_rev{1}=~image_carplate(30:80,32:58);
% b_rev{2}=~image_carplate(30:80,62:89);
% b_rev{3}=~image_carplate(30:80,95:120);
% b_rev{4}=~image_carplate(30:80,122:132);
% b_rev{5}=~image_carplate(30:80,139:172);
% b_rev{6}=~image_carplate(30:80,177:206);
% b_rev{7}=~image_carplate(30:80,211:239);
% b_rev{8}=~image_carplate(30:85,240:297); 
%  figure;
%  for n=1:1:8
%      subplot(2,4,n);
%      imshow(b{n});
%  end
%  
%  figure;
%  for n=1:1:8
%      subplot(2,4,n);
%      imshow(b_rev{n});
%  end 







%  识别
out1=zeros(1,300);
out2=zeros(1,8);
%for i=1:1:8
 %  i=1;
     %b_rev{i} = padarray(b_rev{i},[1 1],'replicate','both');
% figure;
% imshow( b_rev{i});
   count=0;
   k=1;
% disp('i=');disp(i);     
 for n=1:1:36   
     
      outcome1=imerode(chepai,se1{n});
      [r_1,c_1]=size(outcome1);
      m=floor(r_1/2);
      o=floor(c_1/2);
      test1=sum(outcome1(20:30,:),'all');   
      
      if(test1==1)
      [heng1,zong1]=find(outcome1(20:40,:)==1);
       out1(1,zong1)=n;
       out2(1,k)=zong1;
       k=k+1;
      end
      
%       figure;
%       imshow(outcome1);

       
      outcome2=imerode(fanchepai,se2{n}) ;
%       figure;
%       imshow(outcome2);
      [r_2,c_2]=size(outcome2);
       p=floor(r_2/2);
       q=floor(c_2/2);         
       %test2=sum(outcome2(p-20:p+20,q-20:q+20),'all');
       %test2=sum(outcome2,'all');
       
       if(test1>1)
         outcome=outcome1&outcome2;
         [heng2,zong2]=find(outcome(20:40,:)==1);
          out1(1,zong2)=n;
          out2(1,k)=zong2;
          k=k+1;
       end

     
 end

%chepai_jieguo=cell(1,8);
chepai_jieguo=[];
shunxu=zeros(1,8);
% alphanumeric_template= ["A", "B", "C", "D", "E", "F", ...
%                          "G", "H", "I", "J", "K", "L", ...
%                          "M", "N", "O", "P", "Q", "R", ...
%                          "S", "T", "U", "V", "X", "Y", ...
%                          "Z", "W", "1", "2", "3", "4", ...
%                          "5", "6", "7", "8", "9", "0"];  
alphanumeric_template= ['A', 'B', 'C', 'D', 'E', 'F', ...
                         'G', 'H', 'I', 'J', 'K', 'L', ...
                         'M', 'N', 'O', 'P', 'Q', 'R', ...
                         'S', 'T', 'U', 'V', 'X', 'Y', ...
                         'Z', 'W', '1', '2', '3', '4', ...
                         '5', '6', '7', '8', '9', '0'];  
 out3=sort(out2);
 
 jieguo="";
 for i=1:1:length(out3)
     shunxu(i)=out1(out3(i));
     chepai_jieguo{i}=alphanumeric_template(shunxu(i));
     q=string(chepai_jieguo{i});
     jieguo=strcat(jieguo,q);
     disp(chepai_jieguo{i});
 end
 disp(shunxu);
 disp('识别结果为：');disp(chepai_jieguo);
 pp=string(chepai_jieguo);
 disp(jieguo);
%end