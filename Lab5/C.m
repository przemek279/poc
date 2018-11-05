clc;
clearvars;
close all;

I = imread('bart.bmp');

figure;
subplot(1,3,1);
imshow(I);
subplot(1,3,2);
imhist(I);


Ib = I > 190 & I < 206;
Ib = uint8(Ib);

subplot(1,3,3);
imshow(Ib, []);

