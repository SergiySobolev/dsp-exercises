L = 256;
N = 19;
f = ones(N)/(N*N);
I = rgb2gray(imread('squi.bmp'));
FI = imfilter(I,f,'conv');
AFI = aaimfilter(I, N);

[w,h] = size(I);

figure
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imshow(FI);
subplot(2,2,3);
imshow(AFI);


function fi = aaimfilter(I, N) 
    [m,n] = size(I);
    N2 = N*N;
    halfN = floor(N/2);
    filter = ones(N,N)./N2;
    BI = zeros(m+N-1, n+N-1);
    BI(halfN+1:m+halfN, halfN+1:n+halfN) = I;    
    RI = zeros(m,n);
    RI1 = zeros(m,n);
    
    for i=halfN+1:m-halfN
        BIf = I(i-halfN:i+halfN, 1:N);
        v = sum(BIf(:));
        for j=halfN+1:n-halfN-5
            r=floor(v/N2);
            RI1(i,j) = r;
            curF=I(i-halfN:i+halfN, j-halfN:j-halfN);
            nextF=I(i-halfN:i+halfN, j+halfN+1:j+halfN+1);
            dif = minus(double(nextF),double(curF));
            sdif = sum(dif(:));           
            v=v+sdif;
        end
    end
    
    fi = mat2gray(RI1);    
end

function r = myfilter(I,f,x,y)   
    N = size(f,1);   
    [m,n] = size(I);
    halfN = floor(N/2);
    BI = zeros(m+N-1, n+N-1);
    BI(halfN+1:m+halfN, halfN+1:n+halfN) = I;
    BIf =  BI(x:x+N-1, y:y+N-1);    
    r = floor(sum(sum(f.*BIf)));
end