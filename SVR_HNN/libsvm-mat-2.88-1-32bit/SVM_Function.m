function [PL Acc DV Per_Para X Y]=SVM_Function(PS,NS,Fold,String)
    %///////////////// Pruning +ve test & +ve training samples ////////////////
    M=size(PS);
    TPS=PS(1:Fold:M(1),:); %Test Positive Samples
    PS(1:Fold:M(1),:)=[];
    %///////////////// Pruning -ve test & -ve training samples ////////////////
    N=size(NS);
    TNS=NS(1:Fold:N(1),:); %Test Negative Samples
    NS(1:Fold:N(1),:)=[];
    %//////////////// Preparing Training_Set & Training_Label //////////////////
    FST=[PS;NS]; %Feature Set (Training FST)
    M=size(PS);
    N=size(NS);
    LBZ=[ones(M(1),1); -1*ones(N(1),1)];
    % %//////////////// Preparing Testing_Set & Testing_Label ////////////////////
    M=size(TPS);
    N=size(TNS);
    TFST=[TPS; TNS];
    TLBZ=[ones(M(1),1); -1*ones(N(1),1)]; %Test Lablez
    %/////////////////////// SVM Training & Testing ////////////////////////////
    MODEL=svmtrain(LBZ, FST,String);  % '-c 1 -g .0000005'
    [PL, Acc, DV]=svmpredict(TLBZ, TFST, MODEL);
    [X, Y]=perfcurve(TLBZ,DV,1);
    %PL=Prodict Label, Acc=Accuracy, DV=Decision Value
    %/////////////////////////// Performance Parameters /////////////////
    M=size(TPS);
    M=M(1);
    FN=(M-sum(PL(1:M)))/2;
    TP=M-FN;
    N=size(TNS);
    N=N(1);
    FP=(N+sum(PL(M+1:M+N)))/2;
    TN=N-FP;
    ACC=(TP+TN)/(TP+FP+FN+TN)*100;
    Sensitivity=TP/(TP+FN)*100;
    Specificity=TN/(FP+TN)*100;
    MCC=(TP*TN-FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN))*100;
    Precision=TP/(TP+FP);
    Recall=TP/(TP+FN);
    Fmeasure=2*Precision*Recall/(Precision+Recall)*100;
    Per_Para=[ACC Sensitivity Specificity MCC Fmeasure]; %Performance Parameters
end