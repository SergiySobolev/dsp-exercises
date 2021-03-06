L = 256;
N = 20;
I = rgb2gray(imread('squi.bmp'));
RI = I;

[w,h] = size(I);


for i=1:h-N
    l1 = i;
    l2 = i + N -1;
    IN = I(1:N, l1:l2);
    HN = imhist(IN);

    for j=1:w-N      
        t1 = j;
        t2 = j + N -1;  
        IN = I(t1:t2,  l1:l2);
        curI = I(t1:t2,  l1:l2);
        curH = imhist(curI);
        cdfR = cdf(HN, L);       
        eqI = equalizeImage(IN, cdfR);
        RI(t1:t2,  l1:l2) = eqI;       
        rs = I(t1:t1, l1:l2);
        ra = I(t2+1:t2+1, l1:l2);
        HN = updateHistogram(HN, rs, ra, L);        
    end;
end;

figure
subplot(3,2,1);
imshow(I);

H = imhist(I);
subplot(3,2,2);
plot(imhist(I));

subplot(3,2,3);
imshow(RI);

subplot(3,2,4);
plot(imhist(RI));

EI = histeq(I);

HI = imhist(EI,L);

subplot(3,2,5);
imshow(EI);

subplot(3,2,6);
plot(imhist(EI,L));

function uh = updateHistogram(h, rs, ra, L)
    rsL =  zeros(L,1);
    for i=1:size(rs,2)
        r = rs(i)+1;
        rsL(r) = rsL(r) + 1;
    end;
    
    raL =  zeros(L,1);
    for i=1:size(ra,2)
        r = ra(i)+1;
        raL(r) = raL(r) + 1;
    end;
    rcL = raL - rsL;
    uh = h + rcL;
end

function cs = cdf(h, L)    
    cs = round((cumsum(h)./ sum(h)) * L);
end

function eqI = equalizeImage(I, f)
    [w,h] = size(I);
    eqI = uint8(zeros(w,h));
    for i=1:w
       for j=1:h
          eqI(i,j) = f(I(i,j)+1);
       end
    end    
end