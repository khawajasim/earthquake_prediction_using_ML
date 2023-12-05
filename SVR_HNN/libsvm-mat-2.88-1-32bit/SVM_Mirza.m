clc;
clear all; 

%///////////////// Pruning +ve test & +ve training samples ////////////////
load ('D:\Books\Ph.D\HOG-Mirza\HOG_Mirza_PS');
M=size(FS);
TPS=FS(1:10:M(1),:); %Test Positive Samples
FS(1:10:M(1),:)=[];
PS=FS;
%///////////////// Pruning -ve test & -ve training samples ////////////////
load ('D:\Books\Ph.D\HOG-Mirza\HOG_Mirza_NS');
FS=FS(1:M(1),:);
TNS=FS(1:10:M(1),:); %Test Negative Samples
FS(1:10:M(1),:)=[];
NS=FS;
%//////////////// Preparing Training_Set & Training_Label //////////////////
FST=[PS;NS]; %Feature Set (Training FST)
N=size(PS);
LBZ=[ones(N(1),1); -1*ones(N(1),1)];
% %//////////////// Preparing Testing_Set & Testing_Label ////////////////////
N=size(TPS);
TFST=[TPS; TNS];
TLBZ=[ones(N(1),1); -1*ones(N(1),1)]; %Test Lablez

%/////////////////////// SVM Training & Testing ////////////////////////////
% Training_Set=Scale(Training_Set,-1,1);
% FST=Scale(FST,-1,1);
% TFST=Scale(TFST,-1,1);
MODEL=svmtrain(LBZ, FST,'-c 1 -g .0000005');
[PL, Acc, DV]=svmpredict(TLBZ, TFST, MODEL);
%PL=Prodict Label, Acc=Accuracy, DV=Decision Value












% %/////////////////////// Actual Testing Databasis //////////////////////////
% %/////////////////////// Testing +ve Samples //////////////////////////////
% load('D:\Books\Ph.D\Rough Work\HOG_Ludwig_Set_96X160-to-64X128');
% Positive_Samples=HOG_Set;
% M=size(Positive_Samples);
% [Predict_Label, Accuracy, Decision_Value]=svmpredict(ones(M(1),1), Positive_Samples, MODEL);
% 
% %/////////////////////// Testing -ve Samples //////////////////////////////
% load('D:\Books\Ph.D\Rough Work\HOG_Ludwig_Set_Train-veSamples');
% Negative_Samples=HOG_Set(1:M(1),:);
% N=size(Negative_Samples);
% [Predict_Label, Accuracy, Decision_Value]=svmpredict(-1*ones(N(1),1), Negative_Samples, MODEL);
% 
% % clear all; 