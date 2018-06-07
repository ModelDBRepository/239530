%% program which perfroms the simulations for figure 9:  analysis of diskynesia
clear all
close all
clc
Ke = [1:1:9];
Da_min = [0.65 0.65 0.65 0.75 0.8 0.85 0.9 0.6 0.6]
Da_max = [10 10 10 10 1.6 1.55 1.5 1.15 1.55];
width = 1.5;
font = 16;
figure
plot(Da_min,Ke,'--k','linewidth',width)
hold on
plot(Da_max,Ke,'--k','linewidth',width)
axis([0 2 0.9 9.1])
xlabel('dopaminergic input','fontsize',font)
ylabel('STN strength','fontsize',font)
title('Sensitivity analysis on dyskinesia','fontsize',font)
set(gca,'fontsize',font)
text(0.3,6,'normal','fontsize',font)
text(0.95,6.5,'dyskinesia','fontsize',font)

load W_tot_new_W0e5_D1e0
    Wgc = squeeze(Wgc_epocs(:,:,100));
    Wgs = squeeze(Wgs_epocs(:,:,100));
    Wnc = squeeze(Wnc_epocs(:,:,100));
    Wns = squeeze(Wns_epocs(:,:,100));
    

 
global alpha beta gamma

% Gain from DA to Go (excitation)
alpha = 0.75;  %(0.2*(Ugo_trigger-0.8)+0.5)/(0.7*(Ugo_trigger-0.8));

%gain from DA to No-Go (inhibition)
beta = -1;

%gain form DA to the cholinergic interneuron
gamma = -0.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
Ke = 8;   


Ns = 4;

S = zeros(Ns,1);
S(1) = 1;

STN_ON = 1;
T_ON = 1;

Dop_tonic =  1.15;
    
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq = ft*60
width = 1.5;
font = 18;
figure
plot(t/1000,C(1,:),'b',t/1000,C(2,:),'r','linewidth',width)
title('blue: channel 1; red = channel 2','fontsize',font)
xlabel('time (s)','fontsize',font)
ylabel('cortical neuron activity','fontsize',font)
axis([0 3 0 1.1])



