clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
leftright=zeros(size(input));

for x=1:512
    for y=1:512
        leftright(x,513-y)=input(x,y);
    end
end
leftright=uint8(leftright);
imwrite(leftright,'leftright.bmp');