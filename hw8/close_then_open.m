clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

image=char('gaussian10.bmp','gaussian30.bmp','saltpepper005.bmp','saltpepper01.bmp');

for t=1:4
    h=image(t,:);
    img = imread(h);
    input=double(img);
    binaryimg=zeros(512);
    output=zeros(512);
    result=zeros(512);
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
                output(a,b)=1;
                for c=(a-2):(a+2)
                    for d=(b-2):(b+2)
                        if sqrt((c-a).^2+(d-b).^2)<=sqrt(5)
                            output(c,d)=1;
                        end    
                    end
                end    
            end
        end
    end

    for a=3:510
        for b=3:510
            if output(a,b)==1
                for c=(a-2):(a+2)
                    for d=(b-2):(b+2)
                        if sqrt((c-a).^2+(d-b).^2)<=sqrt(5)
                            if output(c,d)==0
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
    
    k=1;
    
    for a=3:510
        for b=3:510
            if output(a,b)==1
                for c=(a-2):(a+2)
                    for d=(b-2):(b+2)
                        if sqrt((c-a).^2+(d-b).^2)<=sqrt(5)
                            if output(c,d)==0
                                k=0;    
                            end
                        end    
                    end
                end 
                if k==1
                    result(a,b)=1;
                end
            end
            k=1;
        end
    end
    
    for a=3:510
        for b=3:510
            if result(a,b)==1
                result(a,b)=255;
                for c=(a-2):(a+2)
                    for d=(b-2):(b+2)
                        if sqrt((c-a).^2+(d-b).^2)<=sqrt(5)
                            result(c,d)=255;
                        end    
                    end
                end    
            end
        end
    end
    
   
    
    result=uint8(result);
    if t==1
        imgname='g10closethenopen.bmp';
    elseif t==2
        imgname='g30closethenopen.bmp';
    elseif t==3
        imgname='s005closethenopen.bmp';
    else
        imgname='s01closethenopen.bmp';
    end    
    
    imwrite(result,imgname);
end    