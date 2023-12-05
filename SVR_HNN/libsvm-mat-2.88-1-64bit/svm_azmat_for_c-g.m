clear all; clc;
load ('hogs_train_neg.mat');
load ('hogs_train_pos.mat');
% load ('hogs_test_neg.mat');
% load ('hogs_test_pos.mat');

%% by given function for otimized c and g
 
a=ones(1,287);b=-1*ones(1,287);
train_label=[a b];
train_feature=[hogs_train_pos(1:287) hogs_train_neg(1:287)];
[bestc, bestg]=func_SVM_param_optz(train_label', train_feature')






%% calculating best c and best g own method


%% taking 141 pos and 147 neg samples feature
%training on first 100 samples

c=0.1;
for x=1:90
    g=0.01;
       for y=1:990
% x=1;y=1;
        
train_label=[ones(1,100) -1*ones(1,100)];
train_feature=[hogs_train_pos(1:100) hogs_train_neg(1:100)];
train_feature=Scale(train_feature, -1, 1);
svm_RBF_parameter= horzcat('-c',' ',num2str(c),' ','-g ',' ',num2str(g));
model = svmtrain(train_label',train_feature', svm_RBF_parameter);
test_feature=[hogs_train_pos(101:141) hogs_train_neg(101:147)];
test_feature=Scale(test_feature, -1, 1);
test_label=[ones(1,41) -1*ones(1,47)];
[predicted_labels, accuracy, dec_value]=svmpredict(test_label',test_feature',model);
   eta(x,y)=accuracy(1);
   g=g+0.001;
       end
   c=c+ 0.01;   
end


%% cross checking
max(max(eta))
[x y]=find(eta==max(max(eta)));
c=0.1+0.01*x;g=0.01+0.001*y;
% 
% 
% c=1
% g=0.644
% train_label=[ones(1,100) -1*ones(1,100)];
% train_feature=[hogs_train_pos(1:100) hogs_train_neg(1:100)];
% train_feature=Scale(train_feature, -1, 1);
% svm_RBF_parameter= horzcat('-c',' ',num2str(c),' ','-g ',' ',num2str(g));
% model = svmtrain(train_label',train_feature', svm_RBF_parameter);
% test_feature=[hogs_train_pos(101:141) hogs_train_neg(101:147)];
% test_feature=Scale(test_feature, -1, 1);
% test_label=[ones(1,41) -1*ones(1,47)];
% [predicted_labels, accuracy, dec_value]=svmpredict(test_label',test_feature',model);
% 
% max(max(eta))