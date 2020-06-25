image=imread('alphanumeric_templates .bmp');
image_grey=rgb2gray(image);
image_binary=imbinarize(image_grey);
image_binary=~image_binary;

[r,c] = size(image_binary);
f = @(block_struct)sum(block_struct.data);
sumc(:) = blockproc(image_binary,[1 c],f);
sumr(:) = blockproc(image_binary,[r 1],f);
edgec = find_edge22(sumc);
edger = find_edge22(sumr);
edge2 = [edger;edgec];
n = 1;
a=cell(36,1);
for i = 1:2:11
    for j = 1:2:11
        temp = imcrop(image_binary,[edge2(1,j),edge2(2,i),edge2(1,j+1)-edge2(1,j),edge2(2,i+1)-edge2(2,i)]);
        %vp(n) = libpointer('voidPtr',temp);
        a{n}=temp;
        n = n + 1;
    end
end
 for n=1:1:36
     subplot(6,6,n);
     %imshow(vp(n).Value);
     imshow(a{n});
 end 
