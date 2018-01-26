clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
input=double(img);
equal=zeros(size(input));
hist=zeros(1,256);
newhist=zeros(1,256);
below=zeros(1,256);
sum=0;

%�έp�C�ӫG�ת�pixels�Ӽ�
for x=1:512
    for y=1:512
        number=round(input(x,y)/3);
        hist(number)=hist(number)+1; 
    end
end

%�έp�C�ӫG�פ�ۤv�t��pixels�Ӽ�
for a=1:256
    %fprintf('%d:%g \n',a,hist(a));
    below(a)=sum;
    sum=sum+hist(a);
end    

%��C��pixels���s���G��
for x=1:512
    for y=1:512
        oldlight=round(input(x,y)/3);
        newlight=round((below(oldlight)/262144)*255);
        newhist(newlight+1)=newhist(newlight+1)+1;
        equal(x,y)=newlight;
    end
end

equal=uint8(equal);
imwrite(equal,'equal.bmp');
