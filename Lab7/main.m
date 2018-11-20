clearvars;
close all;
clc;

load MR_data.mat;

figure;
subplot(3,3,1);
imshow(uint8(I_noisy3));

subplot(3,3,2);
imshow(convolution(I_noisy3, [9 9]), []);


subplot(3,3,3);
imshow(bilateral(I_noisy3, [9 9]), []);

subplot(3,3,4);
imshow(uint8(I_noisy2));

subplot(3,3,5);
imshow(convolution(I_noisy2, [9 9]), []);


subplot(3,3,6);
imshow(bilateral(I_noisy2, [9 9]), []);



subplot(3,3,7);
imshow(uint8(I_noisy4));

subplot(3,3,8);
imshow(convolution(I_noisy4, [9 9]), []);


subplot(3,3,9);
imshow(bilateral(I_noisy4, [9 9]), []);