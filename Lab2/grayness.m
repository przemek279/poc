clearvars;
close all;
clc;

I = (imread('lena.bmp'));

figure;
I = imresize(I,[128,128]);

subplot(2,3,1);
imshow(imadjust(I,[0, 1],[0, 31/255]),[]);
subplot(2,3,2);
imshow(imadjust(I,[0, 1],[0, 15/255]),[]);
subplot(2,3,3);
imshow(imadjust(I,[0, 1],[0, 7/255]),[]);
subplot(2,3,4);
imshow(imadjust(I,[0, 1],[0, 3/355]),[]);
subplot(2,3,5);
imshow(imadjust(I,[0, 1],[0, 1/255]),[]);