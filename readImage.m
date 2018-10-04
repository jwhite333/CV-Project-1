function readImage(filePath, resultFolder, threshold, tsigma, ssigma, Derivativechoice, smoothingChoice)
srcFiles = dir(filePath.images);

% derivative filter choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
switch Derivativechoice
    case 1
        % Set 1-Dderivative filter
        derFilterSize = 3;
        derivativeFilter = 0.5 * [-1,0,1];
    case 2
        % 1D derivative of a Gaussian
        derFilterSize = 7;
        gaussianFilter = fspecial ('gauss', [1 7], tsigma);
end

% Create initial temp matrix for images
temporalImages = smoothImage(rgb2gray(imread(fullfile(filePath.path,srcFiles(1).name))), smoothingChoice);
for n = 2:derFilterSize
    temporalImages(:,:,n) = smoothImage(rgb2gray(imread(fullfile(filePath.path,srcFiles(n).name))), smoothingChoice);
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
end
if 7 ~= (exist(fullfile('results', resultFolder), 'dir'))
    mkdir(fullfile('results', resultFolder));
end

% Loop through data set in intervals of 'derFilterSize' images
disp(length(srcFiles));
for image = derFilterSize:(length(srcFiles)-1)

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
    % figure(1)
    % imshow(motionCapImage);
    % figure(2)
    % imshow(temporalImages(:,:,ceil(derFilterSize/2)));
    
    % Write to file This Line is broken for me
    imwrite(motionCapImage, fullfile('results', resultFolder, srcFiles(image-floor(derFilterSize/2)).name));
    
    % Get new image
    for n = 1:derFilterSize - 1
        temporalImages(:,:,n) = temporalImages(:,:,n+1);
    end
    temporalImages(:,:,derFilterSize) = smoothImage(rgb2gray(imread(fullfile(filePath.path, srcFiles(image+1).name))), smoothingChoice);
end

end