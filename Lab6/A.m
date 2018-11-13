close all;
clc;
clearvars;

I = imread('plansza.bmp');

M = fspecial('average');

If = uint8(conv2(I, M, 'same'));

figure;
subplot(1,3,1);
imshow(I); title('ori');
subplot(1,3,2);
imshow(If); title('filtr');
subplot(1,3,3);
imshow(imabsdiff(I, If), []); title('Różnica');


%%

okno = [3,5,9,15,35];

figure;

for i = 1:5
   M = fspecial('average', okno(i));
   If = uint8(conv2(I, M, 'same'));
   subplot(2,3,i);
   imshow(If); title(['filtr okna', num2str(okno(i))]);
end



L = imread('lena.bmp');
M = fspecial('average');
Lf = uint8(conv2(L, M, 'same'));
subplot(2,3,6);
imshow(Lf);

%%

I = imread('lena.bmp');

M = [1 2 1; 2 4 2; 1 2 1];
M = M/sum(sum(M));

If = uint8(conv2(I, M, 'same'));

figure;
subplot(1,3,1);
imshow(I); title('ori');
subplot(1,3,2);
imshow(If); title('filtr');
subplot(1,3,3);
imshow(imabsdiff(I, If), []); title('Różnica');


%%


I = imread('lena.bmp');

M = fspecial('gaussian', 5, 0.5);

If = uint8(conv2(I, M, 'same'));

figure;
subplot(2,2,1);
imshow(I); title('ori');
subplot(2,2,2);
imshow(If); title('filtr gauss');
subplot(2,2,3);
imshow(imabsdiff(I, If), []); title('Różnica');
subplot(2,2,4);
mesh(M); title('mesh gauss');




