clearvars;
close all;
clc;

I = (imread('clock.bmp'));
I1 = imread('parrot.bmp');
I2 = imread('chessboard.bmp');

figure;
subplot(3,5,1);
imshow(I);
title('Sąsiad najbliższy');
subplot(3,5,2);
imshow(imresize(I,[100,200],'nearest'));
subplot(3,5,3);
imshow(imresize(I,[130,200],'nearest'));
subplot(3,5,4);
imshow(imresize(I1,[130,200],'nearest'));
subplot(3,5,5);
imshow(imresize(I2,[130,200],'nearest'));


subplot(3,5,6);
imshow(I1);
title('Dwuliniowa');
subplot(3,5,7);
imshow(imresize(I1,[130,200],'bilinear'));
subplot(3,5,8);
imshow(imresize(I1,[130,200],'bilinear'));
subplot(3,5,9);
imshow(imresize(I,[130,200],'bilinear'));
subplot(3,5,10);
imshow(imresize(I2,[130,200],'bilinear'));

subplot(3,5,11);
imshow(I2);
title('Dwusześcienna');
subplot(3,5,12);
imshow(imresize(I2,[100,200],'cubic'));
subplot(3,5,13);
imshow(imresize(I2,[130,200],'cubic'));
subplot(3,5,14);
imshow(imresize(I,[130,200],'cubic'));
subplot(3,5,15);
imshow(imresize(I1,[130,200],'cubic'));
