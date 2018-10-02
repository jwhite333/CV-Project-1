function [outputImage] = temporalFilter(Image)

filter = (0.5 * [-1 0 1])';
dim = size(Image);
outputImage = zeros(dim(1), dim(2), dim(3)-2);
for i = 1: dim(1)
   for j = 1:dim(2)
     for n = 2:dim(3)-1
         outputImage(i,j, n-1) = [Image(i,j, n-1) Image(i,j, n) Image(i,j,n+1)]*filter;
     end
   end
end
end