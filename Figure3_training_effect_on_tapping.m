%% Program which performs the simulations for Figure 3
% figure "tapping frequency vs. dopaminergic input" at various epochs
% and temporal patterns
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
    Wgc = squeeze(Wgc_epocs(:,:,100));
    Wgs = squeeze(Wgs_epocs(:,:,100));
    Wnc = squeeze(Wnc_epocs(:,:,100));
    Wns = squeeze(Wns_epocs(:,:,100));
Ke = 7;

for jj = 1: L,
Dop_tonic = Valori_dopamina(jj)
S = zeros(Ns,1);
S(1) = 1;
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq(jj) = ft*60;
end

plot(Valori_dopamina,Freq,'r','linewidth',1.5)
xlabel('Dopaminergic input','fontsize',18)
ylabel('Tapping frequency (cycles/min)','fontsize',18)
hold on



    Wgc = squeeze(Wgc_epocs(:,:,150));
    Wgs = squeeze(Wgs_epocs(:,:,150));
    Wnc = squeeze(Wnc_epocs(:,:,150));
    Wns = squeeze(Wns_epocs(:,:,150));
for jj = 1: L,
Dop_tonic = Valori_dopamina(jj)
S = zeros(Ns,1);
S(1) = 1;
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq(jj) = ft*60;
end
plot(Valori_dopamina,Freq,'g','linewidth',1.5)


    Wgc = squeeze(Wgc_epocs(:,:,200));
    Wgs = squeeze(Wgs_epocs(:,:,200));
    Wnc = squeeze(Wnc_epocs(:,:,200));
    Wns = squeeze(Wns_epocs(:,:,200));
for jj = 1: L,
Dop_tonic = Valori_dopamina(jj)
S = zeros(Ns,1);
S(1) = 1;
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq(jj) = ft*60;
end
plot(Valori_dopamina,Freq,'b','linewidth',1.5)
legend1 = legend('100 epochs','150 epochs','200 epochs');
set(legend1,'fontsize',14)
set(legend1,'location','northwest')
set(gca,'fontsize',18)


%% plot the temporal figures
clear
STN_ON = 1;
T_ON = 1;
Ns = 4;
Ke = 7;
figure(2)
load W_tot_new_W0e5_D1e0

    Wgc = squeeze(Wgc_epocs(:,:,1));
    Wgs = squeeze(Wgs_epocs(:,:,1));
    Wnc = squeeze(Wnc_epocs(:,:,1));
    Wns = squeeze(Wns_epocs(:,:,1));
    
    Dop_tonic = 0.55 ;
    width = 1.5;
font = 18;

S = zeros(Ns,1);
S(1) = 1;
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq = ft*60

subplot(411)
plot(t/1000,C(1,:),'b',t/1000,C(2,:),'r','linewidth',width)
title('blue: channel 1; red = channel 2','fontsize',font)
axis([1 3 0 1.1])



    Wgc = squeeze(Wgc_epocs(:,:,50));
    Wgs = squeeze(Wgs_epocs(:,:,50));
    Wnc = squeeze(Wnc_epocs(:,:,50));
    Wns = squeeze(Wns_epocs(:,:,50));

Dop_tonic = 0.55 ;
S = zeros(Ns,1);
S(1) = 1;
    
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq = ft*60
subplot(412)
plot(t/1000,C(1,:),'b',t/1000,C(2,:),'r','linewidth',width)
axis([1 3 0 1.1])

   

    Wgc = squeeze(Wgc_epocs(:,:,100));
    Wgs = squeeze(Wgs_epocs(:,:,100));
    Wnc = squeeze(Wnc_epocs(:,:,100));
    Wns = squeeze(Wns_epocs(:,:,100));

Dop_tonic = 0.43 ;
S = zeros(Ns,1);
S(1) = 1;
    
    [Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq = ft*60

subplot(413)
plot(t/1000,C(1,:),'b',t/1000,C(2,:),'r','linewidth',width)
ylabel('            cortical neuron activity','fontsize',font)
axis([1 3 0 1.1])

    Wgc = squeeze(Wgc_epocs(:,:,150));
    Wgs = squeeze(Wgs_epocs(:,:,150));
    Wnc = squeeze(Wnc_epocs(:,:,150));
    Wns = squeeze(Wns_epocs(:,:,150));
    
Dop_tonic = 0.55 ;
S = zeros(Ns,1);
S(1) = 1;
    [Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
Freq = ft*60

subplot(414)
plot(t/1000,C(1,:),'b',t/1000,C(2,:),'r','linewidth',width)

xlabel('time (s)','fontsize',font)
axis([1 3 0 1.1])


