% Assuming data is a cell array with features in the first column and labels in the second column
features = cell2mat(data(:, 1));
labels = data(:, 2);

% Convert labels to numerical values
numericLabels = strcmp(labels, 'diseased');

% Define the number of nearest neighbors to consider
k = 10;

% Shuffle the data
rng(1); % For reproducibility
shuffled_indices = randperm(size(features, 1));
features_shuffled = features(shuffled_indices, :);
numericLabels = numericLabels(shuffled_indices);

% Split the shuffled data into training and testing sets (e.g., 80% training, 20% testing)
cv = cvpartition(size(features_shuffled, 1), 'HoldOut', 0.2);
idx_train = training(cv);
idx_test = test(cv);

% Use the training set to train the KNN model
mdl = fitcknn(features_shuffled(idx_train, :), numericLabels(idx_train), 'NumNeighbors', k);

% Use the trained model to predict labels for the test set
predicted_labels = predict(mdl, features_shuffled(idx_test, :));

% Convert predicted labels to numeric values
predicted_numericLabels = strcmp(predicted_labels, 'diseased');

% Print predicted labels, actual labels, and length of the test set
disp('Predicted labels:');
disp(num2str(predicted_numericLabels'));
disp('Actual labels:');
disp(num2str(numericLabels(idx_test)')); % Convert to string for comparison
disp(['Length of test set: ', num2str(length(idx_test))]);

% Compare predicted labels with actual labels and calculate accuracy
accuracy = sum(predicted_numericLabels == numericLabels(idx_test)) / length(idx_test);
disp(['Accuracy: ', num2str(accuracy * 100), '%']);

