a=imread('C:\Users\ibind\Desktop\pic.jpg');
imshow(a);
size(a)
b=rgb2gray(a)   %we take mean of pixels
imshow(b)
impixelinfo;