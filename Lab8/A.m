clearvars;
close all;
clc;

I = imread('ertka.bmp');

M = imerode(I, strel('square', 3));

figure;
subplot(2,3,1);
imshow(I);title('Ori');
subplot(2,3,2);
imshow(M);title('erozja');

I = imread('buzka.bmp');

M = imerode(I, [1 0 1; 0 1 0; 1 0 1]);

subplot(2,3,3);
imshow(M);title('erozja');

I = imread('ertka.bmp');

M = imdilate(I, strel('square', 3));

subplot(2,3,4);
imshow(M);title('dylataqcja');

I = imread('ertka.bmp');

M = imopen(I, strel('square', 3));

subplot(2,3,5);
imshow(M);title('open');

I = imread('ertka.bmp');

M = imclose(I, strel('square', 3));

subplot(2,3,6);
imshow(M);title('close');

I = imread('ertka.bmp');
M = imerode(I, strel('square', 3));
M = imdilate(M, strel('square', 3));
M = imdilate(M, strel('square', 3));
figure;
imshow(M);



I = imread('hom.bmp');
figure;
subplot(1,2,1);
imshow(I);
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

M = bwhitmiss(I, SE1, SE2);

subplot(1,2,2);
imshow(M);

