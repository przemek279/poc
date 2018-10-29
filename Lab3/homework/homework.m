clearvars;
close all;
clc;


I = imread('100zloty.jpg');
Igray = rgb2gray(I);

%b(1) - najmniejznaczące bity, b(8) - najbardziej znaczące bity
b = zeros(1,5);

for i = 1:8
    b(i) = double(bitget(Igray,i));
end

figure;
subplot(3,3,1);
imshow(I);
title('Originał');
    
for i = 2:9
    subplot(3,3,i);
    imshow(b(i-1));
    title('bit ' + (i-1));
end

Ibinary = uint8(cat(8,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8)));

for i = 1:8
   b(i) =  Ibinary(:,:,i)*(power(2, i-1));
end

figure;
imshow(b(8)+b(7));

figure;
imshow(b(8)+b(7)+b(6)+b(5)+b(4));