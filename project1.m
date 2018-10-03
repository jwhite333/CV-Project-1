clc
clear

% Data Sets
% 1 = Office
% 2 = RedChair
% 3 = EnterExitCrossingPaths2cor
dataSet = 2;
dataSetName = {'Office', 'RedChair', 'EnterExitCrossingPaths2cor'};

% Get file paths to sample data
filePath = [];
filePath.path = fullfile('sample_data', dataSetName{dataSet}, dataSetName{dataSet});
filePath.images = fullfile(filePath.path,'*.jpg');
srcFiles = dir(filePath.images);

% Set threshold for high temporal derivative
threshold = 15;

% Set derivative filter
derivativeFilter = [-1,0,1];

% Create initial temp matrix of 3 images
temporalImages = rgb2gray(imread(fullfile(filePath.path,srcFiles(1).name)));
temporalImages(:,:,2) = rgb2gray(imread(fullfile(filePath.path,srcFiles(2).name)));
temporalImages(:,:,3) = rgb2gray(imread(fullfile(filePath.path,srcFiles(3).name)));

% Get image size
imageDim = size(temporalImages);
imageDimX = imageDim(1);
imageDimY = imageDim(2);

% Create image to monitor motion
motionCapImage(1:imageDimX,1:imageDimY) = 0;
results = [];

% Loop through data set in intervals of 3 images
disp(length(srcFiles));
for image = 3:(length(srcFiles)-1)

    % Set temp image points = 0
    motionCapImage = zeros(size(motionCapImage));

    % Get derivative
    for i = 1:imageDimX
        for j = 1:imageDimY
            pixelValues(1:3) = double(temporalImages(i,j,1:3));
            pixelDerivative = derivativeFilter * pixelValues.';
            if abs(pixelDerivative) > threshold
                motionCapImage(i,j) = 1;
            end
        end
    end

    % Output motion capture image
    figure(1)
    imshow(motionCapImage);
    figure(2)
    imshow(temporalImages(:,:,2));
    
    % Write to file
    if 7 ~= (exist('results', 'dir'))
        mkdir('results');
    end
    imwrite(motionCapImage, fullfile('results',srcFiles(image-1).name));

    % Get new image
    temporalImages(:,:,1) = temporalImages(:,:,2);
    temporalImages(:,:,2) = temporalImages(:,:,3);
    disp(image+1);
    temporalImages(:,:,3) = rgb2gray(imread(fullfile(filePath.path,srcFiles(image+1).name)));

end

% Temporarily removing this while I change it to work using 3 images at
% a time

% read the frame of the image
% for i = 1 : length(srcFiles)
%     filename = fullfile(filePath.path,srcFiles(i).name);
%     Image(:,:,i)= rgb2gray(imread(filename));
% end
% 
% temporalImage = temporalFilter(double(Image));
% maskOutput = mask(temporalImage,threshold);
% temp = double(Image(:,:,2:length(srcFiles)-1)).* maskOutput;
% 
% out = one_D_Gaussin(double(Image) ,2);
% dim=size(out);
% x= floor((length(srcFiles)-dim(3))/2);
% maskOutput1 = mask(double(Image(:,:,1+x:length(srcFiles)-x)) - out,threshold);
% temp1 = double(Image(:,:,1+x:length(srcFiles)-x)).* maskOutput1;
% 
% figure
% imshow(Image(:,:,51));
% 
% figure
% imshow(temp(:,:,50));
% 
% figure
% imshow(temp1(:,:,47));
