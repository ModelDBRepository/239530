%% Program which performs the plots for Figure 2 from previous training data 
% the synapses were previously stored in the mat file 
% named "W_tot_new_W0e5_D1e0"
clear all
close all
clc

load W_tot_new_W0e5_D1e0

t = 1:1:N_epoche;

width = 1.5;
font = 16;
font1 = 14;

%plot Wgc
figure
subplot(2,2,1)
plot(t,squeeze(Wgc_epocs(1,1,1:N_epoche)),'linewidth',width)
axis([0 300 0.45 0.66])
ylabel('synapse strength','fontsize',font1)
set(gca,'fontsize',font1)
subplot(2,2,2)
plot(t,squeeze(Wgc_epocs(1,2,1:N_epoche)),'linewidth',width)
axis([0 300 -0.45 0.45])
set(gca,'fontsize',font1)
subplot(2,2,3)
plot(t,squeeze(Wgc_epocs(2,1,1:N_epoche)),'linewidth',width)
axis([0 300 -0.45 0.45])
ylabel('synapse strength','fontsize',font1)
xlabel('epochs','fontsize',font1)
set(gca,'fontsize',font1)
subplot(2,2,4)
plot(t,squeeze(Wgc_epocs(2,2,1:N_epoche)),'linewidth',width)
axis([0 300 0.43 0.66])
xlabel('epochs','fontsize',font1)
set(gca,'fontsize',font1)

ax=axes('Units','Normal','Position',[.075 .075 .85 .85],'Visible','off');
set(get(ax,'Title'),'Visible','on')
title('W_G_C','fontsize',font);

%plot Wgs
figure
subplot(2,2,1)
plot(t,squeeze(Wgs_epocs(1,1,1:N_epoche)),'linewidth',width)
axis([0 300 0.45 0.66])
ylabel('synapse strength','fontsize',font1)
set(gca,'fontsize',font1)
subplot(2,2,2)
plot(t,squeeze(Wgs_epocs(1,2,1:N_epoche)),'linewidth',width)
axis([0 300 0.1 0.55])
set(gca,'fontsize',font1)
subplot(2,2,3)
plot(t,squeeze(Wgs_epocs(2,1,1:N_epoche)),'linewidth',width)
axis([0 300 0.1 0.55])
ylabel('synapse strength','fontsize',font1)
xlabel('epochs','fontsize',font1)
set(gca,'fontsize',font1)
subplot(2,2,4)
plot(t,squeeze(Wgs_epocs(2,2,1:N_epoche)),'linewidth',width)
axis([0 300 0.45 0.66])
xlabel('epochs','fontsize',font1)
set(gca,'fontsize',font1)

ax=axes('Units','Normal','Position',[.075 .075 .85 .85],'Visible','off');
set(get(ax,'Title'),'Visible','on')
title('W_G_S','fontsize',font);

%plot Wnc
figure
subplot(2,2,1)
plot(t,squeeze(Wnc_epocs(1,1,1:N_epoche)),'linewidth',width)
axis([0 300 0.3 0.55])
ylabel('synapse strength','fontsize',font1)
set(gca,'fontsize',font1)
subplot(2,2,2)
plot(t,squeeze(Wnc_epocs(1,2,1:N_epoche)),'linewidth',width)
axis([0 300 -0.45 0.45])
set(gca,'fontsize',font1)
subplot(2,2,3)
plot(t,squeeze(Wnc_epocs(2,1,1:N_epoche)),'linewidth',width)
axis([0 300 -0.45 0.45])
ylabel('synapse strength','fontsize',font1)
xlabel('epochs','fontsize',font1)
set(gca,'fontsize',font1)
subplot(2,2,4)
plot(t,squeeze(Wnc_epocs(2,2,1:N_epoche)),'linewidth',width)
axis([0 300 0.3 0.55])
xlabel('epochs','fontsize',font1)
set(gca,'fontsize',font1)

ax=axes('Units','Normal','Position',[.075 .075 .85 .85],'Visible','off');
set(get(ax,'Title'),'Visible','on')
title('W_N_C','fontsize',font);

%plot Wns
figure
subplot(2,2,1)
plot(t,squeeze(Wns_epocs(1,1,1:N_epoche)),'linewidth',width)
axis([0 300 0.2 0.55])
ylabel('synapse strength','fontsize',font1)
subplot(2,2,2)
plot(t,squeeze(Wns_epocs(1,2,1:N_epoche)),'linewidth',width)
axis([0 300 0.2 0.55])
subplot(2,2,3)
plot(t,squeeze(Wns_epocs(2,1,1:N_epoche)),'linewidth',width)
axis([0 300 0.2 0.55])
ylabel('synapse strength','fontsize',font1)
xlabel('epochs','fontsize',font1)
subplot(2,2,4)
plot(t,squeeze(Wns_epocs(2,2,1:N_epoche)),'linewidth',width)
axis([0 300 0.2 0.55])
xlabel('epochs','fontsize',font1)

ax=axes('Units','Normal','Position',[.075 .075 .85 .85],'Visible','off');
set(get(ax,'Title'),'Visible','on')
title('W_N_S','fontsize',font);



    
 % I compute the number of responses at different epochs of training
 for kk = 1:N_epoche
tot_vett_no_risposta(kk) = sum(vett_no_risposta(1:kk));
tot_vett_punishment(kk) = sum(vett_punishment(1:kk));
tot_vett_reward(kk) = sum(vett_reward(1:kk));
 end
 index = (1:N_epoche);
figure
plot(index,tot_vett_no_risposta,'y',index,tot_vett_punishment,'r',index,tot_vett_reward,'g','linewidth',2)
xlabel('Number of epochs','fontsize',font)
ylabel('cumulative distribution','fontsize',font)
title('yellow: no response; red: punishment; green: reward','fontsize',font)
set(gca,'fontsize',font)

    
    