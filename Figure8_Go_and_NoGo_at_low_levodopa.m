%% program which perfroms the simulations for figure 8
clear all
close all
clc


%% basal stimuli

%Sn: 
Ns = 4;

%S1: stimulus 1
S1(1) = 1;   
S1(2) = 0.;   
S1(3) = 0;
S1(4) = 0;
S1 = S1';

Correct_winner_1 = 1;

%S2: stimulus 2
S2(1) =  0.;   
S2(2) = 1;   
S2(3) = 0;
S2(4) = 0;
S2 = S2';

Correct_winner_2 = 2;


%% synapse initialization

Nc = 4;
    
    
    par = 0;

        
    load W_tot_new_W0e5_D1e0
    Wgc = squeeze(Wgc_epocs(:,:,100));
    Wgs = squeeze(Wgs_epocs(:,:,100));
    Wnc = squeeze(Wnc_epocs(:,:,100));
    Wns = squeeze(Wns_epocs(:,:,100));
 

%%

Dop_tonic = 0.55;


j1_reward = 3;
j1_punishment = 5;
% S1_reward = 3:4:(3+4*100);
% S1_punishment = 5:4:(5+4*100);

j2_reward = 2;
j2_punishment = 4;
% S2_reward = 2:4:(2+4*100);
% S2_punishment = 4:4:(2+4*100);

continua = 1;

while continua ==1
  
    
    resto = 1;
    noise = 0*randn(2,1);

    if resto == 1   %sono nel caso dispari
        S = S1;  
        S(1) = S(1)+noise(1);
        S(2) = S(2)+noise(2);
        Correct_winner = Correct_winner_1;
    elseif resto == -1   %sono nel caso pari
        S = S2;
        S(1) = S(1)+noise(1);
        S(2) = S(2)+noise(2);
        Correct_winner = Correct_winner_2;
    end
    
    S(find(S>1)) = 1;
    S(find(S<0)) = 0;
    S(3:4) = 0;
    

    
    [Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,Wgc_post,Wgs_post,Wnc_post,Wns_post,r,k_reward,ChI] = BG_model_function_Ach(S,Wgc,Wgs,Wnc,Wns,Correct_winner,Dop_tonic);


   r 
 width = 1.5;
 font = 16; 
 
 
   wgchi = -1;
   subplot(221)
   plot(t,IGo_DA_Ach(1,:),'b',t,IGo_DA_Ach(2,:),'r','linewidth',width) 
   ylabel('Dopamine input','fontsize', font)
   m = min(min(IGo_DA_Ach(1:2,:)));
   M = max(max(IGo_DA_Ach(1:2,:)));
   axis([0 600 m-0.05 M+0.05])
    set(gca,'fontsize', font)
   subplot(222)
   plot(t,wgchi*ChI,'g','linewidth',width)
   ylabel('Cholinergic input','fontsize', font)
    m = min(min(wgchi*ChI));
   M = max(max(wgchi*ChI));
   axis([0 600 m-0.05 M+0.05])
    set(gca,'fontsize', font)
   subplot(223)
   plot(t,Go(1,:),'b',t,Go(2,:),'r',[0 600], [0.5 0.5],'k--','linewidth',width) 
   xlabel('time (ms)', 'fontsize', font)
   ylabel('Go activity','fontsize', font)
   M = max(max(Go(1:2,:)));
   axis([0 600 0 M+0.05])
   set(gca,'fontsize', font)
   subplot(224)
   plot(t,NoGo(1,:),'b',t,NoGo(2,:),'r',[0 600],[0.5 0.5],'k--','linewidth',width) 
   xlabel('time (ms)', 'fontsize', font)
   ylabel('NoGo activity','fontsize', font)
   M = max(max(NoGo(1:2,:)));
   axis([0 600 0 M+0.01])
   set(gca,'fontsize', font)
   
   ax=axes('Units','Normal','Position',[.075 .075 .85 .85],'Visible','off');
   set(get(ax,'Title'),'Visible','on')
   title('blue: ch1; red: ch2; green: common','fontsize',font);
   
   continua = input('do you wish to perform another simulation? (yes = 1) ');
   resto = -resto;


end






