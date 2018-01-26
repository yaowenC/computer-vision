%Preliminary setups
close all; 
clear all;

%Read image
input = imread('lena.bmp');
frame2=zeros(66);

%Make binary
input(input < 128) = 0;
input(input >= 128) = 1;

for u=1:8:512
    for v=1:8:512
        frame2((u-1)/8+2,(v-1)/8+2)=input(u,v);
    end
end    

%While loop control
changed = 1;
while changed
    markMatrix = zeros(64);
    for y = 2:65
        for x = 2:65
            % if this pixel is not black, then, proceed in.
            if (frame2(y,x) > 0)                
                np=0;
                sp=0;
                % the pos(2 to 9) here are for the surrounding pixels.
                pos(1) = frame2(y,   x);
                pos(2) = frame2(y-1, x);
                pos(3) = frame2(y-1, x+1);
                pos(4) = frame2(y,   x+1);
                pos(5) = frame2(y+1, x+1);
                pos(6) = frame2(y+1, x);
                pos(7) = frame2(y+1, x-1);
                pos(8) = frame2(y,   x-1);
                pos(9) = frame2(y-1, x-1);

                for n = 2:9
                    if pos(n)==1
                        np=np+1;   %np=周圍非0點個數
                    end
                end

                %Test if pixel is to be removed
                if np>=2 && np<=6
                    for i=2:8
                        if pos(i)==0 && pos(i+1)==1
                            sp=sp+1;
                        end
                    end    
                    if pos(9)==0 &&  pos(2)==1
                    sp=sp+1;
                    end
                    if sp==1
                       if (pos(2)==0 ||pos(4)==0||pos(6)==0) && (pos(4)==0|| pos(6)==0 || pos(8)==0) 
                          markMatrix(y,x) = 1;
                       end  
                    end      
                end

            end
        end
    end
    frame2(markMatrix > 0) = 0;
    markMatrix(markMatrix > 0) = 0;
    disp('1\n');
    
    for z = 2:65
        for w = 2:65

            % if this pixel is not black, then, proceed in.
            if (frame2(z,w) > 0)                
                np1=0;
                sp1=0;
                % the pos(2 to 9) here are for the surrounding pixels.
                pos(1) = frame2(z,   w);
                pos(2) = frame2(z-1, w);
                pos(3) = frame2(z-1, w+1);
                pos(4) = frame2(z,   w+1);
                pos(5) = frame2(z+1, w+1);
                pos(6) = frame2(z+1, w);
                pos(7) = frame2(z+1, w-1);
                pos(8) = frame2(z,   w-1);
                pos(9) = frame2(z-1, w-1);


                for f = 2:9
                    if pos(f)==1
                        np1=np1+1;
                    end
                end

                %Test if pixel is to be removed
                if np1>=2 && np1<=6
                    for p=2:8
                        if pos(p)==0 && pos(p+1)==1
                            sp1=sp1+1; %sp=pos(2)~pos(9)pixel從0變1的總次數
                        end
                    end    
                end
                if pos(9)==0 &&  pos(2)==1
                    sp1=sp1+1;
                end
                if sp1==1
                   if (pos(2)==0 ||pos(4)==0||pos(8)==0) && (pos(2)==0|| pos(6)==0 || pos(8)==0) 
                     markMatrix(z,w) = 1;
                   end  
                end      
            end
        end
    end
    frame2(markMatrix > 0) = 0;
    disp('2\n')
  
    %Mask out all pixels found to be deleted

    %Check if anything has changed
    if sum(markMatrix(:)) > 0
        changed = 1;
    else
        changed = 0;
    end
end

imwrite(frame2,'result.bmp');