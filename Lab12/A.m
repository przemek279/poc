clc;
clearvars;
close all;

I = imread('ccl1.png');

figure;
subplot(2,2,1);
imshow(I);

[YY, XX] = size(I);

L = 1;
N = 100;
id = zeros(N);

for i = 1:N
    id(i) = i;
end
for i = 2:YY
   for j = 2:(XX-1)
       if (I(i,j) ~= 0)
          sasiedzi = [I(i-1,j-1) I(i-1,j) I(i-1,j+1) I(i,j-1)];
          
          suma = sum(sasiedzi);
          
          if suma == 0
             I(i,j) = L;
             L = L + 1;
          else
              sasiedzi = nonzeros(sasiedzi);
              mini = min(sasiedzi);
              maxi = max(sasiedzi);
              
              if mini == maxi
                  I(i,j) = mini;
              else
                  id = union(mini, maxi, id);
                  I(i,j) = mini;
              end
          end
       end
   end
end

subplot(2,2,2);
imshow(label2rgb(I));

lut = id;
for i = 1:N
    lut(i) = root(i,id);
end

for i = 1:YY
   for j = 1:XX
        if(I(i,j) > 0)
             I(i,j) = lut(I(i,j));      
        end
   end
end

subplot(2,2,3);
imshow(imread('ccl1Result.png'));

subplot(2,2,4);
imshow(I,[]);

figure;
histogram(I);

function index = root(index, id)
    while id(index) ~= index
        index = id(index);        
    end
end

function id = union(p,q, id)
    id(root(p,id)) = root(q,id);
end