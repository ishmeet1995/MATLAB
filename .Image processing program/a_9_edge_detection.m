a=imread('cameraman.tif');

b=edge(a,'sobel');
imshow(b);