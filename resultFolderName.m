function [resultFolder] = resultFolderName(dataSetName, Derivativechoice, smoothingChoice)
switch Derivativechoice
    case 1
        str1 = '_1D_Deriv_Filter';
    case 2
        str1 = '_1D_Deriv_Gauss';
end

switch smoothingChoice
    case 1
        str2 = '';
    case 2
        str2 = '_with_3x3Filter';
    case 3
        str2 = '_with_5x5Filter';
    case 4
        str2 = '_with_2DGauss';
end

resultFolder = strcat(dataSetName, str1, str2);

end
