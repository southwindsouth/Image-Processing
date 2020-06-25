function ID= get_employees_ID_from_DB(im,employees_DB,eignfaces_blk)
weights_of_face=get_face_weights(im,eignfaces_blk);
a=norm(weights_of_face-employees_DB(1).weights); %--assuming the nearest distance

for i=2:1:100
    c=norm(weights_of_face-employees_DB(i).weights);
    if (c<a)                                   %--update the nearest distance
        a=c;
        ID=i;
    end
end

