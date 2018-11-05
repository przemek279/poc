clc;
clearvars;
close all;

I = imread('rice.png');

[X, Y] = size(I);

Ic = I;

for i = 1:X
    for j = 1:Y
        prog = meanLT(i,j,8,I,X,Y);
        
        if I(i,j) <= prog
            Ic(i,j) = 0;
        else
            Ic(i,j) = 255;
        end
    end
end

figure;
subplot(1,2,1);
imshow(I);
title('Originał');
subplot(1,2,2);
imshow(Ic);
title('Bin');

k = 0.15;
R = 128;

for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,8,I,X,Y);
        s = stddevLT(i,j,8,I,m,X,Y);
        prog  = m*(1+k*((s/R)-1));  
        if I(i,j) <= prog
            Ic(i,j) = 0;
        else
            Ic(i,j) = 255;
        end
    end
end

figure;
subplot(1,2,1);
imshow(I);
title('Originał Sauvoli');
subplot(1,2,2);
imshow(Ic);
title('Bin');