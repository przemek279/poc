clearvars;
clc;
close all;

obraz = zeros(11,11);
obraz(1,1) = 1;
obraz(8,6) = 1;
obraz(7,8) = 1;
obraz(11,9) = 1;

[H, theta, rho] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure;
imshow(H, []);

ro = rho(142);
teta = theta(110);

x = 0:0.1:10;
y = ((ro - x*cosd(teta))/sind(teta));

figure;
imshow(obraz);
hold on;
plot(x+1, y+1);