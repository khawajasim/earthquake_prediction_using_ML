function [ featSet RC] = redund_filter( MI,featSet,L )


[row col]=size(featSet);
feats=col;

 %%%%%%%%%%%%%%%%%%%%%%%%%%% Redundancy Filter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 RC=zeros(1,feats);
 first=zeros(1,feats);
 second=zeros(1,feats);
 
 for k=1:feats-1     
               
     RC(k)=0;
     first_var=featSet(:,k);                   %this assign 24 values to first variable vector             
          
     if first_var(2)~=-1            %--- (A check whether this feature is already discarded or not)
             
    %%%%%%%% normalizing the first variable vector %%%%%%%%%

        A=min(first_var);
        B=max(first_var);
        a1=0;
        b1=1;
        first_norm=(b1 - a1) / (B - A);
        first_norm=(first_var-A).*first_norm;        

        med=median(first_norm);		%Taking median of normalized variable vector

        for i=1:length(first_norm)	%now values less than median are 
            if first_norm(i)<=med		%changed to ZERO and values greater
            first_norm(i)=0;        	%than median are changed to ONE
            else
            first_norm(i)=1;    
            end
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
     for j=(k+1):feats

         sec_var=featSet(:,j);     			%this assign 24 values to second variable vector 
                
         if sec_var(3)~=-1     %--- (A check whether this feature is already discarded or not)
             
        %%%%%%%% normalizing the second variable vector %%%%%%%%%

        A=min(sec_var);
        B=max(sec_var);
        a1=0;
        b1=1;
        sec_norm=(b1 - a1) / (B - A);
        sec_norm=(sec_var-A).*sec_norm;
        
        med=median(sec_norm);		%Taking median of normalized variable vector

        for i=1:length(sec_norm)	%now values less than median are 
            if sec_norm(i)<=med		%changed to ZERO and values greater
            sec_norm(i)=0;			%than median are changed to ONE
            else
            sec_norm(i)=1;    
            end
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %%%%%%%% finding MI %%%%%%%%%%%%%

        U0=0; U1=0; U2=0; U3=0;

        for i=1:length(sec_norm)

            Um(i)=2*sec_norm(i)+first_norm(i);   %calculates the vector Um which values ranges 
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
                       
        p_first_0=(U0+U2)/L;				
        p_first_1=(U1+U3)/L;
        p_sec_0=(U0+U1)/L;
        p_sec_1=(U2+U3)/L;

        p_first0_sec0=U0/L;
        p_first0_sec1=U2/L;
        p_first1_sec0=U1/L;
        p_first1_sec1=U3/L;  

        Mut_Inf_temp=p_first0_sec0*log2(p_first0_sec0/(p_first_0*p_sec_0))+p_first1_sec0*log2(p_first1_sec0/(p_first_1*p_sec_0))+p_first0_sec1*log2(p_first0_sec1/(p_first_0*p_sec_1))+p_first1_sec1*log2(p_first1_sec1/(p_first_1*p_sec_1));
        if isnan(Mut_Inf_temp)==1
            Mut_Inf_temp=0;
        end
        %above is formula for calculating Mutual Information
        
        if Mut_Inf_temp>RC(k)
        RC(k)=Mut_Inf_temp;
        first(k)=k;
        second(k)=j;
        end
        

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         end
         
     end
     
          
         if RC(k)>0.2                     %-----Threshold
             if MI(first(k))>MI(second(k))          %calculating which feature to drop on basis of 
                drop_ind=second(k);                 %MI values
             else
                drop_ind=first(k);
             end  
         end
         
         featSet(:,drop_ind)=-1;       %discarding those features having RC greater then  
                                       %threshold value and it is represented by -1 in feature set              
     end
     
 
 end
 
end

