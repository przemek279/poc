clc;
close all;
clearvars;

I = imread('umbrealla.png');

figure;
subplot(1,3,1);
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


for i = 1:index
   IB = segRes = i;
   
   if any(IB(:) == 0)
      continue; 
   end
   
   [xF, yF] = find(IB,1,'first');
   IBd = imdilate(IB, strel('square',3));
   IBdiff = imdiff(IBd, IB);
   
   neightbours = unique(nonzeros(segRes .* IBdiff));
   
   for j = neightbours
       IB2 = segRes = j;
       [xF, yF] = find(IB2,1,'first');
       
       if abs
   end
   
   
end

function split(Ih, tl, len)
    m = mean(Ih(tl(1):tl(1)+len,tl(2):tl(2)+len));
    s = std(Ih(:));
    
    if s < prog && lem == lim
        
        segRes((tl(1):tl(1)+len,tl(2):tl(2)+len)) = index;
        index = index + 1;
        MRes(Ih(tl(1):tl(1)+len,tl(2):tl(2)+len)) = m;
        
    else
        split(Ih,tl,len/2);
        split(Ih, [tl(1) + len/2, tl(2)], len/2);
        split(Ih, [tl(1), tl(2) + len/2], len/2);
        split(Ih, [tl(1) + len/2, tl(2) + len/2], len/2);
        
    end
end