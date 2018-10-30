clearvars;
close all;
clc;

I = imread('100zloty.jpg');
Igray = rgb2gray(I);

%b(1) - najmłodszy bit, b(8) - najstarszy bit
b(:,:,8) = zeros(847,1661);

for i = 1:8
    b(:,:,i) = (bitget(Igray,i));
end

figure;
subplot(3,3,1);
imshow(I);
title('Originał');
    
for i = 2:9
    subplot(3,3,i);
    imshow(b(:,:,i-1));
    title(strcat('bit ', num2str(i-1)));
end

Ibinary = uint8(cat(3,b(:,:,1),b(:,:,2),b(:,:,3),b(:,:,4),b(:,:,5),b(:,:,6),b(:,:,7),b(:,:,8)));

for i = 1:8
   b(:,:,i) =  uint8(Ibinary(:,:,i)*(2^(i-1)));
end


figure;
subplot(2,2,1);
imshow(Igray);
title('Originał');

subplot(2,2,2);
imshow(uint8(b(:,:,8)+b(:,:,7)));
title('bit 7+8');

subplot(2,2,3);
imshow(uint8(b(:,:,8)+b(:,:,7)+b(:,:,6)));
title('bit 6+7+8');

subplot(2,2,4);
imshow(uint8(b(:,:,8)+b(:,:,7)+b(:,:,6)+b(:,:,5)+b(:,:,4)));
title('bit 4+5+6+7+8');


