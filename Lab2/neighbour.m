clearvars;
close all;
clc;

%I = imread('parrot.bmp');
%I = imread('chessboard.bmp');
I = imread('clock.bmp');
figure;
imshow(I);


xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(I);
nYY = floor(YY*yReScale);
nXX = floor(XX*xReScale);

nI = uint8(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;
for ii = (0:nYY-1)
    for jj = (0:nXX-1)
        i = round(ii * yStep);
        j = round(jj * xStep);
        
        if i > YY -1
            i = YY -1;
        end
        
        if j > XX -1
            j = XX -1;
        end
        
        nI(ii+1,jj+1) = I(i+1, j+1);
    end
end

figure;
imshow(nI);
        