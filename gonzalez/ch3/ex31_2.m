L = 256;
B = 128;

a = (log(1/2)/(L*L));

I = imread('coins.png');
set(0,'defaultfigureposition',[150,250,1200,600]);
figure
subplot(1,3,1)
imshow(I);
 
r = 1:1:900;
t = B*(1-exp(a*(r.*r)));
TI = t(I);

subplot(1,3,2)
imshow(uint8(TI));

subplot(1,3,3)
plot(r,t);
hold on;
plot(L, t(L),'r.')
text(L,t(L),'  \leftarrow (L, B/2)   ','HorizontalAlignment','left');
title(sprintf('L=%d, B=%d', L, B));
