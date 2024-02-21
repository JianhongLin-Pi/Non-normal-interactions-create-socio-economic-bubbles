
load data_figure3_SizeBubble_stepness_control.mat

TextSize = 10;
x_p = T+20;
y_p = 0;
FS=10;
figure;
MS=0.8;
LW=1.1;
for ii = 1:4
    subplot('position',[0.08 0.8-(ii-1)*0.08 0.255 0.05]);
    plot(m_top_node{1,ii},'color',[0.615  0.615 0.615],'linewidth',LW/1.2);hold on
    plot(x{1,ii}*2-1,'color',[0, 0.4470, 0.7410],'linewidth',LW);hold on;grid on
    ylim([-1.05 1.05]);
    set(gca,'LineWidth',0.4)
    ylabel('$m_t$','Interpreter','Latex','Fontsize',FS,'Fontname', 'Times New Roman');
    xticks([0 504 1008 1512 2016]);
    
    xlim([0 T]);
    if ii==1
        title('$N_0=1, \theta=0, \kappa=0.98$','Interpreter','Latex');
        text(-270, 1.7,'(a)','Fontsize',FS);
    end
    
    if ii==2
        title('$N_0=5, \theta=0, \kappa=0.98$','Interpreter','Latex');
    end
    
    if ii==3
        title('$N_0=1, \theta=0, \kappa=0.90$','Interpreter','Latex');
    end
    
    if ii==4
        title('$N_0=1, \theta=0, \kappa=0.60$','Interpreter','Latex');
        xticks([0 504 1008 1512 2016]);
        xticklabels({'0' '2 year' '4 year' '6 year' '8 year'});
    end
    
    
    if ii<4
       set(gca,'xticklabel',[]);
    end
    set(gca, 'Fontname', 'Times New Roman','FontSize',FS);
    
    subplot('position',[0.38 0.8-(ii-1)*0.08 0.255 0.05]);
    plot(m_top_node{2,ii},'color',[0.615, 0.615, 0.615],'linewidth',LW/1.2);hold on
    plot(x{2,ii}*2-1,'color',[0.8500, 0.3250, 0.0980],'linewidth',LW);hold on;grid on
    ylim([-1.05 1.05]);
    set(gca,'LineWidth',0.4);
    xticks([0 504 1008 1512 2016]);
    xlim([0 T]);
    if ii<4
       set(gca,'xticklabel',[]);
    end
    ylabel('$m_t$','Interpreter','Latex','Fontsize',FS,'Fontname', 'Times New Roman');
    
   if ii==1
        title('$N_0=1, \theta=1, \kappa=0.98$','Interpreter','Latex');
        text(-270, 1.7,'(b)','Fontsize',FS);
    end
    
    if ii==2
        title('$N_0=5, \theta=1, \kappa=0.98$','Interpreter','Latex');
    end
    
    if ii==3
        title('$N_0=1, \theta=1, \kappa=0.90$','Interpreter','Latex');
    end
    
    if ii==4
        title('$N_0=1, \theta=1, \kappa=0.60$','Interpreter','Latex');
        xticks([0 504 1008 1512 2016]);
        xticklabels({'0' '2 year' '4 year' '6 year' '8 year'});
    end
    
    set(gca, 'Fontname', 'Times New Roman','FontSize',FS);
    
    subplot('position',[0.68 0.8-(ii-1)*0.08 0.255 0.05]);
    plot(P{2,ii},'color',[0.8500, 0.3250, 0.0980],'linewidth',LW);hold on;grid on
    plot(P{1,ii},'color',[0, 0.4470, 0.7410],'linewidth',LW);hold on;grid on
    ylim([0.5 5]);
    xticks([0 504 1008 1512 2016]);
    set(gca,'LineWidth',0.4)
    xlim([0 T]);
    if ii<4
       set(gca,'xticklabel',[]);
    end
    
    yticks([1 3 5]);
    yticklabels({'1' '3' '5'});
    ylabel('$P_t$','Interpreter','Latex','Fontsize',FS,'Fontname', 'Times New Roman')
    ylim([0.5 4]);
    yticks([1 2 3 4]);
    yticklabels({'1' '2' '3' '4'});
    set(gca, 'Fontname', 'Times New Roman','FontSize',FS);
    if ii==1
        title('$N_0=1, \kappa=0.98$','Interpreter','Latex');
        text(-270, 5,'(c)','Fontsize',FS);
    end
    
    if ii==2
        title('$N_0=5, \kappa=0.98$','Interpreter','Latex');
    end
    
    if ii==3
        title('$N_0=1, \kappa=0.90$','Interpreter','Latex');
    end
    
    if ii==4
        title('$N_0=1, \kappa=0.60$','Interpreter','Latex');
        xticks([0 504 1008 1512 2016]);
        xticklabels({'0' '2 year' '4 year' '6 year' '8 year'});
    end  
end

subplot('position',[1.3 0.8-(ii-1)*0.08 0.255 0.05]);
plot(P{1,1},'color',[0, 0.4470, 0.7410],'linewidth',LW);hold on;grid on
plot(P{2,1},'color',[0.8500, 0.3250, 0.0980],'linewidth',LW);hold on;grid on
legend('$\theta=0$','$\theta=1$','Interpreter','Latex','Position',[0.82 0.84 0.001 0.001],'NumColumns',2);
legend boxoff



pos1 =   [0.1 0.315 0.22 0.22*0.8];
subplot('position',pos1);
MS=5;
errorbar(KM_N0_theta_mean{1},SizeBubble_theta_T25000{1},std_SizeBubble_theta_T25000{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_theta_mean{2},SizeBubble_theta_T25000{2},std_SizeBubble_theta_T25000{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{1},SizeBubble_kappa_T25000{1},std_SizeBubble_kappa_T25000{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{2},SizeBubble_kappa_T25000{2},std_SizeBubble_kappa_T25000{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{3},SizeBubble_kappa_T25000{3},std_SizeBubble_kappa_T25000{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{4},SizeBubble_kappa_T25000{4},std_SizeBubble_kappa_T25000{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{5},SizeBubble_kappa_T25000{5},std_SizeBubble_kappa_T25000{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{6},SizeBubble_kappa_T25000{6},std_SizeBubble_kappa_T25000{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
ylabel('Bubble Size');
xlabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')
ylim([0 1.6])
yticks([0 0.4 0.8 1.2 1.6])
yticklabels({'0' '0.4' '0.8' '1.2' '1.6'});
legend('$N_0=1, \kappa=0.98, \theta$','$N_0=5, \kappa=0.98, \theta$',...
       '$N_0=1, \theta=0, \kappa$','$N_0=5, \theta=0, \kappa$',...
       '$N_0=1, \theta=0.5, \kappa$','$N_0=5, \theta=0.5, \kappa$',...
       '$N_0=1, \theta=1, \kappa$','$N_0=5, \theta=1, \kappa$',...
       'Interpreter','Latex','location',[0.345 0.22 0.04 0.04],'NumColumns',4,'FontSize',10);

text(0.37, 1.72,'(d)','Fontsize',FS);
set(gca, 'Fontname', 'Times New Roman','FontSize',FS);

subplot('position',[0.4 0.315 0.22 0.22*0.8])
errorbar(omegaM_N0_theta_mean{1},bubble_steepness_theta_T25000{1},std_bubble_steepness_theta_T25000{1},'-o','color',colorcode(1,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_theta_mean{2},bubble_steepness_theta_T25000{2},std_bubble_steepness_theta_T25000{2},'-d','color',colorcode(2,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean{1},bubble_steepness_kappa_T25000{1},std_bubble_steepness_kappa_T25000{1},'-p','color',colorcode(3,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean{2},bubble_steepness_kappa_T25000{2},std_bubble_steepness_kappa_T25000{2},'-^','color',colorcode(4,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean{3},bubble_steepness_kappa_T25000{3},std_bubble_steepness_kappa_T25000{3},'-*','color',colorcode(5,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean{4},bubble_steepness_kappa_T25000{4},std_bubble_steepness_kappa_T25000{4},'-h','color',colorcode(6,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean{5},bubble_steepness_kappa_T25000{5},std_bubble_steepness_kappa_T25000{5},'-+','color',colorcode(7,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean{6},bubble_steepness_kappa_T25000{6},std_bubble_steepness_kappa_T25000{6},'-x','color',colorcode(8,:),'linewidth',1,'Markersize',MS); grid on; hold on
xlabel('$\omega{(\mathbf{M})}$','Interpreter','Latex')
ylim([0 1.6])
yticks([0 0.4 0.8 1.2 1.6])
yticklabels({'0' '0.4' '0.8' '1.2' '1.6'});
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
ylabel('Bubble Steepness');
text(-0.035, 1.72,'(e)','Fontsize',FS);
set(gca, 'Fontname', 'Times New Roman','FontSize',FS);

subplot('position',[0.7 0.315 0.22 0.22*0.8]);
errorbar(connectedNodeall/N,mean_SizeBubble_control{1},std_SizeBubble_control{1},'-o','linewidth',1,'MarkerSize',MS);grid on; hold on
errorbar(connectedNodeall/N,mean_SizeBubble_control{2},std_SizeBubble_control{2},'-d','linewidth',1,'MarkerSize',MS);grid on; hold on
xlabel('$f$','interpreter','latex');
ylabel('Bubble Size');
legend('$\Delta{t}=50$','$\Delta{t}=100$','interpreter','latex','location',[0.79 0.22 0.04 0.04],'FontSize',TextSize,'fontname','Times New Roman');
ylim([0.8 1.6])
xticks([0 0.2 0.4 0.6 0.8 1.0])
xticklabels({'0' '0.2' '0.4' '0.6' '0.8' '1.0'});
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
text(-0.23, 1.67,'(f)','Fontsize',FS);
set(gca, 'Fontname', 'Times New Roman','FontSize',FS);


set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);
set(gcf, 'PaperSize', [25 25]); 
saveas(gcf,'figure3.pdf');
