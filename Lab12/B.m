clc;
clearvars;
close all;

I = imread('ccl2.png');

figure;
subplot(1,3,1);
imshow(I, []);

subplot(1,3,2);
imshow(bwlabel(I,4),[]);


subplot(1,3,3);
imshow(bwlabel(I,8),[]);