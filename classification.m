% classification.m

% Data is an array with features in the first column and labels in the second column
features = cell2mat(data(:, 1));
labels = data(:, 2);

% Convert labels to numerical values
numericLabels = strcmp(labels, 'diseased');

% Define the number of nearest neighbors to consider
k = 10;

% Shuffle the data
shuffled_indices = randperm(size(features, 1));
features_shuffled = features(shuffled_indices, :);
numericLabels = numericLabels(shuffled_indices);

% Split the shuffled data into training and testing sets
cv = cvpartition(size(features_shuffled, 1), 'HoldOut', 0.3);
idx_train = training(cv);
idx_test = test(cv);

% Use the training set to train the KNN model
mdl = fitcknn(features_shuffled(idx_train, :), numericLabels(idx_train), 'NumNeighbors', k);

% Use the trained model to predict labels for the test set
predicted_labels = predict(mdl, features_shuffled(idx_test, :));

% Convert predicted labels to numeric values
predicted_numericLabels = cell2mat(predicted_labels);

input_features_array = inputFeatures{1};
num_features = size(input_features_array, 2);

% Use the model to predict labels for the input features
predicted_labels_input = predict(mdl, input_features_array);

% Convert predicted labels to numeric values
predicted_numericLabels_input = cell2mat(predicted_labels_input);

% Calculate true positives (TP), false positives (FP), true negatives (TN), false negatives (FN)
TP = sum(predicted_numericLabels_input & numericLabels);
FP = sum(predicted_numericLabels_input & ~numericLabels);
TN = sum(~predicted_numericLabels_input & ~numericLabels);
FN = sum(~predicted_numericLabels_input & numericLabels);

% Calculate accuracy
accuracy_denominator = (TP + FP + TN + FN);
if accuracy_denominator > 0
    accuracy = (TP + TN) / accuracy_denominator;
else
    accuracy = 0;
end

% Calculate precision
precision_denominator = (TP + FP);
if precision_denominator > 0
    precision = TP / precision_denominator;
else
    precision = 0;
end

% Calculate recall
recall_denominator = (TP + FN);
if recall_denominator > 0
    recall = TP / recall_denominator;
else
    recall = 0;
end

% Calculate F1 score
f1_score_denominator = (precision + recall);
if f1_score_denominator > 0
    f1_score = 2 * (precision * recall) / f1_score_denominator;
else
    f1_score = 0;
end

% Display the metrics
disp(['Accuracy: ', num2str(accuracy)]);
disp(['Precision: ', num2str(precision)]);
disp(['Recall: ', num2str(recall)]);
disp(['F1 Score: ', num2str(f1_score)]);

if predicted_numericLabels_input == 0
    disp('The cotton plant is healthy.');
else
    disp('The cotton plant is unhealthy.');
end
