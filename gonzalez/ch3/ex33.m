L = 256;
I = myimread('squi.bmp');

figure;

subplot(3,3,1);
imshow(I);

for i=1:8
    mybit = uint8(mybitget(I,i));
    subplot(3,3,i+1);
    imshow(mybit*(2^i),[]);

end

figure;

subplot(3,3,1);
imshow(I);

for i=1:8
    bit = bitget(I,i);   
    subplot(3,3,i+1);
    imshow(bit*(2^i), [])
end

function r = mybitget(I,n)
    MI = I;
    for i=1:n-1
        MODI = mod(MI, 2);
        MI = (MI - MODI)/2;
    end
    r = rem(MI, 2);
    
end


function r = myimread(path)
    I = imread(path);
    if(size(I,3) == 3)
        I = rgb2gray(I);
    end
    r = I;
end
