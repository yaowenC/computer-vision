clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
updown=zeros(size(input));

for x=1:512
    for y=1:512
        updown(513-x,y)=input(x,y);
    end
end
updown=uint8(updown);
imwrite(updown,'updown.bmp');