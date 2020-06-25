function [quan]= quantize(im,QP)
[r, c] = size(im);
%Write Q matrix
Q=[16 11 10 16 24 40 51 61;
  12 12 14 19 26 58 60 55;
  14 13 16 24 40 57 69 56;
  14 17 22 29 51 87 80 62;
  18 22 37 56 68 109 103 77;
  24 35 55 64 81 104 113 92;
  49 64 78 87 103 121 120 101;
  72 92 95 98 112 100 103 99;];
%Decide S value according to QP
 if (QP>50)
     S= (100-QP)/50;
 elseif (QP<=50)
     S= 50/QP;   
 end
 %Get quantized result 
 for i=1:8:r
    for j=1:8:c
        im64 = dct2(im(i:i+7,j:j+7));
        ims = round(im64./(S*Q));
        quan(i:i+7,j:j+7) = ims;
    end 
 end 
quan;
end