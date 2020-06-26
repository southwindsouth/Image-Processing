%Task2
function [PSNR]=problem2m (im1,im2)
im1=im2double ( im1 ) ;
im2=im2double ( im2 ) ;
[ r1 , c1]= size ( im1 ) ;
[ r2 , c2]= size ( im2 ) ;
 p=0;
 if ( r1==r2&&c1==c2)
     for i =1:r1
         for j =1: c1
             p=p+(im1(i ,j)-im2(i ,j))^2 ;
         end
     end
 else
     error('im1 and im2 must have same size');
 end
mse=p/(r1*c1) ;
PSNR=10*log10( 255^2 /mse ) ;
end
