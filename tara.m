pkg load image
N=100;
image = imread('22.jpg');
imwrite(image, 'image.jpg', 'jpg');
A = im2double(image);

[rows, cols] = size(A);
TotalSingularValues = min(size(A));

[U, S, V] = svd(A);

SN = zeros(N,N);
for i=1:N
    SN(i,i)=S(i,i);
end

Usmaller = U(:,1:N);
Vsmaller = V(:,1:N);

AN = Usmaller*SN*(Vsmaller');

newimage = im2uint8(AN);
print -djpg newimage.jpg

CompressionRatio = (rows*N + cols*N + N)/(rows*cols)	
