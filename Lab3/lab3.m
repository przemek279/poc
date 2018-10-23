clearvars;
close all;
clc;

load funkcjeLUT.mat;

figure(1);
plot(kwadratowa);

I = imread('lena.bmp');
figure(2);
imshow(I);

Ikw = intlut(I, kwadratowa);
figure(3);
imshow(Ikw);

%% Pzy użyciu funkcji

LUT(I,kwadratowa);
LUT(I,log);
LUT(I,odwlog);
LUT(I,odwrotna);
LUT(I,pierwiastkowa);
LUT(I,pila);
LUT(I,wykladnicza);
