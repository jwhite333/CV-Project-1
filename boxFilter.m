function [outputImage] = boxFilter(Image, filterSize)
[m, n, t] = size(Image);
outputImage = Image;

for n=1:t
    outputImage(:,:,n)=imboxfilt(Image(:,:,n), filterSize);
end
end