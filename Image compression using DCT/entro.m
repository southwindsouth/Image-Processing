 function [en] = entro(im)
count=imhist(im);
[r,c]=size(im);
en=0;%en is entropy
    for i=1:256
        p(i)=count(i)/(r*c);    
        if p(i)~=0   
        en=en-p(i)*log2(p(i));   
        end
    end
end

