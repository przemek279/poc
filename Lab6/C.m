close all;
clc;
clearvars;

I = imread('moon.bmp');

M = [0 1 0; 1 -4 1; 0 1 0];

M = M/9;

If = conv2(I, M, 'same');

figure;
subplot(1,3,1);
imshow(I); title('ori ');
subplot(1,3,2);
imshow(abs(If), []); title('filtr abs');
subplot(1,3,3);
imshow(If + 128, []); title('filtr +128');

M = fspecial('laplacian', 0.5);
If = uint8(conv2(I, M, 'same'));
If = imabsdiff(I,If);

figure;
subplot(1,3,1);
imshow(I); title('ori ');
subplot(1,3,2);
imshow(If, []); title('filtr div');


If = uint8(conv2(I, M, 'same'));
If = imadd(I,If);

subplot(1,3,3);
imshow(If, []); title('filtr add');
