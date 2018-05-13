a=imread('C:\Users\ibind\Desktop\pic.jpg');
imshow(a);
size(a)
% a(row,column,channel)=value; channel is either red(1) or green(2) or
% blue(3)
a(1,1,1)= 200;
imshow(a);
b=a(1,1)
impixelinfo