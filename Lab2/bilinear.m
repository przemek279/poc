clearvars;
close all;
clc;

I = (imread('parrot.bmp'));
figure;
imshow(I);
I = double(I);

xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(I);
nYY = floor(YY*yReScale);
nXX = floor(XX*xReScale);

nI = double(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;
for jj = (0:nYY-1)
    for ii = (0:nXX-1)
        i = round(ii * xStep);
        j = round(jj * yStep);
        
        if i > YY -2
            i = YY -2;
        end
        
        if j > XX -2
            j = XX -2;
        end
        
      
        
        A = floor([ii, jj] - [i, j]);
        B = floor([ii, jj+1] - [i, j]);
        C = floor([ii+1, jj+1] - [i, j]);
        D = floor([ii+1, jj] - [i, j]);
               
        
        nI(jj+1,ii+1) = [1-j, j]*[I(A(1)+1,A(2)+1, I(D(1)+1,D(2)+1); I(B(1)+1, B(2)+1), I(C(1)+1, C(2)+1]*[1-i; i];
        
    end
end

figure;
imshow(uint8(nI));
        