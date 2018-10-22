clearvars;
close all;
clc;

I = (imread('clock.bmp'));
figure;
imshow(I);
I = double(I);

xReScale = 2;
yReScale = 2;

[YY, XX] = size(I);
nYY = floor(YY*yReScale);
nXX = floor(XX*xReScale);

nI = uint8(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;
for ii = (0:nYY-1)
    for jj = (0:nXX-1)
        i = (ii * yStep);
        j = (jj * xStep);
        
        
        if i > YY -2
            i = YY -2;
        end
        
        if j > XX -2
            j = XX -2;
        end
        ni = floor(i);
        nj = floor(j);
        
        A = I(ni+1, nj+1);
        B = I(ni+2, nj+1);
        C = I(ni+2, nj+2);
        D = I(ni+1, nj+2);
        
        nni = i - ni;
        nnj = j - nj;
        
        nI(ii+1,jj+1) = [1-nnj, nnj]*[A D; B C]*[1-nni; nni];
        
    end
end

figure;
imshow(uint8(nI));
        