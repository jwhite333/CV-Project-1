function [outputImage] = two_D_GaussinFilter(Image, sigma)
[m,n,d]=size(Image);
outputImage = Image;
for n=1:d
    outputImage(:,:,n) = imgaussfilt(Image(:,:,n), sigma);
end
end