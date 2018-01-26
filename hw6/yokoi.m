clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
binaryimg=zeros(size(input));

for x=1:512
    for y=1:512
        if input(x,y)>=128
            binaryimg(x,y)=1;
        else
            binaryimg(x,y)=0;
        end                
    end
end

for u=1:8:512
    for v=1:8:512
        sample((u-1)/8+2,(v-1)/8+2)=binaryimg(u,v);
    end
end    

for z=1:66
    sample(1,z)=0;
    sample(z,1)=0;
end    

for s=2:65
    for t=2:65
        if sample(s,t)==1
            if sample(s,t) ~= sample(s,t+1)
                a1='s';
            elseif sample(s,t)==sample(s-1,t+1) && sample(s,t)==sample(s-1,t)
                a1='r';
            else
                a1='q';
            end
            
            if sample(s,t) ~= sample(s-1,t)
                a2='s';
            elseif sample(s,t)==sample(s-1,t-1) && sample(s,t)==sample(s,t-1)
                a2='r';
            else
                a2='q';
            end
            
            if sample(s,t) ~= sample(s,t-1)
                a3='s';
            elseif sample(s,t)==sample(s+1,t-1) && sample(s,t)==sample(s+1,t)
                a3='r';
            else
                a3='q';
            end
            
            if sample(s,t) ~= sample(s+1,t)
                a4='s';
            elseif sample(s,t)==sample(s+1,t+1) && sample(s,t)==sample(s,t+1)
                a4='r';
            else
                a4='q';
            end
            
            if a1=='r' && a2=='r' && a3=='r' && a4=='r'
                result(s-1,t-1)=5;
            else 
                number=0;
                if a1=='q'
                    number=number+1;
                end
                if a2=='q'
                    number=number+1;
                end    
                if a3=='q'
                    number=number+1;
                end    
                if a4=='q'
                    number=number+1;
                end
                result(s-1,t-1)=number;
            end               
        end 
        if sample(s,t)==0
            result(s-1,t-1)=NaN;
        end    
    end
end

%±N 64x64 matrix result¿é¥X¦Üresult.xls
xlswrite('result.xls',result);
          
                
        