function [ net, Contengency_train, Contengency_test, Aux_train, Aux_test ] = UseEPSO( trainD,testD,train_lbl,test_lbl, net, Aux_train,Aux_test  )
  
    train_com=[trainD Aux_train]';  test_com=[testD Aux_test]';
     train_lbl=train_lbl';  test_lbl = test_lbl'; 


    [IW LW B]=EPSO(net,train_com,train_lbl);
    net.LW{2}=LW;                             
    net.IW{1}=IW;
    net.b=B;
   
    %%%%% ----- Calculate Output
    train_out = []; test_out = [];
    train_out = sim(net,train_com);
    test_out = sim(net, test_com);
    
    %%%%%% -------- Getting Auzillary Outputs
    Aux_train = train_out(1,:)'; 
    Aux_test = test_out(1,:)'; 
    
    
    %%%%%% --------- Calculate contigency
%    Final result for Training
    Final_Results_train = [];
    for i=1:size(train_out,2)
        if train_out(1,i)> train_out(2,i)
            Final_Results_train = [Final_Results_train 1];
        end
        if train_out(1,i)<= train_out(2,i)
            Final_Results_train = [Final_Results_train 0];
        end
    end
 % Final Result for Testing
 Final_Results_test = []; 
    for i=1:size(test_out,2)
        if test_out(1,i)> test_out(2,i)
            Final_Results_test = [Final_Results_test 1];
        end
        if test_out(1,i)<= test_out(2,i)
            Final_Results_test = [Final_Results_test 0];
        end
    end
    
    
    [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(train_lbl(1,:),Final_Results_train);
    Contengency_train = [TP FP TN FN sens spec ppv npv Acc MCC RScore];
    
    [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(test_lbl(1,:),Final_Results_test);
    Contengency_test = [TP FP TN FN sens spec ppv npv Acc MCC RScore];



