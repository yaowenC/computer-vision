clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

image=char('gaussian10.bmp','gaussian30.bmp','saltpepper005.bmp','saltpepper01.bmp');

for t=1:4
    h=image(t,:);
    img = imread(h);
    input=double(img);
    output=zeros(512);
    temp=zeros(514);
    
    for x=1:512
        for y=1:512
            temp(x+1,y+1)=input(x,y);
        end
    end    
            
    for z=2:513
        for w=2:513
            array(1)=temp(z,w);
            array(2)=temp(z-1,w-1);
            array(3)=temp(z-1,w);
            array(4)=temp(z-1,w+1);
            array(5)=temp(z,w-1);
            array(6)=temp(z,w+1);
            array(7)=temp(z+1,w-1);
            array(8)=temp(z+1,w);
            array(9)=temp(z+1,w+1);
            
            sum=0;
            
            for a=1:9
                sum=sum+array(a);
            end    
            avg=round(sum/9);
            output(z-1,w-1)=avg;
        end
    end  
    output=uint8(output);
    if t==1
        imgname='g10box33.bmp';
    elseif t==2
        imgname='g30box33.bmp';
    elseif t==3
        imgname='s005box33.bmp';
    else
        imgname='s01box33.bmp';
    end    
    
    imwrite(output,imgname);
end
    