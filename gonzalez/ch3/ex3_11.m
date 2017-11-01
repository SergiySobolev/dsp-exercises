L = 256;
N = 100;
I = rgb2gray(imread('squi.bmp'));
RI = I;

[w,h] = size(I);

for j=1:(h/N+1)
    t1 = (j-1)*N + 1;
    t2 = min(j*N,h);
    for i=1:(w/N+1)  
        l1 = (i-1)*N + 1;
        l2 = min(i*N,w);         
        SI = I(l1:l2, t1:t2);
        RI(l1:l2, t1:t2) = histeq(SI, L);
    end;
end;



figure
subplot(1,4,1);
imshow(I);

subplot(1,4,2)
plot(imhist(I));

subplot(1,4,3)
imshow(RI);

subplot(1,4,4)
plot(imhist(RI));