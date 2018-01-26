clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
min=300;

output=zeros(size(input));
for a=1:512
    for b=1:512
          for c=(a-2):(a+2)
              for d=(b-2):(b+2)
                  if c>=1 && d>=1 && c<=512 && d<=512
                    if sqrt((c-a).^2+(d-b).^2)<=sqrt(5)
                        if input(c,d)< min
                            min=input(c,d);
                        end    
                    end 
                  end  
              end
          end  
          output(a,b)=min;
          min=300;
     end
end 

output=uint8(output);
imwrite(output,'erosion.bmp');