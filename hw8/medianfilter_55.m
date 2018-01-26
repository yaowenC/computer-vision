clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

image=char('gaussian10.bmp','gaussian30.bmp','saltpepper005.bmp','saltpepper01.bmp');

for t=1:4
    h=image(t,:);
    img = imread(h);
    input=double(img);
    output=zeros(512);
    temp=zeros(516);
    
    for x=1:512
        for y=1:512
            temp(x+2,y+2)=input(x,y);
        end
    end    
            
    for z=3:514
        for w=3:514
            array(1)=temp(z,w);
            array(2)=temp(z-1,w-1);
            array(3)=temp(z-1,w);
            array(4)=temp(z-1,w+1);
            array(5)=temp(z,w-1);
            array(6)=temp(z,w+1);
            array(7)=temp(z+1,w-1);
            array(8)=temp(z+1,w);
            array(9)=temp(z+1,w+1);
            array(10)=temp(z-2,w-2);
            array(11)=temp(z-2,w-1);
            array(12)=temp(z-2,w);
            array(13)=temp(z-2,w+1);
            array(14)=temp(z-2,w+2);
            array(15)=temp(z-1,w-2);
            array(16)=temp(z-1,w+2);
            array(17)=temp(z,w-2);
            array(18)=temp(z,w+2);
            array(19)=temp(z+1,w-2);
            array(20)=temp(z+1,w+2);
            array(21)=temp(z+2,w-2);
            array(22)=temp(z+2,w-1);
            array(23)=temp(z+2,w);
            array(24)=temp(z+2,w+1);
            array(25)=temp(z+2,w+2);
            
            for a=1:24
                for b=1:(25-a)
                    if array(b)>array(b+1)
                        c= array(b);
                        array(b)=array(b+1);
                        array(b+1)=c;
                    end
                end
            end    
            med=array(13);
            output(z-2,w-2)=med;
        end
    end  
    output=uint8(output);
    if t==1
        imgname='g10med55.bmp';
    elseif t==2
        imgname='g30med55.bmp';
    elseif t==3
        imgname='s005med55.bmp';
    else
        imgname='s01med55.bmp';
    end    
    
    imwrite(output,imgname);
end