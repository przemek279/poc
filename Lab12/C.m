clc;
clearvars;
close all;

I = imread('shapes.png');

figure;
subplot(2,2,1);
imshow(I,[]);

I = bwlabel(I,4);

subplot(2,2,2);
imshow(I,[]);

wsp = obliczWspolczynniki(I);

[YY, XX] = size(I);

for i = 1:YY
   for j = 1:XX
       piksel = I(i,j);
       if (piksel ~= 0 && ~(wsp(piksel,2) > 0.33 && wsp(piksel,2) < 0.66))
           I(i,j) = 0;
       end
   end
end

subplot(2,2,3);
imshow(I,[]);


I = imread('shapesReal.png');
figure;
subplot(2,2,1);
imshow(I,[]);

I = imerode(imcomplement(im2bw(I,0.25)),strel('rectangle',[5 5]));

subplot(2,2,2);
imshow(I,[]);

I = bwlabel(I,4);
subplot(2,2,3);
imshow(I,[]);

wsp = obliczWspolczynniki(I);

[YY, XX] = size(I);

for i = 1:YY
   for j = 1:XX
       piksel = I(i,j);
        if (piksel ~= 0 && ~(wsp(piksel,2) > 0.5 && wsp(piksel,2) < 0.66))
           I(i,j) = 0;
       end
   end
end

subplot(2,2,4);
imshow(imerode(I,strel('rectangle',[5 5])),[]);

