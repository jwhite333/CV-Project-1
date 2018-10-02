function [outputImage] = GaussinFilter(Image, sigma)
outputImage = imgaussfilt(Image, sigma);
end