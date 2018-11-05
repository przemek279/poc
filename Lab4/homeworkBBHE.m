clearvars;
close all;
clc;

I = imread('jet.bmp');
[H,x] = imhist(I);

lm = round(mean(I(:)));

H1 = H(1 : lm);
H2 = H(lm+1 : 256);

H1 = H1/sum(H1);
H2 = H2/sum(H2);

C1 = cumsum(H1);
C2 = cumsum(H2);

C1n = (lm)*C1;
C2n = lm+1 + (255-lm+1)*C2;
lut = [C1n; C2n];
ILut = intlut(I, uint8(lut));

figure;
subplot(2,1,1);
imshow(ILut);
title('BBHE');
subplot(2,1,2);
imshow(histeq(I));
title('HE');

