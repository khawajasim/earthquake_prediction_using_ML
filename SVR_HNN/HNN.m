% clc; clear all;  
addpath('libsvm-mat-2.88-1-64bit\')
A = xlsread('Southern California,nM=50,dtp=15');   %'Chile,nM=50,dtp=15.xlsx');  %('Hindukush,nM=50,dtp=15.xls'); %(   
%                                     %Randomize Train and Validation.
%                                     totnum = size(A,1);
%                                     randomorder=randperm(totnum);
                                    load randomorder_california  %chile_home %
                                    A = A(randomorder,:);
%                                     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  input=A(:,1:60);
  Actual_Mag = A(:,61);
  Threshold = 5     %5;
  Actual_Out  = Output_Label( Actual_Mag, Threshold );
  [ind]=size(input,1);
  
  %%%%%%%%%%---------- Divide Train and Test
  %%%%    Dataset
  trainD = input(1:ceil(ind*(3/4)),:);
  testD = input(ceil(ind*(3/4))+1:end,:);
  %%%%    Lable
  train_lbl = Actual_Out(1:ceil(ind*(3/4)),:);
  test_lbl = Actual_Out(ceil(ind*(3/4))+1:end,:);
  %%%%    Actual Mag Lable
  train_actual_lbl = Actual_Mag(1:ceil(ind*(3/4)),:);
  test_actual_lbl = Actual_Mag(ceil(ind*(3/4))+1:end,:);
 
  clearvars -except Threshold trainD testD ind test_lbl train_lbl randomorder train_actual_lbl test_actual_lbl 
%   
  %%%%% ------------Feature selection
     %%%% relevance filter
     L = size(trainD,1);
     [MI,featSet1 ] = irrel_filter( trainD,train_lbl,L );
     
     %%%% Redundant filter
     [featSet2 RC] = redund_filter( MI,featSet1,L );
     
                    aaa=find(featSet1(1,:)==-1); %aaa = featSet1(1,featSet1(1,:)~=-1);
                    bbb=find(featSet2(1,:)==-1);%bbb = featSet2(1,featSet2(1,:)~=-1);
     %%%%% Separate selected features
     train_new=[]; trn = []; test_new = []; tst = [];
     for i=1:size(featSet2,2)
           cc= featSet2(:,i)~=-1;
           if sum(cc)~=0
            trn = featSet2(:,i);
            train_new = [train_new trn];
            
            tst = testD(:,i);
            test_new = [test_new tst];
           end
     end
     
     trainD = train_new; testD = test_new;
     clearvars -except Threshold trainD testD ind test_lbl train_lbl featSet1 featSet2 MI randomorder aaa bbb RC randomorder train_actual_lbl test_actual_lbl 
  %%% ------------- SVR
  [ PL_train, PL_test ] = UseSVR( trainD,testD,train_actual_lbl,test_actual_lbl );
  Aux_train = PL_train; Aux_test = PL_test;   % Auxillary output to be used with Input
%   %SVR Output is continuos, so first convert it into binary. Then compute
%   %contegency.
%   %For converting to binary, we can use "Output_Label" function
%   SVR_train_binary = Output_Label(PL_train,Threshold);
%   SVR_test_binary = Output_Label(PL_test,Threshold);
%   
%    [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(test_lbl(:,1),SVR_test_binary(:,1));
%    SVR_Contengency_test = [TP FP TN FN sens spec ppv npv Acc MCC RScore];
%   
%    [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(train_lbl(:,1),SVR_train_binary(:,1));
%    SVR_Contengency_train = [TP FP TN FN sens spec ppv npv Acc MCC RScore];
  
     
  %%% ------------- First NN ---------------------

  net = newff([trainD Aux_train]',train_lbl',{20},{'tansig'});
  trainFCN = 'trainlm';
  [ net, Contengency_train1, Contengency_test1, Aux_trainNN, Aux_testNN ] = UseNN( trainD,testD,train_lbl,test_lbl,net,trainFCN,Aux_train,Aux_test );

  %%% ------------ First EPSO
 [ net, Contengency_trainEPSO1, Contengency_testEPSO1, Aux_train, Aux_test ] = UseEPSO( trainD,testD,train_lbl,test_lbl, net, Aux_train,Aux_test );
  
  
 %%% ------------- Second NN -------------------

  trainFCN = 'trainbfg';
  [ net, Contengency_train2, Contengency_test2, Aux_trainNN, Aux_testNN ] = UseNN( trainD,testD,train_lbl,test_lbl,net,trainFCN,Aux_train,Aux_test );

  %%% ------------ Second EPSO
 [ net, Contengency_trainEPSO2, Contengency_testEPSO2, Aux_train, Aux_test ] = UseEPSO( trainD,testD,train_lbl,test_lbl, net, Aux_train,Aux_test );
   
 %%% ------------- Second NN -------------------

  trainFCN = 'trainbr';
  [ net, Contengency_train3, Contengency_test3, Aux_trainNN, Aux_testNN ] = UseNN( trainD,testD,train_lbl,test_lbl,net,trainFCN,Aux_train,Aux_test );

  %%% ------------ Second EPSO
 [ net, Contengency_trainEPSO3, Contengency_testEPSO3, Aux_train, Aux_test ] = UseEPSO( trainD,testD,train_lbl,test_lbl, net, Aux_train,Aux_test );
   