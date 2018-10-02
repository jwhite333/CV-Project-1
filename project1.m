clc
clear

%
% 1 = Office
% 2 = RedChair
% 3 = EnterExitCrossingPaths2cor
folderName = ImageFolderName(2);
path = strcat(folderName,'*.jpg');
srcFiles = dir(path);

% read the frame of the image
for i = 1 : length(srcFiles)
    filename = strcat(folderName,srcFiles(i).name);
    A = imread(filename);
    Image(:,:,i)= rgb2gray(A);
end
%temporalImage = temporalFilter(double(Image));

smoothFilter3=smoothingFilter(Image, 3);


%for testing only
figure
imshow(Image(:,:,1));

%figure
%imshow(temporalImage(:,:,1));
figure
imshow(smoothFilter3(:,:,1));
