clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
binaryimg=zeros(size(input));
output=zeros(size(input));

for x=1:512
    for y=1:512
        if input(x,y)>=128
            binaryimg(x,y)=1;
        else
            binaryimg(x,y)=0;
        end                
    end
end

for a=2:511
    for b=2:511
        if binaryimg(a,b)==1 &&  binaryimg(a+1,b)==1 && binaryimg(a,b-1)==1 && binaryimg(a-1,b)==0 && binaryimg(a,b+1)==0 && binaryimg(a-1,b+1)==0
            output(a,b)=255;    
        end
    end
end

output=uint8(output);
imwrite(output,'hitandmiss.bmp');