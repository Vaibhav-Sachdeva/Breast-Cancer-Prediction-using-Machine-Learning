# Breast-Cancer-Prediction-using-Machine-Learning

Affecting roughly around 10 percent of the women across the globe in some stage of their lives, Breast Cancer has stood out to be one of the most feared and frequently
occurring cancers at present among women. While the cure for this cancer is now available in almost all first world and some of the third world nations, the main
dilemma takes place when the cancer cannot be correctly identified at the very initial stages. Machine Learning, in this field has proved to play a vital role in predicting
diseases such as cancers alike. Classification and data mining methods so far have been reliant and an effective way to classify data. Especially in medical field, these
methods have been used to predict and to make decisions.

## Aim 

The objective of this report is to train machine learning models to predict whether a breast cancer cell is Benign or Malignant. Data will be transformed to reveal patterns in the dataset and create a more robust analysis.The optimal model will be selected following the resulting accuracy, sensitivity, specificity, amongst other
factors. The machine learning models that we will applicate in this report try to create a classifier that provides a high accuracy level combined with a low rate of false-negatives (high sensitivity) and false positives (high specificity).

## Dataset 
The present report covers the Breast Cancer Wisconsin Dataset (https://www.kaggle.com/roustekbio/breast-cancercsv) created by Dr. William H. Wolberg, physician at the University of Wisconsin Hospital at Madison, Wisconsin, USA. The features are as follows:
- Sample code number id number
- Clump Thickness 1 - 10
- Uniformity of Cell Size 1 - 10
- Uniformity of Cell Shape 1 - 10
- Marginal Adhesion 1 - 10
- Single Epithelial Cell Size 1 - 10
- Bare Nuclei 1 - 10
- Bland Chromatin 1 - 10
- Normal Nucleoli 1 – 10
- Mitoses 1-10 

## Exploratory Data Analysis
- Data Cleaning
- Correlation Analysis
- Outlier Treatment

## Model Building
- Naïve Bayes Model
- K-Nearest Neighbors Model
- Logistic Regression Model
- Support Vector Machines Model 
- Decision Tree Model
- Random Forests Model
- Artificial Neural Networks Model

## Results
<p align="center">
  <img src="Images/result_breast-cancer.PNG" width="600"/>
</p>

Both SVM and MLP gave the same accuracy, sensitivity and specificity of 97.1%, 98.9% and 94.3% respectively. On the other hand, Random Forest Classifier gave no false negative results and hence a sensitivity of 100% but a specificity of 92.7% which was a little lower than that of MLP and SVM.
Considering the average of sensitivity and specificity, MLP and SVM gave better results by achieving an average of 96.60% than Random Forest Classifier which gave an average of 96.35%. Hence, it can be concluded that both SVM and MLP gave the optimal (best) results when both sensitivity and specificity are taken into account. But it cannot be ignored that Random Forests gave a sensitivity of 100% which is remarkable and also an average of 96.35% which was a bit lower than that of MLP and SVM. 
