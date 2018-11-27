clearvars;
close all;
clc;

I = imread('fingerprint.bmp');

figure;
subplot(2,3,1);
imshow(I); title('ori');
subplot(2,3,2);
M = bwmorph(I, 'thin', 1);
imshow(M); title('1');
M = bwmorph(I, 'thin', 2);
subplot(2,3,3);
imshow(M); title('2');
M = bwmorph(I, 'thin', Inf);
subplot(2,3,4);
imshow(M); title('inf');


I = imread('kosc.bmp');

figure;
subplot(1,2,1);
imshow(I); title('ori');
M = bwmorph(I, 'skel', Inf);
subplot(1,2,2);
imshow(M); title('Skel');


I = imread('text.bmp');
subplot(2,3,1);
imshow(I); title('ori');
subplot(2,3,2);
SE = ones(51,1);
imshow(imopen(I, SE)); title('Open');

M = imreconstruct(imerode(I, SE), I);
subplot(2,3,3);
imshow(M); title('reconst');


M = imfill(I, 'holes');
subplot(2,3,4);
imshow(M); title('dziury');

M = imclearborder(I);
subplot(2,3,5);
imshow(M); title('clear border');




