%% program which performs the simulations for figure 4 (sensitivity analysis on synapses)
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

S = zeros(Ns,1);
S(1) = 1;

Nc = 4; 

    load W_tot_new_W0e5_D1e0
    Wgc0 = squeeze(Wgc_epocs(:,:,150));
    Wgs0 = squeeze(Wgs_epocs(:,:,150));
    Wnc0 = squeeze(Wnc_epocs(:,:,150));
    Wns0 = squeeze(Wns_epocs(:,:,150));
    Ke0 = 7;


    
    Valori_dopamina = [0.05:0.05:1.0];
    L = length(Valori_dopamina);
    STN_ON = 1;
    T_ON = 1;
    Numero_variazioni = 7;  % faccio sempre 7 prove
    Freq = zeros(Numero_variazioni,L);
    
    for ingresso = 1:3
    switch ingresso
        
        case 1    
            figure(1)
            variazione_percentuale = (-0.21:0.07:0.21);

            for kk = 1:Numero_variazioni
                
                Wgc = Wgc0*(1+variazione_percentuale(kk));
                Wgs = Wgs0*(1+variazione_percentuale(kk));
                Wnc = Wnc0;
                Wns = Wns0;
                Ke = Ke0;
                
                    for jj = 1: L,
                    Dop_tonic = Valori_dopamina(jj)
                    [Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
                    Freq(kk,jj) = ft*60;
                    end
                    
            end
            
       case 2          
           figure(2)
            variazione_percentuale = (-0.9:0.3:0.9);
            for kk = 1:Numero_variazioni
                
                Wgc = Wgc0;
                Wgs = Wgs0;
                Wnc = Wnc0*(1+variazione_percentuale(kk));
                Wns = Wns0*(1+variazione_percentuale(kk));
                Ke = Ke0;
                
                    for jj = 1: L,
                    Dop_tonic = Valori_dopamina(jj)
                    [Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
                    Freq(kk,jj) = ft*60;
                    end
                    
            end
            
                   case 3 
              figure(3)
            variazione_percentuale = (-0.9:0.3:0.9);
            for kk = 1:Numero_variazioni
                
                Wgc = Wgc0;
                Wgs = Wgs0;
                Wnc = Wnc0;
                Wns = Wns0;
                Ke = Ke0*(1+variazione_percentuale(kk));
                
                    for jj = 1: L,
                    Dop_tonic = Valori_dopamina(jj)
                    [Uc,C,Ugo,Go,IGo_DA_Ach,Unogo,NoGo,INoGo_DA_Ach,Ugpe,Gpe,Ugpi,Gpi,Ut,T,Ustn,STN,E,t,k_tap_vett,Uchi,ChI,ft] = BG_model_function_tapping_mauro(S,Wgc,Wgs,Wnc,Wns,Ke,STN_ON,T_ON,Dop_tonic);
                    Freq(kk,jj) = ft*60;
                    end
                    
            end
    end
    
   
font = 16;
width = 1.5
        
plot(Valori_dopamina,Freq(1,:),'color',[0,0,1],'linewidth',width)        %blue
hold on
plot(Valori_dopamina,Freq(2,:),'color',[0.25,0,0.75],'linewidth',width)
plot(Valori_dopamina,Freq(3,:),'color',[0.75,0,0.25],'linewidth',width)
plot(Valori_dopamina,Freq(4,:),'color',[1,0,0],'linewidth',width)        % red
plot(Valori_dopamina,Freq(5,:),'color',[0.75,0.25,0],'linewidth',width)
plot(Valori_dopamina,Freq(6,:),'color',[0.25,0.75,0],'linewidth',width)
plot(Valori_dopamina,Freq(7,:),'color',[0,1,0],'linewidth',width)        % green
xlabel('Dopaminergic input','fontsize',16)
ylabel('Tapping frequency(cycles/min)','fontsize',font)
set(gca,'fontsize',font)
switch ingresso
    case 1
        title('sensitivity analysis on the Go','fontsize',font)
    legend1 = legend('-21%','-14%','-7%','basal', '+7%', '+14%','+21%');
    set(legend1,'fontsize',14)
    set(legend1,'location','southeast')
    case 2
        title('sensitivity analysis on the No Go','fontsize',font)
    legend1 = legend('-90%','-60%','-30%','basal', '+30%', '+60%','+90%');
    set(legend1,'fontsize',14)
    set(legend1,'location','southeast')
     case 3
        title('sensitivity analysis on the STN','fontsize',font)
    legend1 = legend('-90%','-60%','-30%','basal', '+30%', '+60%','+90%');
    set(legend1,'fontsize',14)
    set(legend1,'location','southeast')
end
      
    end
