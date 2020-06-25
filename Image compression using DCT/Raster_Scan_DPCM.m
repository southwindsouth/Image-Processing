function [e,p] = Raster_Scan_DPCM(image)
%use the same value as its neighbor to pad the left and up side of the image
im= padarray(image,[1 1],'replicate','pre');
[r,c] = size(im);        
im_d = double(im);
p=zeros(r-1, c-1);
e=zeros(r-1, c-1);
%Calculate the predicted value
p=(2*im_d(2:r,1:(c-1))+im_d(1:(r-1),1:(c-1))+2*im_d(1:(r-1),2:c))/5;
%Calculate difference  
e = double(image)- p;
end
