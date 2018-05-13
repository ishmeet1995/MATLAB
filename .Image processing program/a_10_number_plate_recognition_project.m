a=imread('C:\Users\ibind\Desktop\pic2.jpg');

b=rgb2gray(a);

c=edge(b,'sobel');
imshow(c),title('fig1');



