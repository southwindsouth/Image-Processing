%Task2_1
function[im_64]=DCT2(im)
[r, c] = size(im);
im_64 = zeros(64,64);
im_dct2 = zeros(r,c);
for i=1:8:r
    for j=1:8:c
    im_64 =dct2(im(i:i+7,j:j+7));
    im_dct2(i,j)=im_64(1,1);
    end
end
%Recommbination
for i=1:64
    for j=1:64
    im_64(i,j)=im_dct2(8*i-7,8*j-7);
    end
end

end
