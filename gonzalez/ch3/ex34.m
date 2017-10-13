L = 256;
I = rgb2gray(imread('coins.png'));
[m,n] = size(I);
figure

subplot(2,3,1);
imshow(I);

subplot(2,3,2);
I1 = I - bitget(I,1)*2;
imshow(I1);


I2 = I - bitget(I,7)*2^7;
subplot(2,3,3);
imshow(I2);

subplot(2,3,4);
ih = imhist(I)./numel(I);
plot(ih);

subplot(2,3,5);
ih1 = imhist(I1)./numel(I1);
plot(ih1);


subplot(2,3,6);
ih2 = imhist(I2)./numel(I2);
plot(ih2);
