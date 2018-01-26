clear all;
clc;
addpath('C:\Users\jennifer\Desktop');

img = imread('lena.bmp');
img =double(img);
visited = false(size(img));
A = zeros(size(img));
[rows,cols] = size(img);
B = zeros(size(img));
ID_counter = 1;

for a=1:512
    for b=1:512
        if img(a,b)>=128
            A(a,b)=255;
        else
            A(a,b)=0;
        end                
    end
end

for row = 1 : rows
    for col = 1 : cols
        %// If this location is not 1, mark as visited and continue
        if A(row,col) == 0
            visited(row,col) = true;

        %// If we have visited, then continue
        elseif visited(row,col)
            continue;

        else
            %// Initialize your stack with this location
            stack = [row col];

            %// While your stack isn't empty...
            while ~isempty(stack)
                %// Pop off the stack
                loc = stack(1,:);
                stack(1,:) = [];

                %// If we have visited this location, continue
                if visited(loc(1),loc(2))
                    continue;
                end

                %// Mark location as true and mark this location to be its unique ID
                visited(loc(1),loc(2)) = true;
                B(loc(1),loc(2)) = ID_counter;

                %// Look at the 8 neighbouring locations
                [locs_y, locs_x] = meshgrid(loc(2)-1:loc(2)+1, loc(1)-1:loc(1)+1);
                locs_y = locs_y(:);
                locs_x = locs_x(:);

                %// Get rid of those locations out of bounds
                out_of_bounds = locs_x < 1 | locs_x > rows | locs_y < 1 | locs_y > cols;

                locs_y(out_of_bounds) = [];
                locs_x(out_of_bounds) = [];

                %// Get rid of those locations already visited
                is_visited = visited(sub2ind([rows cols], locs_x, locs_y));

                locs_y(is_visited) = [];
                locs_x(is_visited) = [];

                %// Get rid of those locations that are zero.
                is_1 = A(sub2ind([rows cols], locs_x, locs_y));
                locs_y(~is_1) = [];
                locs_x(~is_1) = [];

                %// Add remaining locations to the stack
                stack = [stack; [locs_x locs_y]];
            end

            %// Increment counter once complete region has been examined
            ID_counter = ID_counter + 1;
        end
    end
end
 
%%RGB_label = label2rgb(B);
s = regionprops(B,'basic');
cen = regionprops(B,'centroid');
figure(1);
imshow(A)

for u=1:max(B)
    if s(u).Area > 500
        hold on;
        rectangle('Position', s(u).BoundingBox,'EdgeColor','r' ); 
        plot(cen(u).Centroid(1),cen(u).Centroid(2),'r+'); 
    end    
end
hold off;