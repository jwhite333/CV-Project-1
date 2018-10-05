%% Parameter set up
clc
clear

% Data Sets
% 1 = Office
% 2 = RedChair
% 3 = EnterExitCrossingPaths2cor
dataSetName = {'Office', 'RedChair', 'EnterExitCrossingPaths2cor'};

% Set threshold for high temporal derivative
threshold = 15;

% TSigma value for 1D derivative gaussian
tsigma = 2;

% Standard deviation ssigma for 2D Gaussian filters
ssigma = 1.4;


for dataSet = 1:3
    % Get file paths to sample data
    filePath = [];
    filePath.path = fullfile('sample_data', dataSetName{dataSet}, dataSetName{dataSet});
    filePath.images = fullfile(filePath.path,'*.jpg');
    
    % Derivative filter choice
    % 1 = Temporal Derivative with filter 0.5[-1 0 1]
    % 2 = 1D derivative of a Gaussian
    for Derivativechoice=1:2
  
        % Spatial smoothing choice
        % 1 = none
        % 2 = 3x3 box filter
        % 3 = 5x5 box filter
        % 4 = 2D Gaussian filters
        for smoothingChoice=1:4
            % Result Folder Name
            resultFolder = resultFolderName(dataSetName{dataSet}, Derivativechoice, smoothingChoice);
            
            readImage(filePath, resultFolder, threshold,tsigma, ssigma, Derivativechoice, smoothingChoice);
        end
    end
end
