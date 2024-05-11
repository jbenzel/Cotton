# Cotton Leaf Disease Classification

Our MATLAB *(Octave)* code is designed to classify cotton leaves as either healthy or diseased based on images. It follows a standard pipeline:

1. **Preprocessing**: Converts the image to HSV, applies histogram equalization and contrast stretching, and removes noise with a Gaussian filter.

2. **Feature Extraction**: Extracts color, shape, and GLCM (Gray-Level Co-occurrence Matrix) features from the preprocessed image.

3. **Classification**: Uses a k-nearest neighbors (KNN) model to classify the image as healthy or diseased based on the extracted features. The model is trained on a dataset with known labels.

## Dependencies

1. If you are having trouble running the code please use the latest version of Octave

## How-to-Use

1. If the `Cotton-main` folder is zipped, unzip it.
2. Set the `datasetPath` variable to the path of the dataset containing the folders of images of cotton leaves. If you are using a different dataset that wasn't the provided dataset, make sure the images are in a folder with any name in the `Dataset` folder.
3. Set the `inputImagePath` variable to the path of the image you want to classify.
4. Run `main.m` through Octave. The operation may take a second to process the images, so please wait patiently and observe progress through the command window.
5. Note: On the first run, the application will create a `data.mat` file from the feature extraction of the current images in your dataset. After creation, the model will reference this file for classification instead of retraining every iteration.

## Example Images

The `Dataset` folder contains example images of cotton leaves for both healthy and diseased plants.

## Evaluation from your Results

 While the developed system is faster and boasts a passable and high accuracy rate, manual diagnosis is still  more accurate. This is because the developed system relies on preset teachings, whereas manual diagnosis, while considerably  slower, tends to have a higher accuracy through human judgment.
