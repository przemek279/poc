clearvars;
close all;
clc;

I = imread('ferrari.bmp');

figure;
subplot(2,4,1);
imshow(I); title('ori');

Me = imerode(I, strel('square', 3));
subplot(2,4,2);
imshow(Me); title('ero');


Md = imdilate(I, strel('square', 3));
subplot(2,4,3);
imshow(Md); title('dylat');


M = imabsdiff(Md, Me); 
subplot(2,4,4);
imshow(M); title('diff');


M = imopen(I, strel('square', 3));
subplot(2,4,5);
imshow(M); title('open');


M = imclose(I, strel('square', 3));
subplot(2,4,6);
imshow(M); title('close');

M = imtophat(I, strel('square', 3));
subplot(2,4,7);
imshow(M); title('tophat');


M = imbothat(I, strel('square', 3));
subplot(2,4,8);
imshow(M); title('bothat');



I = imread('rice.png');

figure;
subplot(1,2,1);
imshow(I); title('ori');

M = imtophat(I, strel('disk', 10));
subplot(1,2,2);
imshow(M); title('tophat');