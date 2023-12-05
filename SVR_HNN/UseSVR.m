function [ PL_train, PL_test ] = UseSVR( trainD,testD,train_actual_lbl,test_actual_lbl )
   
           for i=1 : size(trainD,2)
                a=[]; s=[];
                a = trainD(:,i) - mean(trainD(:,i));
                s = std(trainD(:,i));
                trainD(:,i) = a/s;
           end
           for i=1 : size(testD,2)
                a=[]; s=[];
                a = testD(:,i) - mean(testD(:,i));
                s = std(testD(:,i));
                testD(:,i) = a/s;
           end
 
   MODEL=svmtrain(train_actual_lbl, trainD,'-s 4 -t 2 -g 2 -c 1 -n 1');
  
   [PL_train, Acc_train, DV_train]=svmpredict(train_actual_lbl, trainD, MODEL);
   [PL_test, Acc_test, DV_test]=svmpredict(test_actual_lbl, testD, MODEL);
  
     Acc_train
    
     Acc_test
   figure, plot(test_actual_lbl)
   hold on 
   plot(PL_test,'r')
   
   Train_err = sqrt(mean((train_actual_lbl - PL_train).^2))  % Root Mean Squared Error
   Test_err = sqrt(mean((test_actual_lbl - PL_test).^2))  % Root Mean Squared Error

end

