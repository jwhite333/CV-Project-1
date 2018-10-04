function [outputImage] = boxFilter(Image, filterSize)
dim = size(Image);
outputImage = Image;

for n=1:dim(3)
    outputImage(:,:,n)=imboxfilt(Image(:,:,n), filterSize);
end
end