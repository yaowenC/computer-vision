clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
compute=zeros(522);
compute1=zeros(512);

for i=1:512
    for j=1:512
        compute(i+5,j+5)=input(i,j);
    end
end


for x=6:517
    for y=6:517
        compute1(x-5,y-5)=178*compute(x,y)+103*(compute(x-1,y)+compute(x+1,y)+compute(x,y-1)+compute(x,y+1))...
        +52*(compute(x-1,y-1)+compute(x-1,y+1)+compute(x+1,y-1)+compute(x+1,y+1))...
        -14*(compute(x-2,y-1)+compute(x-1,y-2)+compute(x-2,y+1)+compute(x-1,y+2)+compute(x+2,y+1)+compute(x+1,y+2)+compute(x+2,y-1)+compute(x+1,y-2))...
        -(compute(x-2,y)+compute(x+2,y)+compute(x,y-2)+compute(x,y+2)+compute(x-5,y-1)+compute(x-5,y-2)+compute(x-5,y+1)+compute(x-5,y+2)+compute(x-1,y-5)+compute(x-2,y-5)+compute(x+1,y-5)+compute(x+2,y-5)+compute(x+5,y-1)+compute(x+5,y-2)+compute(x+5,y+1)+compute(x+5,y+2)+compute(x-1,y+5)+compute(x-2,y+5)+compute(x+1,y+5)+compute(x+2,y+5))...
        -2*(compute(x-5,y)+compute(x,y-5)+compute(x+5,y)+compute(x,y+5)+compute(x-4,y+3)+compute(x-3,y+4)+compute(x+4,y+3)+compute(x+3,y+4)+compute(x+4,y-3)+compute(x+3,y-4)+compute(x-4,y-3)+compute(x-3,y-4))...
        -4*(compute(x-4,y-2)+compute(x-4,y+2)+compute(x-2,y-4)+compute(x-2,y+4)+compute(x+2,y-4)+compute(x+2,y+4)+compute(x+4,y-2)+compute(x+4,y+2))...
        -7*(compute(x-3,y-3)+compute(x-3,y+3)+compute(x+3,y-3)+compute(x+3,y+3))...
        -8*(compute(x-4,y-1)+compute(x-4,y+1)+compute(x-1,y-4)+compute(x+1,y-4)+compute(x+4,y-1)+compute(x+4,y+1)+compute(x-1,y-4)+compute(x+1,y+4))...
        -9*(compute(x-4,y)+compute(x,y-4)+compute(x+4,y)+compute(x,y+4))...
        -15*(compute(x-3,y-2)+compute(x-2,y-3)+compute(x+2,y-3)+compute(x+3,y-2)+compute(x+2,y+3)+compute(x+3,y+2)+compute(x-2,y+3)+compute(x-3,y+2))...
        -22*(compute(x-3,y-1)+compute(x-3,y+1)+compute(x-1,y-3)+compute(x+1,y-3)+compute(x+3,y-1)+compute(x+3,y+1)+compute(x-1,y+3)+compute(x+1,y+3))...
        -23*(compute(x-3,y)+compute(x,y-3)+compute(x+3,y)+compute(x,y+3))...
        -24*(compute(x-2,y-2)+compute(x-2,y+2)+compute(x+2,y-2)+compute(x+2,y+2));
       
        if compute1(x-5,y-5) >=5000
            compute1(x-5,y-5)=0;
        else
            compute1(x-5,y-5)=255;
        end
    end
end

for q=1:512
    for r=1:512
        if q==1||r==1||q==512||r==512||q==2||r==2||q==511||r==511||q==3||r==3||q==510||r==510||q==4||r==4||q==509||r==509||q==5||r==5||q==508||r==508
            compute1(q,r)=255;
        end
    end
end    

compute1=uint8(compute1);
imwrite(compute1,'laplacianofGaussian.bmp');