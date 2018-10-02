function [outputImage] = smoothingFilter(Image, filterSize)
dim = size(Image);
outputImage = Image;
x=floor(filterSize/2);

for n=1:dim(3)
    for i=1+x:dim(1)-x
        for j = 1+x:dim(2)-x
            outputImage(i,j,n)=mean(Image(i-x:i+x,j-x:j+x),'all');
        end
    end
end
end
