clearvars;
close all;
clc;

clearvars;
close all;
clc;

I = imread('lenaRGB.bmp');

lenaR = I(:,:,1);
lenaG = I(:,:,2);
lenaB = I(:,:,3);

figure;
subplot(3,2,1);
imshow(lenaR);
subplot(3,2,2);
imhist(lenaR);

subplot(3,2,3);
imshow(lenaG);
subplot(3,2,4);
imhist(lenaG);

subplot(3,2,5);
imshow(lenaR);
subplot(3,2,6);
imhist(lenaB);

Re = histeq(lenaR, 256);
Ge = histeq(lenaG, 256);
Be = histeq(lenaB, 256);

obrazEQ = I;
obrazEQ(:,:,1) = Re;
obrazEQ(:,:,2) = Ge;
obrazEQ(:,:,3) = Be;

figure;
imshow(obrazEQ);

lenahsv = rgb2hsv(I);

lenahsv(:,:,3) = histeq(lenahsv(:,:,3), 256);

figure;
imshow(hsv2rgb(lenahsv));


