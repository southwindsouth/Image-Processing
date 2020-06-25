function [e,p] = Raster_Scan_DPCM(im)
[r,c] = size(im);        
im_d = double(im);
p = zeros(r, c);
e = zeros(r, c);
 for i = 2:r
   for j = 2:c 
   p(i,j) = (im_d(i,j-1)+im_d(i-1,j-1)+im_d(i-1,j))./3;
   end 
 end
%Calculate difference  
 for i = 1:r
   for j = 1:c
   e(i,j) = im_d(i,j) - p(i,j);
   end
 end
end