%% Parameter set up
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


%% Temporal Derivative with filter 0.5[-1 0 1]
% Derivative filter choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
Derivativechoice = 1;

% TSigma value for 1D derivative gaussian
tsigma = 0;

% Standard deviation ssigma for 2D Gaussian filters
ssigma = 0;

% Spatial smoothing choice
% 1 = none
% 2 = 3x3 box filter
% 3 = 5x5 box filter
% 4 = 2D Gaussian filters
smoothingChoice = 1;

resultFolder = strcat(dataSetName{dataSet},"_temporal_Derivative_Filter");
readImage(filePath, resultFolder, tsigma, ssigma, Derivativechoice, smoothingChoice);


%% 1D derivative of a Gaussian
% choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
Derivativechoice = 2;

% Tsigma value for 1D derivative gaussian
tsigma = 2;

% Standard deviation ssigma for 2D Gaussian filter
ssigma = 0;

% Spatial smoothing choice
% 1 = none
% 2 = 3x3 box filter
% 3 = 5x5 box filter
% 4 = 2D Gaussian filters
smoothingChoice = 1;

resultFolder = strcat(dataSetName{dataSet},"_1D_Derivative_Filter");
readImage(filePath, resultFolder, tsigma, ssigma, Derivativechoice, smoothingChoice);


%% Temporal Derivative with filter 0.5[-1 0 1] with 3x3 box filter
% Derivative filter choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
Derivativechoice = 1;

% TSigma value for 1D derivative gaussian
tsigma = 0;

% Standard deviation ssigma for 2D Gaussian filters
ssigma = 0;

% Spatial smoothing choice
% 1 = none
% 2 = 3x3 box filter
% 3 = 5x5 box filter
% 4 = 2D Gaussian filters
smoothingChoice = 2;

resultFolder = strcat(dataSetName{dataSet},"_temporal_Derivative_Filter","_with_3x3Filter");
readImage(filePath, resultFolder, tsigma, ssigma, Derivativechoice, smoothingChoice);

%% Temporal Derivative with filter 0.5[-1 0 1] with 5x5 box filter
% Derivative filter choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
Derivativechoice = 1;

% TSigma value for 1D derivative gaussian
tsigma = 0;

% Standard deviation ssigma for 2D Gaussian filters
ssigma = 0;

% Spatial smoothing choice
% 1 = none
% 2 = 3x3 box filter
% 3 = 5x5 box filter
% 4 = 2D Gaussian filters
smoothingChoice = 3;

resultFolder = strcat(dataSetName{dataSet},"_temporal_Derivative_Filter","_with_5x5Filter");
readImage(filePath, resultFolder, tsigma, ssigma, Derivativechoice, smoothingChoice);

%% Temporal Derivative with filter 0.5[-1 0 1] with 2D Gaussian filter
% Derivative filter choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
Derivativechoice = 1;

% TSigma value for 1D derivative gaussian
tsigma = 0;

% Standard deviation ssigma for 2D Gaussian filters
ssigma = 1.4;

% Spatial smoothing choice
% 1 = none
% 2 = 3x3 box filter
% 3 = 5x5 box filter
% 4 = 2D Gaussian filters
smoothingChoice = 4;

resultFolder = strcat(dataSetName{dataSet},"_temporal_Derivative_Filter","_with_2DGauss");
readImage(filePath, resultFolder, tsigma, ssigma, Derivativechoice, smoothingChoice);


%% 1D derivative of a Gaussian with 3x3 box filter
% choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
Derivativechoice = 2;

% Tsigma value for 1D derivative gaussian
tsigma = 2;

% Standard deviation ssigma for 2D Gaussian filter
ssigma = 0;

% Spatial smoothing choice
% 1 = none
% 2 = 3x3 box filter
% 3 = 5x5 box filter
% 4 = 2D Gaussian filters
smoothingChoice = 2;

resultFolder = strcat(dataSetName{dataSet},"_1D_Derivative_Filter", "_with_3x3Filter");
readImage(filePath, resultFolder, tsigma, ssigma, Derivativechoice, smoothingChoice);

%% 1D derivative of a Gaussian with 5x5 box filter
% choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
Derivativechoice = 2;

% Tsigma value for 1D derivative gaussian
tsigma = 2;

% Standard deviation ssigma for 2D Gaussian filter
ssigma = 0;

% Spatial smoothing choice
% 1 = none
% 2 = 3x3 box filter
% 3 = 5x5 box filter
% 4 = 2D Gaussian filters
smoothingChoice = 3;

resultFolder = strcat(dataSetName{dataSet},"_1D_Derivative_Filter", "_with_5x5Filter");
readImage(filePath, resultFolder, tsigma, ssigma, Derivativechoice, smoothingChoice);

%% 1D derivative of a Gaussian with 2D Gaussian Filter
% choice
% 1 = Temporal Derivative with filter 0.5[-1 0 1]
% 2 = 1D derivative of a Gaussian
Derivativechoice = 2;

% Tsigma value for 1D derivative gaussian
tsigma = 2;

% Standard deviation ssigma for 2D Gaussian filter
ssigma = 1.4;

% Spatial smoothing choice
% 1 = none
% 2 = 3x3 box filter
% 3 = 5x5 box filter
% 4 = 2D Gaussian filters
smoothingChoice = 4;

resultFolder = strcat(dataSetName{dataSet},"_1D_Derivative_Filter", "_with_2DGauss");
readImage(filePath, resultFolder, tsigma, ssigma, Derivativechoice, smoothingChoice);