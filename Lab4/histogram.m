clearvars;
close all;
clc;

I1 = imread('lena1.bmp');
I2 =imread('lena2.bmp');
I3 =imread('lena3.bmp');
I4 =imread('lena4.bmp');
 

figure;
subplot(4,2,1);
imshow(I1); subplot(4,2,2); imhist(I1, 256);
subplot(4,2,3);
imshow(I2); subplot(4,2,4); imhist(I2, 256);
subplot(4,2,5);
imshow(I3); subplot(4,2,6); imhist(I3, 256);
subplot(4,2,7);
imshow(I4); subplot(4,2,8); imhist(I4, 256);

figure;
Ih = imread('hist1.bmp');
subplot(2,2,1);
imshow(Ih); subplot(2,2,2); imhist(Ih, 256);

Ia = imadjust(Ih);
subplot(2,2,3);
imshow(Ia); subplot(2,2,4); imhist(Ia);

[H,x] = imhist(Ih);
%bar([x,H]);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;


figure;
hold on;
plot(x,H);
plot(x, C2);
hold off;

Lut = 1:256;
for i = 1:256
    Lut(i) = (C2(i)/C2(256))*256;
end

IHLut = intlut(Ih, uint8(Lut));

figure;
subplot(3,1,1);
imshow(IHLut);
subplot(3,1,2);
imhist(IHLut);
subplot(3,1,3);

[H,x] = imhist(IHLut);
%bar([x,H]);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;

hold on;
plot(x,H);
plot(x, C2);
hold off;


figure;
imshow(histeq(Ih));

Ih2 = imread('hist2.bmp');
Ih3 = imread('hist3.bmp');
Ih4 = imread('hist4.bmp');

figure;
subplot(2,2,1);
imshow(imadjust(Ih2));
subplot(2,2,2);
imshow(histeq(Ih2));
subplot(2,2,3);
imshow(adapthisteq(Ih2));
subplot(2,2,4);
imshow(Ih2);

figure;
subplot(2,2,1);
imshow(imadjust(Ih3));
subplot(2,2,2);
imshow(histeq(Ih3));
subplot(2,2,3);
imshow(adapthisteq(Ih3));
subplot(2,2,4);
imshow(Ih3);

figure;
subplot(2,2,1);
imshow(imadjust(Ih4));
subplot(2,2,2);
imshow(histeq(Ih4));
subplot(2,2,3);
imshow(adapthisteq(Ih4));
subplot(2,2,4);
imshow(Ih4);

