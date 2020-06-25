function im=generate_face_from_weights(weights_of_face,eignfaces_blk)
im=zeros(450,300);
for i=1:1:100
    im=im+weights_of_face(i).*eignfaces_blk(:,:,i);   
end
im=uint8(im);


