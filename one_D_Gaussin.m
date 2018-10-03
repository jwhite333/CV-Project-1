function [output] = one_D_Gaussin(Image, sigma)
filter = fspecial ('gauss', [1 7], sigma);
dim=size(Image);
for i = 1: dim(1)
   for j = 1:dim(2)
     for n = 4:dim(3)-3
         output(i,j,n-3) = reshape(Image(i,j,n-3:n+3), [1 7])*filter';
     end
   end
end
end