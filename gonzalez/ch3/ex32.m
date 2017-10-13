L = 256;
m = L/2;
e = 50;

r=1:L;

t = 1./(1+((m./r).^e));

I = imread('coins.png');
set(0,'defaultfigureposition',[150,250,1200,600]);
figure
subplot(1,3,1)
imshow(I);

subplot(1,3,2);
plot(r,t);

subplot(1,3,3)
TI = t(I);
imshow(TI);

