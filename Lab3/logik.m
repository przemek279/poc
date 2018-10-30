clearvars;
close all;
clc;


Kw = boolean(imread('kwadrat.bmp'));
K = boolean(imread('kolo.bmp'));

figure;
subplot(2,2,1);
imshow(not(Kw));
subplot(2,2,2);
imshow(and(Kw,K));
subplot(2,2,3);
imshow(or(Kw,K));
subplot(2,2,4);
imshow(xor(Kw, K));
