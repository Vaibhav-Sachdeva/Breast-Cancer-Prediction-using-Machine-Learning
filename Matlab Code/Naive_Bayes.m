clc;
clear all;

dataset = readtable('breastcancer_dataset_standard_format.xlsx');
dataset = dataset(:,2:end);
%%
% Find missing values
missing_idx = ismissing(dataset, [nan -1]);
missing_rows = dataset(any(missing_idx,2),:);
dataset = dataset(~any(missing_idx,2),:);
%%
% Normalization
dataset.x1 = normalize(dataset.x1, 'range');
dataset.x2 = normalize(dataset.x2, 'range');
dataset.x3 = normalize(dataset.x3, 'range');
dataset.x4 = normalize(dataset.x4, 'range');
dataset.x5 = normalize(dataset.x5, 'range');
dataset.x6 = normalize(dataset.x6, 'range');
dataset.x7 = normalize(dataset.x7, 'range');
dataset.x8 = normalize(dataset.x8, 'range');
dataset.x9 = normalize(dataset.x9, 'range');
%% Without PCA

% Constructing train and test set
features = dataset(:,1:end-1);
Y = dataset(:,end);
features = table2array(features);
Y = table2array(Y);
train_size = 0.8*size(dataset,1);
X_train = features(1:train_size,:);
Y_train = Y(1:train_size,:);
X_test = features(train_size:end,:);
Y_test = Y(train_size:end,:);

% NB
Mdl = fitcnb(X_train,Y_train);
Y_hat = predict(Mdl, X_test);
correct = 0;
for i=1:length(Y_test)
    if(Y_test(i) == Y_hat(i))
        correct = correct + 1;
    end
end
misclassification_error = (length(Y_test) - correct)/length(Y_test);
confusion_matrix = confusionmat(Y_test,Y_hat);
fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-misclassification_error));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*misclassification_error);
CVSVMModel = crossval(Mdl);
classLoss = kfoldLoss(CVSVMModel);
%% With PCA

% PCA
features = dataset(:,1:end-1);
features = table2array(features);
Y = dataset(:,end);
[coeff, features_pca, latent] = pca(features);

% Constructing train and test set
Y = table2array(Y);
train_size = 0.8*size(dataset,1);
X_train = features_pca(1:train_size,:);
Y_train = Y(1:train_size,:);
X_test = features_pca(train_size:end,:);
Y_test = Y(train_size:end,:);

% NB
Mdl = fitcnb(X_train,Y_train);
Y_hat = predict(Mdl, X_test);
correct = 0;
for i=1:length(Y_test)
    if(Y_test(i) == Y_hat(i))
        correct = correct + 1;
    end
end
misclassification_error = (length(Y_test) - correct)/length(Y_test);
confusion_matrix = confusionmat(Y_test,Y_hat);
fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-misclassification_error));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*misclassification_error);
CVSVMModel = crossval(Mdl);
classLoss = kfoldLoss(CVSVMModel);