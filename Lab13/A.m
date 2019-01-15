clearvars;
close all;
clc;

I = imread('dwieFale.bmp');

fI = fft2(I);

figure();
subplot(2,2,1);
imshow(I);

subplot(2,2,2);
imshow(fI);

AA = abs(fI);
AA = log10(AA+1);

subplot(2,2,3);
imshow(AA,[]);

F = angle(fI.*(AA>0.0001));

subplot(2,2,4);
imshow(F,[]);

figure();
subplot(1,2,1);
imshow(I);
fI = fftshift(fI);

subplot(1,2,2);
II = ifft2(ifftshift((fI)));
imshow(II, []);

I1 = imread('kolo.bmp');
I2 = imread('kwadrat.bmp');
I3 = imread('kwadrat45.bmp');
I4 = imread('trojkat.bmp');

figure;
subplot(2,4,1);
imshow(I1);
subplot(2,4,2);
imshow(fftshift(fft2(I1)));


subplot(2,4,3);
imshow(I2);
subplot(2,4,4);
imshow(fftshift(fft2(I2)));


subplot(2,4,5);
imshow(I3);
subplot(2,4,6);
imshow(fftshift(fft2(I3)));


subplot(2,4,7);
imshow(I4);
subplot(2,4,8);
imshow(fftshift(fft2(I2)));



