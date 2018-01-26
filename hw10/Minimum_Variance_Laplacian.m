clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
compute=zeros(514);
compute1=zeros(512);

for i=1:512
    for j=1:512
        compute(i+1,j+1)=input(i,j);
    end
end


for x=2:513
    for y=2:513
        compute1(x-1,y-1)=(2*compute(x-1,y-1)-compute(x-1,y)+2*compute(x-1,y+1)-compute(x,y-1)-4*compute(x,y)-compute(x,y+1)+2*compute(x+1,y-1)-compute(x+1,y)+2*compute(x+1,y+1))/3;
        if compute1(x-1,y-1) >=20
            compute1(x-1,y-1)=0;
        else
            compute1(x-1,y-1)=255;
        end
    end
end

for q=1:512
    for r=1:512
        if q==1||r==1||q==512||r==512
            compute1(q,r)=255;
        end
    end
end    

compute1=uint8(compute1);
imwrite(compute1,'minimumlaplace.bmp');