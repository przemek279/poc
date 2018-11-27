clearvars;
clc;
close all;

I = imread('calculator.bmp');

figure;
subplot(2,3,1);
imshow(I); title('ori');

SE = ones(1,71);
Mar = imerode(I, SE);
M = imreconstruct(Mar, I);

subplot(2,3,2);
imshow(M); title('recon');


subplot(2,3,3);
imshow(imopen(I, SE)); title('open');

Mee = imabsdiff(I, M);
subplot(2,3,4);
imshow(Mee); title('diff');

M = imtophat(I, SE);
subplot(2,3,5);
imshow(M); title('tophat');

SE = ones(11,1);
Mar = imerode(Mee, SE);
Me = imreconstruct(Mar, Mee);
subplot(2,3,6);
imshow(Me); title('recon odbl pion');

O = imdilate(Me, ones(1,21));
O = imreconstruct(min(imdilate(Me, ones(1,21)), Mee), Mee);
figure;
imshow(O);


