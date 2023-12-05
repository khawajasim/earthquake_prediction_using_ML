clc; clear; close;
load('hogs_train_neg.mat')
load('hogs_train_pos.mat')
load('inria_test_pos.mat')
PF=hogs_train_pos';
NF=hogs_train_neg';
Test=inria_test_pos';
PL=ones(size(PF,1),1);
NL=ones(size(NF,1),1);
F=[PF;NF];
L=[PL;NL];
model=svmtrain(L,F,'-s 1 -t 3');
[pl acc dv]=svmpredict(TL,TF,model')