clc;
clearvars;
close all;

I = imread('rice.png');

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imhist(I);

[H, x] = imhist(I);

Ib = im2bw(I, 95/255);
figure;
imshow(Ib);


I2 = imread('figura.png');

figure;
subplot(4,2,1);
imshow(I2);
subplot(4,2,2);
imhist(I2);

I3 = imread('figura2.png');
I4 = imread('figura3.png');
I5 = imread('figura4.png');



subplot(4,2,3);
imshow(I3);
subplot(4,2,4);
imhist(I3);

subplot(4,2,5);
imshow(I4);
subplot(4,2,6);
imhist(I4);

subplot(4,2,7);
imshow(I5);
subplot(4,2,8);
imhist(I5);

%Otsu
progOTSU = graythresh(I);

%Kittler
progKittler = clusterKittler(I);

%Yen
progYen = entropyYen(I);

figure;
subplot(3,2,1);
imshow(I);
title('Origniał');

subplot(3,2,2);
imhist(I);
title('Histogram');

subplot(3,2,3);
imshow(im2bw(I, progOTSU));
title('Manual 95');

subplot(3,2,4);
imshow(im2bw(I, progOTSU));
title(['Otsu ',  num2str(round(progOTSU*255))]);

subplot(3,2,5);
imshow(im2bw(I, progKittler/255));
title(['Kittler ',  num2str(progKittler)]);

subplot(3,2,6);
imshow(im2bw(I, progYen/255));
title(['Yen ',  num2str(progYen)]);



