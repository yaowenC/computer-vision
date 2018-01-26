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
        k0=compute(x-1,y-1)*(-1)+compute(x-1,y+1)+compute(x,y-1)*(-2)+compute(x,y+1)*2+compute(x+1,y-1)*(-1)+compute(x+1,y+1);
        k1=compute(x-1,y)+compute(x-1,y+1)*2+compute(x,y-1)*(-1)+compute(x,y+1)+compute(x+1,y-1)*(-2)+compute(x+1,y)*(-1);
        k2=compute(x-1,y-1)+compute(x-1,y)*2+compute(x-1,y+1)+compute(x+1,y-1)*(-1)+compute(x+1,y)*(-2)+compute(x+1,y+1)*(-1);
        k3=compute(x-1,y-1)*2+compute(x-1,y)+compute(x,y-1)+compute(x,y+1)*(-1)+compute(x+1,y)*(-1)+compute(x+1,y+1)*(-2);
        k4=compute(x-1,y-1)+compute(x-1,y+1)*(-1)+compute(x,y-1)*2+compute(x,y+1)*(-2)+compute(x+1,y-1)+compute(x+1,y)*(-1);
        k5=compute(x-1,y)*(-1)+compute(x-1,y+1)*(-2)+compute(x,y-1)+compute(x,y+1)*(-1)+compute(x+1,y-1)*2+compute(x+1,y);
        k6=compute(x-1,y-1)*(-1)+compute(x-1,y)*(-2)+compute(x-1,y+1)*(-1)+compute(x+1,y-1)+compute(x+1,y)*2+compute(x+1,y+1);
        k7=compute(x-1,y-1)*(-2)+compute(x-1,y)*(-1)+compute(x,y-1)*(-1)+compute(x,y+1)+compute(x+1,y)+compute(x+1,y+1)*2;
        max=0;
        if k1>k0
            max=k1;
        else
            max=k0;
        end
        if k2>max
            max=k2;
        end
        if k3>max
            max=k3;
        end
        if k4>max
            max=k4;
        end
        if k5>max
            max=k5;
        end
        if k6>max
            max=k6;
        end
        if k7>max
            max=k7;
        end
        compute1(x-1,y-1)=max;
        if compute1(x-1,y-1) >=100
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
imwrite(compute1,'robinson.bmp');