% program which plots all plots (synapses and rewards) after training 
clear all
close all
clc

load W_tot_new

t = 1:1:N_epoche;

width = 1.5;
font = 18;

%plot Wgc
figure
subplot(2,2,1)
plot(t,squeeze(Wgc_epocs(1,1,1:N_epoche)),'linewidth',width)
subplot(2,2,2)
plot(t,squeeze(Wgc_epocs(1,2,1:N_epoche)),'linewidth',width)
subplot(2,2,3)
plot(t,squeeze(Wgc_epocs(2,1,1:N_epoche)),'linewidth',width)
subplot(2,2,4)
plot(t,squeeze(Wgc_epocs(2,2,1:N_epoche)),'linewidth',width)
title('W_G_C')

%plot Wgs
figure
subplot(2,2,1)
plot(t,squeeze(Wgs_epocs(1,1,1:N_epoche)),'linewidth',width)
subplot(2,2,2)
plot(t,squeeze(Wgs_epocs(1,2,1:N_epoche)),'linewidth',width)
subplot(2,2,3)
plot(t,squeeze(Wgs_epocs(2,1,1:N_epoche)),'linewidth',width)
subplot(2,2,4)
plot(t,squeeze(Wgs_epocs(2,2,1:N_epoche)),'linewidth',width)
title('W_G_S')

%plot Wnc
figure
subplot(2,2,1)
plot(t,squeeze(Wnc_epocs(1,1,1:N_epoche)),'linewidth',width)
subplot(2,2,2)
plot(t,squeeze(Wnc_epocs(1,2,1:N_epoche)),'linewidth',width)
subplot(2,2,3)
plot(t,squeeze(Wnc_epocs(2,1,1:N_epoche)),'linewidth',width)
subplot(2,2,4)
plot(t,squeeze(Wnc_epocs(2,2,1:N_epoche)),'linewidth',width)
title('W_N_C')

%plot Wns
figure
subplot(2,2,1)
plot(t,squeeze(Wns_epocs(1,1,1:N_epoche)),'linewidth',width)
subplot(2,2,2)
plot(t,squeeze(Wns_epocs(1,2,1:N_epoche)),'linewidth',width)
subplot(2,2,3)
plot(t,squeeze(Wns_epocs(2,1,1:N_epoche)),'linewidth',width)
subplot(2,2,4)
plot(t,squeeze(Wns_epocs(2,2,1:N_epoche)),'linewidth',width)
title('W_N_S')



reward_tot = sum(vett_reward)
punishment_tot = sum(vett_punishment)
no_answer_tot = sum(vett_no_risposta)


    
 % I compute the cumulative sum of all responses
 for kk = 1:N_epoche
tot_vett_no_risposta(kk) = sum(vett_no_risposta(1:kk));
tot_vett_punishment(kk) = sum(vett_punishment(1:kk));
tot_vett_reward(kk) = sum(vett_reward(1:kk));
 end
 index = (1:N_epoche);
figure
plot(index,tot_vett_no_risposta,'y',index,tot_vett_punishment,'r',index,tot_vett_reward,'g','linewidth',width)
xlabel('Number of epochs','fontsize',font)
ylabel('cumulative distribution','fontsize',font)
title('yellow: no response; red: punishment; green: reward','fontsize',font)
set(gca,'fontsize',font)

    
    