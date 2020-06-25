function out=linear_mapping_transform(image,X1,Y1,X2,Y2)


[M,N]=size(image);
image=im2double(image);
a=zeros(M,N);

for i=1:M
    for j=1:N
        if image(i,j)<X1
            a(i,j)=Y1*image(i,j)/X1;
        elseif image(i,j)>X2
            a(i,j)=(image(i,j)-X2)*(1-Y2)/(1-X2)+Y2;
        else
            a(i,j)=(image(i,j)-X1)*(Y2-Y1)/(X2-X1)+Y1;
        end
    end
end
out=a;
end

