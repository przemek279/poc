clearvars;
clc;
close all;

I = imread('dom.png');

figure;
subplot(1,4,1);
imshow(I);title('ori');
subplot(1,4,2);
eI = edge(I, 'log');
imshow(eI);title('log');
subplot(1,4,3);
eI = edge(I, 'canny');
imshow(eI);title('canny');
subplot(1,4,4);
eI = edge(I, 'sobel');
imshow(eI);title('sobel');


figure;
subplot(1,4,1);
imshow(I);title('ori');
subplot(1,4,2);
eI = edge(I, 'log', 0.003);
imshow(eI);title('log');
subplot(1,4,3);
eI = edge(I, 'canny', [0.15 0.18]); 
imshow(eI);title('canny');
subplot(1,4,4);
eI = edge(I, 'sobel', 0.13); 
imshow(eI);title('sobel');