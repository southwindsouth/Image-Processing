function E = entropy(I)

p = imhist(I(:));% calculate histogram counts

p(p==0) = [];% remove zero entries in p 

p = p ./ numel(I);% normalize p so that sum(p) is one.

E = -sum(p.*log2(p));
  
end

