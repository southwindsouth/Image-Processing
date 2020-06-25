clear;
load data_for_labC.mat;
image=imread('find_id.jpg');
ID=get_employees_ID_from_DB (image, employees_DB,eignfaces_blk);
disp(ID);

 
% m=generate_face_from_weights(employees_DB(13).weights,eignfaces_blk);
% figure;
% imshow(m);