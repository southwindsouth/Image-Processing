%Task2_1
function[img_DCT]=DCT2(im)
fun = @(block_struct)dct2(block_struct.data);
imgDCT2= blockproc(im,[8 8],fun);
fun = @(block_struct)block_struct.data(1,1);
img_DCT= blockproc(imgDCT2,[8 8],fun);
end

