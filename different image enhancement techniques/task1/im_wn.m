function [img_noise] =im_wn(img)

img_noise=double(img)+sqrt(10)*randn(size(img));%using randn function to produce random number

end



