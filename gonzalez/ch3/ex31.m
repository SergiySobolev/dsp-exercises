L = 256;
A = 128;

a = -(log(1/2)/(L*L));

I = imread('coins.png');
set(0,'defaultfigureposition',[150,250,1200,600]);
figure
subplot(1,3,1)
imshow(I);
 
r = 1:1:700;
t = A*exp(-a*(r.*r));
TI = t(I);

subplot(1,3,2)
imshow(uint8(TI));

subplot(1,3,3)
plot(r,t);
hold on;
plot(L, t(L),'r.')
text(L,t(L),'(L, A/2) \rightarrow   ','HorizontalAlignment','right');
title(sprintf('L=%d, A=%d', L, A));
