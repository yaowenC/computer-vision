clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
compute=zeros(516);
compute1=zeros(512);

for i=1:512
    for j=1:512
        compute(i+2,j+2)=input(i,j);
    end
end

for x=3:514
    for y=3:514        
        k0=compute(x-2,y-2)*100+compute(x-2,y-1)*100+compute(x-2,y)*100+compute(x-2,y+1)*100+compute(x-2,y+2)*100+compute(x-1,y-2)*100+compute(x-1,y-1)*100+compute(x-1,y)*100+compute(x-1,y+1)*100+compute(x+1,y-2)*(-100)+compute(x+1,y-1)*(-100)+compute(x+1,y)*(-100)+compute(x+1,y+1)*(-100)+compute(x+1,y+2)*(-100)+compute(x+2,y-2)*(-100)+compute(x+2,y-1)*(-100)+compute(x+2,y)*(-100)+compute(x+2,y+1)*(-100)+compute(x+2,y+2)*(-100);
        k1=compute(x-2,y-2)*100+compute(x-2,y-1)*100+compute(x-2,y)*100+compute(x-2,y+1)*100+compute(x-2,y+2)*100+compute(x-1,y-2)*100+compute(x-1,y-1)*100+compute(x-1,y)*100+compute(x-1,y+1)*100+compute(x-1,y+2)*78+compute(x,y+2)*(-32)+compute(x,y-2)*100+compute(x,y-1)*92+compute(x,y+1)*(-92)+compute(x,y+2)*(-100)+compute(x+1,y-2)*(32)+compute(x+1,y-1)*(-78)+compute(x+1,y)*(-100)+compute(x+1,y+1)*(-100)+compute(x+1,y+2)*(-100)+compute(x+2,y-2)*(-100)+compute(x+2,y-1)*(-100)+compute(x+2,y)*(-100)+compute(x+2,y+1)*(-100)+compute(x+2,y+2)*(-100);
        k2=compute(x-2,y-2)*100+compute(x-2,y-1)*100+compute(x-2,y)*100+compute(x-2,y+1)*32+compute(x-2,y+2)*(-100)+compute(x-1,y-2)*100+compute(x-1,y-1)*100+compute(x-1,y)*92+compute(x-1,y+1)*(-78)+compute(x-1,y+2)*(-100)+compute(x,y-2)*100+compute(x,y-1)*100+compute(x,y+1)*(-100)+compute(x,y+2)*(-100)+compute(x+1,y-2)*100+compute(x+1,y-1)*78+compute(x+1,y)*(-92)+compute(x+1,y+1)*(-100)+compute(x+1,y+2)*(-100)+compute(x+2,y-2)*100+compute(x+2,y-1)*(-32)+compute(x+2,y)*(-100)+compute(x+2,y+1)*(-100)+compute(x+2,y+2)*(-100);
        k3=compute(x-2,y-2)*(-100)+compute(x-2,y-1)*(-100)+compute(x-2,y+1)*100+compute(x-2,y+2)*100+compute(x-1,y-2)*(-100)+compute(x-1,y-1)*(-100)+compute(x-1,y+1)*100+compute(x-1,y+2)*100+compute(x,y-2)*(-100)+compute(x,y-1)*(-100)+compute(x,y+1)*100+compute(x,y+2)*100+compute(x+1,y-2)*(-100)+compute(x+1,y-1)*(-100)+compute(x+1,y+1)*100+compute(x+1,y+2)*100+compute(x+2,y-2)*(-100)+compute(x+2,y-1)*(-100)+compute(x+2,y+1)*100+compute(x+2,y+2)*100;
        k4=compute(x-2,y-2)*(-100)+compute(x-2,y-1)*32+compute(x-2,y)*100+compute(x-2,y+1)*100+compute(x-2,y+2)*100+compute(x-1,y-2)*(-100)+compute(x-1,y-1)*(-78)+compute(x-1,y)*92+compute(x-1,y+1)*100+compute(x-1,y+2)*100+compute(x,y-2)*(-100)+compute(x,y-1)*(-100)+compute(x,y+1)*100+compute(x,y+2)*100+compute(x+1,y-2)*(-100)+compute(x+1,y-1)*(-100)+compute(x+1,y)*(-92)+compute(x+1,y+1)*78+compute(x+1,y+2)*100+compute(x+2,y-2)*(-100)+compute(x+2,y-1)*(-100)+compute(x+2,y)*(-100)+compute(x+2,y+1)*(-32)+compute(x+2,y+2)*100;
        k5=compute(x-2,y-2)*100+compute(x-2,y-1)*100+compute(x-2,y)*100+compute(x-2,y+1)*100+compute(x-2,y+2)*100+compute(x-1,y-2)*(-32)+compute(x-1,y-1)*78+compute(x-1,y)*100+compute(x-1,y+1)*100+compute(x-1,y+2)*100+compute(x,y-2)*(-100)+compute(x,y-1)*(-92)+compute(x,y+1)*92+compute(x,y+2)*100+compute(x+1,y-2)*(-100)+compute(x+1,y-1)*(-100)+compute(x+1,y)*(-100)+compute(x+1,y+1)*(-78)+compute(x+1,y+2)*32+compute(x+2,y-2)*(-100)+compute(x+2,y-1)*(-100)+compute(x+2,y)*(-100)+compute(x+2,y+1)*(-100)+compute(x+2,y+2)*(-100);
        
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
 
        compute1(x-2,y-2)=max;
        if compute1(x-2,y-2) >=30000
            compute1(x-2,y-2)=0;
        else
            compute1(x-2,y-2)=255;
        end
    end
end

for q=1:512
    for r=1:512
        if q==1||r==1||q==512||r==512||q==2||r==2||q==511||r==511
            compute1(q,r)=255;
        end
    end
end    

compute1=uint8(compute1);
imwrite(compute1,'NevatiaandBabu.bmp');