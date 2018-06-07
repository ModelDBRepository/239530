%% program which perfroms the simulations for figure 6
% only patient 1 is used
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
S = zeros(Ns,1);
S(1) = 1;

paziente = 1;

switch paziente
       
    case 1   % patient stable
    %tonic dopamine
    Dop_tonic_PD = 0.43;
    Dop_tonic = Dop_tonic_PD;
    Dop_max = (0.8 - Dop_tonic);
    Dop_50 = 0.2;
    N = 2.;
    
    case 2   % paziente wearing off
    %tonic dopamine
    Dop_tonic_PD = 0.55;
    Dop_tonic = Dop_tonic_PD;
    Dop_max = (0.6 - Dop_tonic);
    Dop_50 = 0.18;
    N = 7;
    
end

STN_ON = 1;
T_ON = 1;

ft_tot = [];
ft_tot_add1 = [];
ft_tot_add2 = [];
ft_tot_add3 = [];
DA_tot = [];

dt = 0.1;
Calcola_levodopa
tau=30;
Delay = 15;
Passi = round(Delay/dt);


c3_delay = [zeros(1,Passi) c3(1:L-Passi)']';


%initialization
Nc = 4;
load W_tot_new_W0e5_D1e0
    Wgc = squeeze(Wgc_epocs(:,:,100));
    Wgs = squeeze(Wgs_epocs(:,:,100));
    Wnc = squeeze(Wnc_epocs(:,:,100));
    Wns = squeeze(Wns_epocs(:,:,100));
Ke = 7;
    
    Dop_tonic = Dop_tonic_PD;  % devo scriverslo di nuovo perché ho memorizzato Dop_tonic nel file appena letto


% simulation without training
for iiii=1:150:length(c3)
Dop_ex = c3_delay(iiii);    % ogni 10 punti è un minuto, si veda calcola_levodopa dove dt = 0.1
% computation of the total dopamine
DA = Dop_tonic+(Dop_max*Dop_ex^N)/(Dop_50^N+Dop_ex^N);
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,tt,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,DA);


ft_tot = [ft_tot ft];

end

%% simulation with training from a given instant

i_addestramento =  150*9+1; % instant from which I train the network;

for iiii=1:150:length(c3)
Dop_ex = c3_delay(iiii);
% computation of the total dopamine
DA = Dop_tonic+(Dop_max*Dop_ex^N)/(Dop_50^N+Dop_ex^N);
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,tt,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,DA);   

DA_tot = [DA_tot DA];

if iiii == i_addestramento
    Addestramento_sinapsi_senzaW   % this program trains synapses starting from the present value
    Wgc = squeeze(Wgc_epocs(:,:,end));
    Wgs = squeeze(Wgs_epocs(:,:,end));
    Wnc = squeeze(Wnc_epocs(:,:,end));
    Wns = squeeze(Wns_epocs(:,:,end));    
    clear Wgc_epocs Wgc_post Wgs_epocs Wgs_post Wnc_epocs Wnc_post Wns_epocs Wns_post;
    S = zeros(Ns,1);
    S(1) = 1;
end

ft_tot_add1  = [ft_tot_add1  ft];

end

%% %% simulation with training from a different instant
load W_tot_new_W0e5_D1e0
    Wgc = squeeze(Wgc_epocs(:,:,100));
    Wgs = squeeze(Wgs_epocs(:,:,100));
    Wnc = squeeze(Wnc_epocs(:,:,100));
    Wns = squeeze(Wns_epocs(:,:,100));
    
Dop_tonic = Dop_tonic_PD;  

i_addestramento =  150*24+1; % instant from which I train the network;

for iiii=1:150:length(c3)
Dop_ex = c3_delay(iiii);
% computation of the total dopamine
DA = Dop_tonic+(Dop_max*Dop_ex^N)/(Dop_50^N+Dop_ex^N);
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,tt,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,DA);   


if iiii == i_addestramento
    Addestramento_sinapsi_senzaW   % this program trains synapses starting from the present value
    Wgc = squeeze(Wgc_epocs(:,:,end));
    Wgs = squeeze(Wgs_epocs(:,:,end));
    Wnc = squeeze(Wnc_epocs(:,:,end));
    Wns = squeeze(Wns_epocs(:,:,end));    
    clear Wgc_epocs Wgc_post Wgs_epocs Wgs_post Wnc_epocs Wnc_post Wns_epocs Wns_pos;
    S = zeros(Ns,1);
    S(1) = 1;
end

ft_tot_add2  = [ft_tot_add2  ft];

end

%% simulation with training from a third instant
load W_tot_new_W0e5_D1e0
    Wgc = squeeze(Wgc_epocs(:,:,100));
    Wgs = squeeze(Wgs_epocs(:,:,100));
    Wnc = squeeze(Wnc_epocs(:,:,100));
    Wns = squeeze(Wns_epocs(:,:,100));
    
 Dop_tonic = Dop_tonic_PD;  
    
i_addestramento =  150*29+1; % instant from which I train the network;

for iiii=1:150:length(c3)
Dop_ex = c3_delay(iiii);
% computation of the total dopamine
DA = Dop_tonic+(Dop_max*Dop_ex^N)/(Dop_50^N+Dop_ex^N);
[Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,tt,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,DA);   


if iiii == i_addestramento
    Addestramento_sinapsi_senzaW   % this program trains synapses starting from the present value
    Wgc = squeeze(Wgc_epocs(:,:,end));
    Wgs = squeeze(Wgs_epocs(:,:,end));
    Wnc = squeeze(Wnc_epocs(:,:,end));
    Wns = squeeze(Wns_epocs(:,:,end));    
    clear Wgc_epocs Wgc_post Wgs_epocs Wgs_post Wnc_epocs Wnc_post Wns_epocs Wns_pos;
    S = zeros(Ns,1);
    S(1) = 1;
end

ft_tot_add3  = [ft_tot_add3  ft];

end



%% figure plotting
t1 = t(1:150:end);

width = 1.5;
font = 16;

close all
figure
subplot(221)
plot(t,c1,'r-',t,c3_delay,'b','linewidth', width)
xlabel('time (min)','fontsize',font)
ylabel('levodopa  (\mug/ml)','fontsize',font)
legend1=legend('blood','brain')
set(gca,'fontsize',font)
subplot(222)
plot(t1,DA_tot,'b-','linewidth', width)
xlabel('time (min)','fontsize',font)
ylabel('dopaminergic input','fontsize',font)
set(gca,'fontsize',font)
subplot(223)
plot(t1,ft_tot_add1.*60,'g-',t1,ft_tot.*60,'b-','linewidth', width)
xlabel('time (min)','fontsize',font)
ylabel('tapping frequency (cycles/min)','fontsize',font) 
set(gca,'fontsize',font)
subplot(224)
plot(t1,ft_tot_add2.*60,'r-',t1,ft_tot_add3.*60,'m--',t1,ft_tot.*60,'b-','linewidth', width)
xlabel('time (min)','fontsize',font)
ylabel('tapping frequency (cycles/min)','fontsize',font) 
set(gca,'fontsize',font)



