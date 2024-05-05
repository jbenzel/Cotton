# Cotton Leaf Disease Classification

This MATLAB *(Octave)* code is designed to classify cotton leaves as either healthy or diseased based on images. It follows a basic pipeline:

1. **Preprocessing**: Converts the image to HSV, applies histogram equalization and contrast stretching, and removes noise with a Gaussian filter.

2. **Feature Extraction**: Extracts color, shape, and GLCM (Gray-Level Co-occurrence Matrix) features from the preprocessed image.

3. **Classification**: Uses a k-nearest neighbors (KNN) model to classify the image as healthy or diseased based on the extracted features. The model is trained on a dataset with known labels.

## Usage

1. Set the `datasetPath` variable to the path of the dataset containing images of cotton leaves.
2. Set the `inputImagePath` variable to the path of the image you want to classify.
3. Run `main.m`.

## Example Images

The `Dataset` folder contains example images of cotton leaves for both healthy and diseased plants.
