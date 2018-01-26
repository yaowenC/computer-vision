clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
diag=zeros(size(input));

for x=1:512
    for y=1:512
        diag(513-y,513-x)=input(x,y);
    end
end
diag=uint8(diag);
imwrite(diag,'diag.bmp');