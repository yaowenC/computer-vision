clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
binaryimg=zeros(size(input));

for x=1:512
    for y=1:512
        if input(x,y)>=128
            binaryimg(x,y)=255;
        else
            binaryimg(x,y)=0;
        end                
    end
end
binaryimg=uint8(binaryimg);
imwrite(binaryimg,'binaryimg.bmp');