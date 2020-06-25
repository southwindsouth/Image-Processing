% Task2 Car License Plate Recognition (1)
%% binarize the license plate and the alphanumeric template images
im_CLP_original = imread('car_license_plate.bmp');
im_CLP = rgb2gray(im_CLP_original);
im_AT_original = imread('alphanumeric_templates .bmp');
im_AT_reversed = imcomplement(rgb2gray(im_AT_original));
im_CLP_binarized = imbinarize(im_CLP,'adaptive','Sensitivity',0.2);
im_AT_binarized = imbinarize(im_AT_reversed,0.2);
figure(1)
subplot(2,1,1);imshowpair(im_CLP_original,im_CLP_binarized,'montage');title('Car license plate');
subplot(2,1,2);imshowpair(im_AT_original,im_AT_binarized,'montage');title('Alphanumeric templates');
im_AT_binarized = imerode(im_AT_binarized,ones(1,3));
%% edge detection for car license plate
a = sum(im_CLP_binarized);
edge1 = find_edge11(a);
%% edge detection for template
[r,c] = size(im_AT_binarized);
f = @(block_struct)sum(block_struct.data);
sumc(:) = blockproc(im_AT_binarized,[1 c],f);
sumr(:) = blockproc(im_AT_binarized,[r 1],f);
edgec = find_edge22(sumc);
edger = find_edge22(sumr);
edge2 = [edger;edgec];
%% crop the templates
n = 1;
for i = 1:2:11
    for j = 1:2:11
        temp = imcrop(im_AT_binarized,[edge2(1,j),edge2(2,i),edge2(1,j+1)-edge2(1,j),edge2(2,i+1)-edge2(2,i)]);
        vp(n) = libpointer('voidPtr',temp);
        n = n + 1;
    end
end
%% detect symbols
symbols = ['A','B','C','D','E','F',...
           'G','H','I','J','K','L',...
           'M','N','O','P','Q','R',...
           'S','T','U','V','X','Y',...
           'Z','W','1','2','3','4',...
           '5','6','7','8','9','0'];

str(1) = ' ';
n = 1;
for i = 1:36
    test = vp(i).Value;
    temp = imerode(im_CLP_binarized,test);
    s = sum(temp);
    if(sum(s)==1)
        for j = 1:1:512
           if (s(j) == 1)
               break;
           end
        end
        out = check(j,edge1(1,:));
        str(out) = symbols(i);
    end
end
% str = string(str);
disp(str);