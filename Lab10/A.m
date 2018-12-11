clearvars;
close all;
clc;

I = imread('knee.png');
I = imfilter(I, fspecial('gaussian'));
figure;
imshow(I);

% [X,Y] = ginput(1);
% round(X);
% round(Y);

I = double(I);

X = 200;
Y = 350;

[x,y] = size(I);

stack = zeros(1000,2);
visited = zeros(x,y);
segmented = zeros(x,y);

iStack = 1;
stack(iStack,1) = X;
stack(iStack,2) = Y;
iStack = 2;
visited(X,Y) = 1;
segmented(X,Y) = 1;

nS = 0;
mV = 0;

I = imfilter(I, fspecial('gaussian'));
while iStack > 1
    
    iStack = iStack - 1;
    xx=stack(iStack,1);
    yy=stack(iStack,2);
    nS = nS + 1;
    
    if xx == 1 || xx == x || yy == 1 || yy == y
        break;
    end
    
    neighbour = [xx+1, yy+1; xx+1, yy; xx+1, yy-1; xx, yy+1; xx, yy-1; xx-1, yy+1; xx-1, yy; xx-1, yy-1];
    
    mV = (mV*(nS-1) + I(xx,yy))/nS;
    
    for i = 1:8
        nX = neighbour(i,1);
        nY = neighbour(i,2);
        
       if abs(I(nX,nY) - mV) < 30 && visited(nX,nY) == 0
           segmented(nX,nY) = 1;
           stack(iStack,1) = nX;
           stack(iStack,2) = nY;
           iStack = iStack + 1;
       end
       visited(nX,nY) = 1;
    end
    
    
end

figure;
imshow(segmented,[]);

