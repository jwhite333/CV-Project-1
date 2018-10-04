function [outputImage] = smoothImage(image, smoothingChoice, ssigma)

switch smoothingChoice
    case 1
        % none
        outputImage = image;
    case 2
        % 3x3 box filter
        outputImage = boxFilter(image, 3);
    case 3
        % 5x5 box filter
        outputImage = boxFilter(image, 5);
    case 4
        % 2D Gaussian filters
        outputImage = two_D_GaussinFilter(image, ssigma);
end
    
end

