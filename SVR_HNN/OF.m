function [ c ] = OF( IW,LW,B,input,target,net )

net.IW{1,1}=IW;
net.LW{2}=LW;
net.b=B;
pred_targ=sim(net,input);

% [c,cm,ind,per] = confusion(target,pred_targ);
% c

   %%%%
   Final_Results_train = [];
    for i=1:size(pred_targ,2)
        if pred_targ(1,i)> pred_targ(2,i)
            Final_Results_train = [Final_Results_train 1];
        end
        if pred_targ(1,i)<= pred_targ(2,i)
            Final_Results_train = [Final_Results_train 0];
        end
    end
    
    [TP FP TN FN sens spec ppv npv Acc MCC RScore] = Contingency_Table(target(1,:),Final_Results_train);
    c=MCC;


end


