% main.m

pkg load image
pkg load statistics

%%%%%%%%%%%%   Variables Required for User Change   %%%%%%%%%%%%

% Define the path to the dataset folder
datasetPath = 'Dataset';

% Load and preprocess the input image
inputImagePath = 'Input Image\CS1 (1).jpg';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check if data.mat exists
if exist('data.mat', 'file') == 2
    % Load existing data
    load('data.mat');
else
    % List all subfolders in the dataset folder
    subfolders = dir(datasetPath);
    subfolders = subfolders([subfolders.isdir]); % Keep only directories
    subfolders = subfolders(~ismember({subfolders.name}, {'.', '..'})); % Remove '.' and '..'

    % Initialize an array to store features and labels
    data = cell(0, 2);

    % Loop through each subfolder
    for i = 1:length(subfolders)
        subfolderName = subfolders(i).name;
        subfolderPath = fullfile(datasetPath, subfolderName);

        % Determine the label (healthy or diseased) based on the subfolder name
        if strcmpi(subfolderName, 'healthy')
            label = 'healthy';
        else
            label = 'diseased';
        end

        % List all image files in the subfolder
        imageFiles = dir(fullfile(subfolderPath, '*.png'));
        imageFiles = [imageFiles; dir(fullfile(subfolderPath, '*.jpg'))];

        % Loop through each image file
        for j = 1:length(imageFiles)
            imagePath = fullfile(subfolderPath, imageFiles(j).name);

            % Print the image being processed
            disp(['Processing Image: ', imageFiles(j).name]);

            % Load the image
            image = imread(imagePath);

            % Preprocess the image
            processedImage = preprocessing(image);

            % Extract features
            features = featureExtraction(processedImage);

            % Add features and label to the data array
            data{end+1, 1} = features;
            data{end, 2} = label;
            %disp(['Label for the current image: ', label]);
        end
    end

    % Save the data array to a file
    save('data.mat', 'data');
end


disp('Input Image Processing, Please Wait...');
%Input Image Operations
inputImage = imread(inputImagePath);
processedImage = preprocessing(inputImage);

% Extract features from the input preprocessed image
features = featureExtraction(processedImage);
inputFeatures = {features, ''}; % Create a cell array with features in the first column and an empty string in the second column

% Call the classification script with inputFeatures
classification;

