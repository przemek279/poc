clearvars;
close all;
clc;

I = (imread('lena.bmp'));

figure;
I256 = imresize(I,[256,256]);
I128 = imresize(I,[128,128]);
I64 = imresize(I,[64,64]);

subplot(2,2,1);
imshow(I, 'InitialMagnification', 100);
subplot(2,2,2);
imshow(I256, 'InitialMagnification', 200);
subplot(2,2,3);
imshow(I128, 'InitialMagnification', 400);
subplot(2,2,4);
imshow(I64, 'InitialMagnification', 800);

