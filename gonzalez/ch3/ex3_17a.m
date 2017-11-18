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
    RI = zeros(m,n);
    
    for i=halfN+1:m-halfN
        BIf = I(i-halfN:i+halfN, 1:N);
        v = sum(BIf(:));
        for j=halfN+1:n-halfN-5
            r=floor(v/N2);
            RI(i,j) = r;
            curF=I(i-halfN:i+halfN, j-halfN:j-halfN);
            nextF=I(i-halfN:i+halfN, j+halfN+1:j+halfN+1);
            dif = minus(double(nextF),double(curF));
            sdif = sum(dif(:));           
            v=v+sdif;
        end
    end
    
    fi = mat2gray(RI);    
end

