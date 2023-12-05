function [MI,featSet ] = irrel_filter( featSet,Target,L )

                            %   featSet = input; Target = Actual_Out(:,1); 
                            %   L = 4351;
[row col]=size(featSet);
feats=col;
%%%%%%   L = Total number of samples
%%%%%%%%%%%%%%%%%%% Normalizing target %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A=min(Target);
% B=max(Target);
% a1=0;
% b1=1;
% targ_norm=(b1 - a1) / (B - A);
% targ_norm=(Target-A).*targ_norm;
% 
% med=median(targ_norm);              %Taking median of normalized Target vector
% 
% for i=1:length(targ_norm)		%now values less than median are 
%     if targ_norm(i)<med			%changed to ZERO and values greater
%     targ_norm(i)=0;			%than median are changed to ONE
%     else
%     targ_norm(i)=1;
%     end
% end

 %%% Because Targets are already normalized. 
        targ_norm = Target;
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Irrelevancy Filter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 for j=1:feats     %with the help of this loop we make vector for each variable (1 out of 120)               
                 
     temp1=featSet(:,j); 			%this assign 24 values to each variable vector                              
         
    %%%%%%%% normalizing the variable vector %%%%%%%%%
    
    A=min(temp1);
    B=max(temp1);
    a1=0;
    b1=1;
    temp_norm=(b1 - a1) / (B - A);
    temp_norm=(temp1-A).*temp_norm;        
    med=median(temp_norm);		%Taking median of normalized variable vector
					
    for i=1:length(temp_norm)				%now values less than median are 
        if temp_norm(i)<=med		%changed to ZERO and values greater
        temp_norm(i)=0;			%than median are changed to ONE
        else
        temp_norm(i)=1;    
        end
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
   
    
    %%%%%%%% finding MI %%%%%%%%%%%%%
     
    U0=0; U1=0; U2=0; U3=0;
    
    for i=1:length(temp_norm)
        
        Um(i)=2*temp_norm(i)+targ_norm(i);   %calculates the vector Um which values ranges 
                                             %from 0 to 3
        switch Um(i)            
          case 0
            U0=U0+1;                         %calculates how many ZEROS are there in Um 
          case 1
            U1=U1+1;                         %calculates how many ONES are there in Um
          case 2
            U2=U2+1;                         %calculates how many TWOS are there in Um
          case 3
            U3=U3+1;                         %calculates how many THREES are there in Um
        end
        
    end
            
    p_targ_0=(U0+U2)/L;				
    p_targ_1=(U1+U3)/L;
    p_temp_0=(U0+U1)/L;
    p_temp_1=(U2+U3)/L;
    
    p_targ0_temp0=U0/L;
    p_targ0_temp1=U2/L;
    p_targ1_temp0=U1/L;
    p_targ1_temp1=U3/L;    
    
    MI(j)=p_targ0_temp0*log2(p_targ0_temp0/(p_targ_0*p_temp_0))+p_targ1_temp0*log2(p_targ1_temp0/(p_targ_1*p_temp_0))+p_targ0_temp1*log2(p_targ0_temp1/(p_targ_0*p_temp_1))+p_targ1_temp1*log2(p_targ1_temp1/(p_targ_1*p_temp_1));
    
    if isnan(MI(j))==1
         MI(j)=0;
    end
    
    %above is formula for calculating Mutual Information
    
    if MI(j)<0.001
        featSet(:,j)=-1;         %discarding those features having MI less then threshold value                                     
        MI(j)=-1;                %and it is represented by -1                    
    end    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
 end

end

