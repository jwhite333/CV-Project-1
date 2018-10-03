function [maskOutput] = mask(Image, threshold)
dim=size(Image);
for i = 1: dim(1)
    for j = 1:dim(2)
       maskOutput(i,j,:) =  abs(Image(i,j,:)) > threshold;
    end
end