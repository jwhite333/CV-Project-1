function readImage(filePath, resultFolder, threshold, tsigma, ssigma, Derivativechoice, smoothingChoice)
srcFiles = dir(filePath.images);

% derivative filter choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
switch Derivativechoice
    case 1
        % Set 1-Dderivative filter
        index = 3;
        derivativeFilter = 0.5 * [-1,0,1];
    case 2
        % 1D derivative of a Gaussian
        index = 7;
        gaussianFilter = fspecial ('gauss', [1 7], tsigma);
end

% Create initial temp matrix for images
temporalImages = rgb2gray(imread(fullfile(filePath.path,srcFiles(1).name)));
for n = 2:index
    temporalImages(:,:,n) = rgb2gray(imread(fullfile(filePath.path,srcFiles(n).name)));
end

% Get image size
imageDim = size(temporalImages);
imageDimX = imageDim(1);
imageDimY = imageDim(2);

% Create image to monitor motion
motionCapImage(1:imageDimX,1:imageDimY) = 0;

% Create result folder
if 7 ~= (exist('results', 'dir'))
    mkdir('results', resultFolder);
else
    mkdir(fullfile('results', resultFolder));
end

% Loop through data set in intervals of 3 images
disp(length(srcFiles));
for image = 4:(length(srcFiles)-1)
    
    % Spatial smoothing choice
    switch smoothingChoice
        case 1
            % none
        case 2
            % 3x3 box filter
            temporalImages = boxFilter(temporalImages, 3);
        case 3
            % 5x5 box filter
            temporalImages = boxFilter(temporalImages, 5);
        case 4
            % 2D Gaussian filters
            temporalImages = two_D_GaussinFilter(temporalImages, ssigma);
    end
    
    % Set temp image points = 0
    motionCapImage = zeros(size(motionCapImage));
    
    % Get derivative
    for i = 1:imageDimX
        for j = 1:imageDimY
            switch Derivativechoice
                case 1
                    % Use derivative filter 0.5[-1 0 1]
                    pixelValues(1:3) = double(temporalImages(i,j,1:3));
                    pixelDerivative = derivativeFilter * pixelValues.';
                case 2
                    % Use the 1D gaussian filter
                    pixelValues(1:7) = double(temporalImages(i,j,1:7));
                    tempValue = gaussianFilter * pixelValues.';
                    pixelDerivative = double(temporalImages(i,j,4)) - tempValue;
            end
            
            % Generate the Mask
            if abs(pixelDerivative) > threshold
                motionCapImage(i,j) = 1;
            end
        end
    end
    
    % Output motion capture image
    %     figure(1)
    %     imshow(motionCapImage);
    %     figure(2)
    %     imshow(temporalImages(:,:,2));
    
    % Write to file
    imwrite(motionCapImage, fullfile('results', resultFolder, srcFiles(image-1).name));
    
    % Get new image
    for n = 1:index - 1
        temporalImages(:,:,n) = temporalImages(:,:,n+1);
    end
    disp(image+1);
    temporalImages(:,:,index) = rgb2gray(imread(fullfile(filePath.path, srcFiles(image+1).name)));
    
end

end