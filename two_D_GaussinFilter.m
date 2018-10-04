function [outputImage] = two_D_GaussinFilter(Image, sigma)
dim=size(Image);
for n=1:dim(3)
    outputImage(:,:,n) = imgaussfilt(Image(:,:,n), sigma);
end
end