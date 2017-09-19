L = 256;
C = 64;
D = 128;
a = (log(1/2)/(L*L));

I = imread('coins.png');
set(0,'defaultfigureposition',[150,250,1200,600]);
figure
subplot(1,3,1)
imshow(I);
 
r = 1:1:900;
t = (D-C)*(1-exp(a*(r.*r))) + C;
TI = t(I);

subplot(1,3,2)
imshow(uint8(TI));

subplot(1,3,3)
plot(r,t);
hold on;


