clear all;
clc;
addpath('C:\Users\jennifer\Desktop');


img = imread('lena.bmp');
input=double(img);
output=zeros(512);

for i=1:512
    for j=1:512
        x=rand;
        if x<0.025
            output(i,j)=0;
        elseif x>0.975
            output(i,j)=255;
        else
            output(i,j)=input(i,j);
        end    
    end
end
output=uint8(output);
imwrite(output,'saltpepper005.bmp');