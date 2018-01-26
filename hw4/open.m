clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
binaryimg=zeros(size(input));
output=zeros(size(input));
k=1;

for x=1:512
    for y=1:512
        if input(x,y)>=128
            binaryimg(x,y)=1;
        else
            binaryimg(x,y)=0;
        end                
    end
end
for a=3:510
    for b=3:510
        if binaryimg(a,b)==1
            for c=(a-2):(a+2)
                for d=(b-2):(b+2)
                    if sqrt((c-a).^2+(d-b).^2)<=sqrt(5)
                        if binaryimg(c,d)==0
                           k=0;    
                        end
                    end    
                end
            end 
            if k==1
            output(a,b)=1;
            end
        end
        k=1;
    end
end

for a=3:510
    for b=3:510
        if output(a,b)==1
            output(a,b)=255;
            for c=(a-2):(a+2)
                for d=(b-2):(b+2)
                    if sqrt((c-a).^2+(d-b).^2)<=sqrt(5)
                        output(c,d)=255;
                    end    
                end
            end    
        end
    end
end

output=uint8(output);
imwrite(output,'open.bmp');