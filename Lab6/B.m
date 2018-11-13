close all;
clc;
clearvars;

I = imread('lenaSzum.bmp');

If = medfilt2(I,[3 3]);

figure;
subplot(1,3,1);
imshow(I); title('ori ');
subplot(1,3,2);
imshow(If); title('filtr med');
subplot(1,3,3);
imshow(imabsdiff(I, If), []); title('Różnica');


I = imread('lena.bmp');
If = medfilt2(I,[3 3]);
M = fspecial('average');
If = uint8(conv2(If, M, 'same'));



figure;
subplot(1,3,1);
imshow(I); title('ori');
subplot(1,3,2);
imshow(If); title('filtr med śred');
subplot(1,3,3);
imshow(imabsdiff(I, If), []); title('Różnica');

    If = medfilt2(I,[5 5]);
for i = 1:9
    If = medfilt2(If,[5 5]);
end


figure;
subplot(1,3,1);
imshow(I); title('ori');
subplot(1,3,2);
imshow(If); title('filtr med x10');
subplot(1,3,3);
imshow(imabsdiff(I, If), []); title('Różnica');






