clearvars;
close all;
clc;

I = imread('phobos.bmp');
figure;
imshow(I);

figure;
imshow(histeq(I));

load histogramZadany;
figure;
plot(histogramZadany);

figure;
imshow(histeq(I, histogramZadany));

figure;
imshow(imadjust(I));


figure;
imshow(adapthisteq(I));

