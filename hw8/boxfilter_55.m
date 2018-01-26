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
            
            sum=0;
            
            for a=1:25
                sum=sum+array(a);
            end    
            avg=round(sum/25);
            output(z-2,w-2)=avg;
        end
    end  
    output=uint8(output);
    if t==1
        imgname='g10box55.bmp';
    elseif t==2
        imgname='g30box55.bmp';
    elseif t==3
        imgname='s005box55.bmp';
    else
        imgname='s01box55.bmp';
    end    
    
    imwrite(output,imgname);
end