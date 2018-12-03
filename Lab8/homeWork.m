clearvars;
close all;
clc;


load gra.mat;


I = gra2;

figure;

for i = 1:100
    lut = makelut(@funHome,3);
    
    I = applylut(I, lut);
    imshow(I);
    title(num2str(i));
    pause(1);
end
