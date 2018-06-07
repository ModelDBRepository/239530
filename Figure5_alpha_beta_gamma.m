%% program which performs the simulations for figure 5 (sensitivity analysis on receptors)
clear all
close all
clc

global alpha beta gamma

% Gain from DA to Go (excitation)
alpha = 0.75;  %(0.2*(Ugo_trigger-0.8)+0.5)/(0.7*(Ugo_trigger-0.8));

%gain from DA to No-Go (inhibition)
beta = -1;

%gain form DA to the cholinergic interneuron
gamma = -0.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ns = 4;
Nc = 4;
caso = 0;

S = zeros(Ns,1);
S(1) = 1;

Valori_dopamina = [0.05:0.05:1.0];
L = length(Valori_dopamina);
STN_ON = 1;
T_ON = 1;
Freq = zeros(1,L);

    load W_tot_new_W0e5_D1e0
    Wgc = squeeze(Wgc_epocs(:,:,150));
    Wgs = squeeze(Wgs_epocs(:,:,150));
    Wnc = squeeze(Wnc_epocs(:,:,150));
    Wns = squeeze(Wns_epocs(:,:,150));
Ke = 7;

for jj = 1: L,
Dop_tonic = Valori_dopamina(jj)
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq(jj) = ft*60;
end

plot(Valori_dopamina,Freq,'r','linewidth',1.5)
xlabel('Dopaminergic input','fontsize',18)
ylabel('Tapping frequency (cycles/min)','fontsize',18)
hold on

%% impaired D1 receotors 
% Gain from DA to Go (excitation)
alpha = 0.75*0.5;  %(0.2*(Ugo_trigger-0.8)+0.5)/(0.7*(Ugo_trigger-0.8));

%gain from DA to No-Go (inhibition)
beta = -1;

%gain form DA to the cholinergic interneuron
gamma = -0.5;

for jj = 1: L,
Dop_tonic = Valori_dopamina(jj)
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq(jj) = ft*60;
end
plot(Valori_dopamina,Freq,'g','linewidth',1.5)

%% impaired D2 receptors
% Gain from DA to Go (excitation)
alpha = 0.75;  %(0.2*(Ugo_trigger-0.8)+0.5)/(0.7*(Ugo_trigger-0.8));

%gain from DA to No-Go (inhibition)
beta = -1*0.5;

%gain form DA to the cholinergic interneuron
gamma = -0.5;

for jj = 1: L,
Dop_tonic = Valori_dopamina(jj)
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq(jj) = ft*60;
end
plot(Valori_dopamina,Freq,'b','linewidth',1.5)

%% impaired cholinergic
% Gain from DA to Go (excitation)
alpha = 0.75;  %(0.2*(Ugo_trigger-0.8)+0.5)/(0.7*(Ugo_trigger-0.8));

%gain from DA to No-Go (inhibition)
beta = -1;

%gain form DA to the cholinergic interneuron
gamma = -0.5*0.5;

for jj = 1: L,
Dop_tonic = Valori_dopamina(jj)
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq(jj) = ft*60;
end
plot(Valori_dopamina,Freq,'m','linewidth',1.5)
legend1 = legend('intact','half D1','half D2','half Ch');
set(legend1,'fontsize',14)
set(legend1,'location','northwest')
set(gca,'fontsize',18)


