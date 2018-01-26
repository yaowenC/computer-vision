clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
hist=zeros(1,256);

for x=1:512
    for y=1:512
        number=input(x,y);
        hist(number)=hist(number)+1;       
    end
end

bar(hist)