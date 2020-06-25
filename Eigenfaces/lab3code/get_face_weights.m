function weights_of_face=get_face_weights(im,eigenfaces_blk)
weights_of_face=zeros(1,101);
im=double(im);
for i=1:1:100
   % mean_of_face=mean(mean(im));
    weights_of_face(i)=mean(mean(im.*eigenfaces_blk(:,:,i)));
end

