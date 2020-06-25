%task5
clear;
im=imread('find_id.jpg');
load data_for_labC.mat;
percentage=[0.1  0.53];
% for i=1:1:5
% noiseimage=imnoise(im,'salt & pepper',percentage(i));
% ID2(i)= get_employees_ID_from_DB (noiseimage,employees_DB,eignfaces_blk);
% end
% disp(ID2);
noiseimage=imnoise(im,'salt & pepper',percentage(1));
ID= get_employees_ID_from_DB (noiseimage,employees_DB,eignfaces_blk);
disp(ID);
noiseimage=imnoise(im,'salt & pepper',percentage(2));
ID= get_employees_ID_from_DB (noiseimage,employees_DB,eignfaces_blk);
disp(ID);
% noiseimage=imnoise(im,'salt & pepper',percentage(3));
% ID= get_employees_ID_from_DB (noiseimage,employees_DB,eignfaces_blk);
% disp(ID);
% noiseimage=imnoise(im,'salt & pepper',percentage(4));
% ID= get_employees_ID_from_DB (noiseimage,employees_DB,eignfaces_blk);
% disp(ID);
% noiseimage=imnoise(im,'salt & pepper',percentage(5));
% ID= get_employees_ID_from_DB (noiseimage,employees_DB,eignfaces_blk);
% disp(ID);

[ r , c]= size (im);
imoccluded=zeros (r , c );
imoccluded=double ( imoccluded ); 
imoriginal=double ( im );
imoccluded=[ im([1:150],:);imoccluded([151:220],:);im([221:450],:)];
ID3= get_employees_ID_from_DB (imoccluded,employees_DB,eignfaces_blk);
disp(ID3);


subplot (131);imshow(imnoise(im,'salt & pepper',percentage(1))); title (  'image'  ); 
subplot (132);imshow(imnoise(im,'salt & pepper',percentage(2))); title (' image ' );
subplot (133);imshow(imoccluded );title (' image ' );
%new task5

