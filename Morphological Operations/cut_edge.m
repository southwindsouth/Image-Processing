function out = cut_edge(im)

im(:,sum(im)==0)=[];
im(sum(im,2)==0,:)=[];
out=im;

end

