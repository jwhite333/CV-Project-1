clc
clear

%
% 1 = Office
% 2 = RedChair
% 3 = EnterExitCrossingPaths2cor
folder = 2;
dataList = {'Office', 'RedChair', 'EnterExitCrossingPaths2cor'};

threshold = 15;
filePath =[];
filePath.path = fullfile('sample_data', dataList{folder}, dataList{folder});
filePath.images = fullfile(filePath.path,'*.jpg');

srcFiles = dir(filePath.images);

% read the frame of the image
for i = 1 : length(srcFiles)
    filename = fullfile(filePath.path,srcFiles(i).name);
    Image(:,:,i)= rgb2gray(imread(filename));
end

temporalImage = temporalFilter(double(Image));
maskOutput = mask(temporalImage,threshold);
temp = double(Image(:,:,2:length(srcFiles)-1)).* maskOutput;

out = one_D_Gaussin(double(Image) ,2);
dim=size(out);
x= floor((length(srcFiles)-dim(3))/2);
maskOutput1 = mask(double(Image(:,:,1+x:length(srcFiles)-x)) - out,threshold);
temp1 = double(Image(:,:,1+x:length(srcFiles)-x)).* maskOutput1;

figure
imshow(Image(:,:,51));

figure
imshow(temp(:,:,50));

figure
imshow(temp1(:,:,47));
