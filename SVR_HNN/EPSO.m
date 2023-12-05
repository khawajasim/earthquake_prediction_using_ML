function [ G_best_IW  G_best_LW  G_best_b ] = EPSO( net,input,target )

LW=net.LW;
IW=net.IW;
bias=net.b;

gen_stop=0;                 %Counter for stoping criterea
stop_crit=0;                %Counter for stoping criterea

%%%%%%%%% ------------- Parameters to initialize ---------
total_popul=400                         % Total popuilation of swarm
generation=20;                         % Generations of particles
w= 0.2;                               % Formula constant        
c1_b=1;                                 % Formula constant
c1_nb=1;                                % Formula constant
c2= 2;                              % Formula constant
r1=0.2;                              % Formula constant
r2=0.2;                            % Formula constant
r3=0.2;                            % Formula constant
%%%%%%%%% ------------------------------------------------

[hid_layr_nrns inpt_nrns]=size(net.IW{1});

V_IW=cell(1,total_popul);                % Velocity of particles
V_LW=cell(1,total_popul);                % Velocity of particles
V_b=cell(1,total_popul);                 % Velocity of particles
X_LW=cell(1,total_popul);                % Layer weight component of position     
X_IW=cell(1,total_popul);                % Input weight component of position     
X_b=cell(1,total_popul);                 % Biases component of position   
P_best_LW=cell(1,total_popul);           % Personal best of particle
P_best_IW=cell(1,total_popul);           % Personal best of particle
P_best_b=cell(1,total_popul);            % Personal best of particle
P_Notbest_LW=cell(1,total_popul);        % Personal not best of particle
P_Notbest_IW=cell(1,total_popul);        % Personal not best of particle
P_Notbest_b=cell(1,total_popul);         % Personal not best of particle
G_best_LW=cell(1);                       % Global best of swarm
G_best_IW=cell(1);                       % Global best of swarm
G_best_b=cell(1);                        % Global best of swarm



for b=1:total_popul                     % Population initialization
    
    if b==1
        X_LW{b}=LW{2};                             
        X_IW{b}=IW{1};
        X_b{b}=bias;
        
        P_best_LW{b}=X_LW{b};
        P_best_IW{b}=X_IW{b};
        P_best_b{b}=X_b{b};
        
        P_Notbest_LW{b}=X_LW{b};
        P_Notbest_IW{b}=X_IW{b};
        P_Notbest_b{b}=X_b{b};
        
        G_best_LW=X_LW{b};
        G_best_IW=X_IW{b};
        G_best_b=X_b{b};
        
        siz_trg=size(target);
        siz_trg=siz_trg(1);
        V_IW{b}=-max(max(X_IW{b}))+(max(max(X_IW{b}))+max(max(X_IW{b})))*rand(hid_layr_nrns,inpt_nrns);
        V_LW{b}=-max(max(X_LW{b}))+(max(max(X_LW{b}))+max(max(X_LW{b})))*rand(siz_trg,hid_layr_nrns);      
        V_b{b}{1,1}=-max(X_b{b}{1,1})+(max(X_b{b}{1,1})+max(X_b{b}{1,1}))*rand(hid_layr_nrns,1);
        V_b{b}{2,1}=-max(X_b{b}{2,1})+(max(X_b{b}{2,1})+max(X_b{b}{2,1}))*rand(siz_trg,1);
        
        %first=OF( G_best_IW, G_best_LW, G_best_b,input,target,trn_fnc )
        
    else
        X_LW{b}=-1 + (1+1)*rand(siz_trg,hid_layr_nrns);%-rand(1,hid_layr_nrns);      
        X_IW{b}=-1 + (1+1)*rand(hid_layr_nrns,inpt_nrns);%-rand(hid_layr_nrns,inpt_nrns);
        X_b{b}{1,1}=-1 + (1+1)*rand(hid_layr_nrns,1);%2*rand(hid_layr_nrns,1)-2*rand(hid_layr_nrns,1);
        X_b{b}{2,1}=-1 + (1+1)*rand(siz_trg,1);%2*rand(1)-2*rand(1);
        
        P_best_LW{b}=X_LW{b};
        P_best_IW{b}=X_IW{b};
        P_best_b{b}=X_b{b};
        
        P_Notbest_LW{b}=X_LW{b};
        P_Notbest_IW{b}=X_IW{b};
        P_Notbest_b{b}=X_b{b};
                                                         %<
        if OF( X_IW{b},X_LW{b},X_b{b},input,target,net ) > OF( G_best_IW,G_best_LW,G_best_b,input,target,net )
            G_best_LW=X_LW{b};    %The above check is on Confusion Value. If new Weights (X_I) have 
            G_best_IW=X_IW{b};    %lower value of Confusion, then assign it to Best Weights. 
            G_best_b=X_b{b};
        end
        
        V_IW{b}=-max(max(X_IW{b}))+(max(max(X_IW{b}))+max(max(X_IW{b})))*rand(hid_layr_nrns,inpt_nrns);
        V_LW{b}=-max(max(X_LW{b}))+(max(max(X_LW{b}))+max(max(X_LW{b})))*rand(siz_trg,hid_layr_nrns);      
        V_b{b}{1,1}=-max(X_b{b}{1,1})+(max(X_b{b}{1,1})+max(X_b{b}{1,1}))*rand(hid_layr_nrns,1);
        V_b{b}{2,1}=-max(X_b{b}{2,1})+(max(X_b{b}{2,1})+max(X_b{b}{2,1}))*rand(siz_trg,1);
%         
%         V_IW{b}=rand(hid_layr_nrns,inpt_nrns);
%         V_LW{b}=rand(size(target),hid_layr_nrns);      
%         V_b{b}{1,1}=rand(hid_layr_nrns,1);
%         V_b{b}{2,1}=rand(size(target),1);
        
        %first=OF( G_best_IW, G_best_LW, G_best_b,input,target,trn_fnc )
        
    end

end



for a=1:generation        % Total generations
    a
    if stop_crit==3
        return
    end
    
   % Updation for each particle X and V
    
    for b=1:total_popul
        
%         V_IW{b}=w.*V_IW{b}+c1_b.*r1.*(P_best_IW{b}-X_IW{b})+c1_nb.*r2.*(X_IW{b}-P_Notbest_IW{b})+c2.*r3.*(G_best_IW-X_IW{b});        
        V_IW{b}=w.*V_IW{b}+c1_b.*rand.*(P_best_IW{b}-X_IW{b})+c1_nb.*rand.*(X_IW{b}-P_Notbest_IW{b})+c2.*rand.*(G_best_IW-X_IW{b});        

%         V_LW{b}=w.*V_LW{b}+c1_b.*r1.*(P_best_LW{b}-X_LW{b})+c1_nb.*r2.*(X_LW{b}-P_Notbest_LW{b})+c2.*r3.*(G_best_LW-X_LW{b});                        
        V_LW{b}=w.*V_LW{b}+c1_b.*rand.*(P_best_LW{b}-X_LW{b})+c1_nb.*rand.*(X_LW{b}-P_Notbest_LW{b})+c2.*rand.*(G_best_LW-X_LW{b});                        

%         V_b{b}{1,1}=w.*V_b{b}{1,1}+c1_b.*r1.*(P_best_b{b}{1,1}-X_b{b}{1,1})+c1_nb.*r2.*(X_b{b}{1,1}-P_Notbest_b{b}{1,1})+c2.*r3.*(G_best_b{1}-X_b{b}{1,1});
        V_b{b}{1,1}=w.*V_b{b}{1,1}+c1_b.*rand.*(P_best_b{b}{1,1}-X_b{b}{1,1})+c1_nb.*rand.*(X_b{b}{1,1}-P_Notbest_b{b}{1,1})+c2.*rand.*(G_best_b{1}-X_b{b}{1,1});
        
%         V_b{b}{2,1}=w.*V_b{b}{2,1}+c1_b.*r1.*(P_best_b{b}{2,1}-X_b{b}{2,1})+c1_nb.*r2.*(X_b{b}{2,1}-P_Notbest_b{b}{2,1})+c2.*r3.*(G_best_b{2}-X_b{b}{2,1});
        V_b{b}{2,1}=w.*V_b{b}{2,1}+c1_b.*rand.*(P_best_b{b}{2,1}-X_b{b}{2,1})+c1_nb.*rand.*(X_b{b}{2,1}-P_Notbest_b{b}{2,1})+c2.*rand.*(G_best_b{2}-X_b{b}{2,1});
        
        X_IW{b}=X_IW{b}+V_IW{b};
        X_LW{b}=X_LW{b}+V_LW{b};
        X_b{b}{1,1}=X_b{b}{1,1}+V_b{b}{1,1};
        X_b{b}{2,1}=X_b{b}{2,1}+V_b{b}{2,1};
                                                         %>
        if OF( X_IW{b},X_LW{b},X_b{b},input,target,net ) < OF( P_Notbest_IW{b},P_Notbest_LW{b},P_Notbest_b{b},input,target,net )
           
            P_Notbest_LW{b}=X_LW{b};
            P_Notbest_IW{b}=X_IW{b};
            P_Notbest_b{b}=X_b{b};                   
            
        end
                                                         %<
        if OF( X_IW{b},X_LW{b},X_b{b},input,target,net ) > OF( P_best_IW{b},P_best_LW{b},P_best_b{b},input,target,net )
           
            P_best_LW{b}=X_LW{b};
            P_best_IW{b}=X_IW{b};
            P_best_b{b}=X_b{b};                   
            
        end
        
                                                        %<
        if OF( X_IW{b},X_LW{b},X_b{b},input,target,net ) > OF( G_best_IW, G_best_LW, G_best_b,input,target,net)
             G_best_LW=X_LW{b};
             G_best_IW=X_IW{b};
             G_best_b=X_b{b};
             gen_stop=0;
        else
            gen_stop=gen_stop+1;
        end
        
                                   
    end
    
    if gen_stop==total_popul
        stop_crit=stop_crit+1;
    end
    
    gen_stop=0;
    % Check stopping criteria
 
    %final=OF( G_best_IW, G_best_LW, G_best_b,input,target,trn_fnc )
end



