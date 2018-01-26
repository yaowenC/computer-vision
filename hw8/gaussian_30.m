clear all;
clc;
addpath('C:\Users\jennifer\Desktop');


img = imread('lena.bmp');
input=double(img);
output=zeros(512);

for i=1:512
    for j=1:512
        x=randn(1,1);
        output(i,j)=input(i,j)+30*x;
    end
end
output=uint8(output);
imwrite(output,'Gaussian30.bmp');