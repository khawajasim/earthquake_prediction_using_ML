% This make.m is used under Windows
clear all;
close all;

% addpath D:\asif_E_and_F_GIST_2009\MultiSVM_asif_Practice\libsvm-mat-2.88-1;

mex -largeArrayDims -O -c svm.cpp
mex -largeArrayDims -O -c svm_model_matlab.c
mex -largeArrayDims -O svmtrain.c svm.obj svm_model_matlab.obj
mex -largeArrayDims -O svmpredict.c svm.obj svm_model_matlab.obj
mex -largeArrayDims -O read_sparse.c
