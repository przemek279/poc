clc;
close all;
clearvars;

I = imread('umbrealla.png');

figure;
subplot(2,2,1);
imshow(I);

I = double(I);
Ih = rgb2hsv(I);
Ih = Ih(:,:,1);  
global index;
index = 1;
global prog;     
prog = 0.05;
global lim;      
lim = 8;
[x,y] = size(Ih);

global segRes;
global MRes;
segRes = zeros(x,y);
MRes = zeros(x,y);

subplot(2,2,2);
imshow(Ih, []);

split(Ih,1,1,x,y);


i = 0;
while i <= index
   IB = segRes == i;
   
   if ~any(IB(:) == 0)
      i = i + 1; 
   else
       [xF, yF] = find(IB,1,'first');
       IBd = imdilate(IB, strel('square',3));
       IBdiff = imabsdiff(IBd, IB);

       neightbours = unique(nonzeros(segRes .* IBdiff));    
       
       flag = 0;
       
       for j = (neightbours')
           IB2 = segRes == j;
           [xF2, yF2] = find(IB2,1,'first');
           
           if (abs(MRes(xF,yF) - MRes(xF2,yF2)) < (5/255))
               segRes(IB2) = i;
               flag = 1;
           end
       end
       if flag == 0
            i = i + 1;
       end
   end
     
end


subplot(2,2,3);
imshow(segRes, []);


U = unique(segRes);

for i = U'
    C = segRes == i;
    if sum(C) < 30  % W poleceniu 100
        segRes(C) = 0;
    end
end

U = unique(segRes);

for i = 1:numel(U)
    C = segRes == U(i);
    segRes(C) = i;
end

subplot(2,2,4);
imshow(label2rgb(segRes));




function split(Ih, x1, y1, x2, y2)
    global segRes;
    global index;
    global MRes;
    global prog;
    global lim;
    
    I = Ih(x1:x2, y1:y2);
    m = mean(I(:));
    s = std(I(:));
    
    if (s < prog || (y2 - y1) <= lim)
        segRes(x1:x2, y1:y2) = index;
        index = index + 1;
        MRes(x1:x2, y1:y2) = m;
    else
        xh = floor((x1+x2)/2);
        yh = floor((y1+y2)/2);
        split(Ih,x1,y1,xh,yh);
        split(Ih,xh+1,y1,x2,yh);
        split(Ih,xh+1,yh+1,x2,y2);
        split(Ih,x1,yh+1,xh,y2);
        
    end
end

