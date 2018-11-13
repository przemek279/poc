close all;
clc;
clearvars;

I = imread('kw.bmp');

load maskiPP.mat;

P1 = P1/9;

If = conv2(I, P1, 'same');
figure;
subplot(2,3,1);
imshow(I); title('ori ');
subplot(2,3,2);
imshow(abs(If), []); title('filtr abs P1');
subplot(2,3,3);
imshow(If + 128, []); title('filtr +128 P1');

P2 = P2/9;
If = conv2(I, P2, 'same');
subplot(2,3,4);
imshow(abs(If), []); title('filtr abs P2');
subplot(2,3,5);
imshow(If + 128, []); title('filtr +128 P2');



R1 = R1/9;

If = conv2(I, R1, 'same');
figure;
subplot(2,3,1);
imshow(I); title('ori ');
subplot(2,3,2);
imshow(abs(If), []); title('filtr abs R1');
subplot(2,3,3);
imshow(If + 128, []); title('filtr +128 R1');

R2 = R2/9;
If = conv2(I, R2, 'same');
subplot(2,3,4);
imshow(abs(If), []); title('filtr abs R2');
subplot(2,3,5);
imshow(If + 128, []); title('filtr +128 R2');



S1 = S1/9;

If = conv2(I, S1, 'same');
figure;
subplot(2,3,1);
imshow(I); title('ori ');
subplot(2,3,2);
imshow(abs(If), []); title('filtr abs S1');
subplot(2,3,3);
imshow(If + 128, []); title('filtr +128 S1');

S2 = S2/9;
If = conv2(I, S2, 'same');
subplot(2,3,4);
imshow(abs(If), []); title('filtr abs S2');
subplot(2,3,5);
imshow(If + 128, []); title('filtr +128 S2');


If = sqrt((conv2(I, S1, 'same').^2+conv2(I, S2, 'same').^2));
figure;
subplot(1,3,1);
imshow(I); title('ori ');
subplot(1,3,2);
imshow(If, []); title('filtr Kombinowany');

If = (abs(conv2(I, S1, 'same'))+abs(conv2(I, S2, 'same')));

subplot(1,3,3);
imshow(If, []); title('filtr Kombinowany abs');

