function [outputImage] = two_D_GaussinFilter(Image, sigma)
outputImage = imgaussfilt(Image, sigma);
end