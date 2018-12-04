clearvars;
clc;
close all;

I = imread('lab112.png');


figure;
subplot(1,2,1);
imshow(I);title('ori');

I = im2bw(I,0.13);
subplot(1,2,2);
imshow(I);title('bw');

I = imdilate(I,[1 1 1;1 1 1;1 1 1]);
I = imopen(I,[1 1 1;1 1 1;1 1 1]);


figure;
subplot(1,3,1);
imshow(I);title('ori');

eI = edge(I, 'canny');
subplot(1,3,2);
imshow(eI);title('canny');


[H, theta, rho] = hough(eI);

subplot(1,3,3);
imshow(H, []);

Max = houghpeaks(H, 8);
hold on;
plot(Max(:,2), Max(:,1), 'o');
%%
lines = houghlines(eI,theta,rho,Max,'FillGap',5,'MinLength',7);
figure, imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end