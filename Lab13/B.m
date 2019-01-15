clearvars;
close all;
clc;

I = imread('lena.bmp');

fI = fftshift(fft2(I));

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

[f1,f2] = freqspace(512, 'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);

Hd(r>0.1) = 0;

figure;
colormap(jet(64));
mesh(f1,f2,Hd);

Y = fI .* Hd;

figure;
imshow(Y);

h = fwind1(Hd, hanning(21));
[H f1 f2] = freqz2(h,512,512);
figure;
mesh(f1,f2,H);
%
H = fspecial('gaussian', 512, 100);

F = fftshift(fft2(imread('lena.bmp')));

IF = F .* H;
IF = ifft2(ifftshift(IF));
figure();
imshow(IF, []);