clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
min=300;
max=0;

output1=zeros(size(input));
output2=zeros(size(input));
for a=1:512
    for b=1:512
          for c=(a-2):(a+2)
              for d=(b-2):(b+2)
                  if c>=1 && d>=1 && c<=512 && d<=512
                    if sqrt((c-a).^2+(d-b).^2)<=sqrt(5)
                        if input(c,d)> max
                            max=input(c,d);
                        end    
                    end 
                  end  
              end
          end  
          output1(a,b)=max;
          max=0;
     end
end 

for e=1:512
    for f=1:512
          for g=(e-2):(e+2)
              for h=(f-2):(f+2)
                  if g>=1 && h>=1 && g<=512 && h<=512
                    if sqrt((g-e).^2+(h-f).^2)<=sqrt(5)
                        if output1(g,h)< min
                            min=output1(g,h);
                        end    
                    end 
                  end  
              end
          end  
          output2(e,f)=min;
          min=300;
     end
end 

output2=uint8(output2);
imwrite(output2,'close.bmp');