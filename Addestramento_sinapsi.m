%% PROGRAM FOR TRAINING SYNAPSES
% synapses are trained for 300 epochs, starting from an initial value
% assigned in lines 36-66
% the results are saved in the mat file named "W_tot_new"
% and can be plotted by the program "plot_addestrameno_sinapsi"

clear all
close all
clc

%% basal stimuli

% four stimuli may be applied to the network
Ns = 4;

%S1: stimulus 1
S1(1) = 1.0;   
S1(2) = 0.0;   
S1(3) = 0;
S1(4) = 0;
S1 = S1';

Correct_winner_1 = 1;

%S2: stimulus 2
S2(1) =  0.0;   
S2(2) = 1.0;   
S2(3) = 0;
S2(4) = 0;
S2 = S2';

Correct_winner_2 = 2;



%% initial value of synapses before learning
% default value = 0.5 before learning

Nc = 4;
    
    
    par = 0;


    % weights from cortex to GO
    Wgc = 0.5*diag(ones(Nc,1));
    Wgc(3,3) = 0;
    Wgc(4,4) = 0;
    
    
    %  weights from stimuli to GO
    Wgs = 0.5*diag(ones(Nc,1));
    Wgs(1,2) = 0.5;
    Wgs(2,1) = 0.5;
    
    %  weights from cortex to NOGO
    Wnc = 0.5*diag(ones(Nc,1));
    Wnc(3,3) = 0;
    Wnc(4,4) = 0;
    
    %  weights from stimuli to NOGO
    Wns = 0.5*diag(ones(Nc,1));
    Wns(1,2) = 0.5;
    Wns(2,1) = 0.5;
    


%%

N_epoche = 300;  
Dop_tonic = 1.2;  % value of the dopaminergic input used during training, default 1.2


j1_reward = 3;
j1_punishment = 5;


j2_reward = 2;
j2_punishment = 4;

Wgc_epocs = zeros(Nc,Nc,N_epoche);
Wgs_epocs= zeros(Nc,Nc,N_epoche);
Wnc_epocs = zeros(Nc,Nc,N_epoche);
Wns_epocs = zeros(Nc,Nc,N_epoche);

Wgc_epocs(:,:,1) = Wgc;
Wgs_epocs(:,:,1) = Wgs;
Wnc_epocs(:,:,1) = Wnc;
Wns_epocs(:,:,1) = Wns;

vett_reward = zeros(N_epoche,1);
vett_punishment = zeros(N_epoche,1);
vett_no_risposta = zeros(N_epoche,1);

S_vett = zeros(2,N_epoche);
S1_vett = zeros(2,N_epoche);
S2_vett = zeros(2,N_epoche);



%%
for i = 1:N_epoche
    
    Wgc = squeeze(Wgc_epocs(:,:,i));
    Wgs = squeeze(Wgs_epocs(:,:,i));
    Wnc = squeeze(Wnc_epocs(:,:,i));
    Wns = squeeze(Wns_epocs(:,:,i));


    resto = rem(i,2);
    noise = 0*randn(2,1);

    if resto == 1   % odd
        S = S1;  
        S(1) = S(1)+noise(1);
        S(2) = S(2)+noise(2);
        Correct_winner = Correct_winner_1;
    elseif resto == 0   % even
        S = S2;
        S(1) = S(1)+noise(1);
        S(2) = S(2)+noise(2);
        Correct_winner = Correct_winner_2;
    end
    
    S(find(S>1)) = 1;
    S(find(S<0)) = 0;
    S(3:4) = 0;
    

    % Call to the function which simulates the basal ganglia response
    [Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,Wgc_post,Wgs_post,Wnc_post,Wns_post,r,k_reward,ChI] = BG_model_function_Ach(S,Wgc,Wgs,Wnc,Wns,Correct_winner,Dop_tonic);


    [i r] 

    
    if r==1
        vett_reward(i) = 1;
    elseif r==-1
        vett_punishment(i) = 1;
    else
        vett_no_risposta(i) = 1;
    end
    
    S_vett(1,i) = S(1);
    S_vett(2,i) = S(2);
    
    if resto == 1
        S1_vett(1,i) = S(1);
        S1_vett(2,i) = S(2);

    elseif resto == 2
        S2_vett(1,i) = S(1);
        S2_vett(2,i) = S(2);
    end

    
    Wgc_epocs(:,:,i+1) = Wgc_post;
    Wgs_epocs(:,:,i+1) = Wgs_post;
    Wnc_epocs(:,:,i+1) = Wnc_post;
    Wns_epocs(:,:,i+1) = Wns_post;
    
    

    
    %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    clear Wgc Wgs Wnc Wns
    
end 

%rewards
reward_tot = sum(vett_reward)
%punishments
punishment_tot = sum(vett_punishment)
%no answers
no_answer_tot = sum(vett_no_risposta)

% save the date to the file named W_tot_new. This name can be subsequently changed 
save W_tot_new Wgc_epocs Wgs_epocs Wnc_epocs Wns_epocs vett_reward vett_punishment vett_no_risposta S_vett Dop_tonic N_epoche




