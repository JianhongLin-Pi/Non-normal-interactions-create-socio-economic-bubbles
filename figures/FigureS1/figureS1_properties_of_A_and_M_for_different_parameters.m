
load  data_figureS1_properties_of_A_and_M_for_different_parameters.mat

colorcode=[0,0.4470,0.7410;0.8500,0.3250,0.0980;0.9290,0.6940,0.1250;0.4940,0.1840,0.5560;0.4660,0.6740,0.1880;0.3010,0.7450, 0.9330;0.6350 0.0780,0.1840;0.7176,0.2745,1.0000];
figure;
MS=5;
LD=1;
TextSize=10;

subplot('position',[0.14 0.7 0.2 0.16]);
errorbar(thetaall,alphaA_mean{1},std_alphaA{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(thetaall,alphaA_mean{2},std_alphaA{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LD); hold on;
xlim([0 1]);
ylabel('$\alpha(\mathbf{A})$','Interpreter','Latex')
set(gca,'FontSize',TextSize,'fontname','Times New Roman');

subplot('position',[0.14 0.49 0.2 0.16]);
errorbar(thetaall,dFA_mean{1},std_dFA{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(thetaall,dFA_mean{2},std_dFA{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LD); hold on;
ylabel('$d_F(\mathbf{A})$','Interpreter','Latex')
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
xlim([0 1])
xlabel('$\theta$','Interpreter','Latex')

subplot('position',[0.4 0.7 0.2 0.16]);
errorbar(thetaall,alphaM_mean{1},std_alphaM{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LD); hold on; grid on
errorbar(thetaall,alphaM_mean{2},std_alphaM{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LD); hold on;
ylabel('$\alpha(\mathbf{M})$','Interpreter','Latex')
ylim([-0.05 0])
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
xlim([0 1])

subplot('position',[0.4 0.49 0.2 0.16]);
errorbar(thetaall,dFM_mean{1},std_alphaM{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(thetaall,dFM_mean{2},std_alphaM{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LD); hold on;
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
ylabel('$d_F(\mathbf{M})$','Interpreter','Latex')
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
xlim([0 1])
ylim([0.2 0.6]); 

subplot('position',[0.4 0.28 0.2 0.16]);
errorbar(thetaall,KM_N0_theta_mean{1},std_KM_N0_theta{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(thetaall,KM_N0_theta_mean{2},std_KM_N0_theta{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LD); hold on;
ylabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
ylim([0.5 4.5])
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
xlim([0 1])
xlabel('$\theta$','Interpreter','Latex')
    
subplot('position',[0.66 0.7 0.2 0.16]);
errorbar(kappaall,alphaM_kappa_mean{1},std_alphaM_kappa{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LD); hold on; grid on
errorbar(kappaall,alphaM_kappa_mean{2},std_alphaM_kappa{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,alphaM_kappa_mean{3},std_alphaM_kappa{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,alphaM_kappa_mean{4},std_alphaM_kappa{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,alphaM_kappa_mean{5},std_alphaM_kappa{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,alphaM_kappa_mean{6},std_alphaM_kappa{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LD); hold on;
ylabel('$\alpha(\mathbf{M})$','Interpreter','Latex')
xticks([0.6 0.7 0.8 0.9 1])
              
xticklabels({'0.6' '0.7' '0.8' '0.9' '1'})
ylim([-0.05 0])
xlim([0.6 1])
set(gca,'FontSize',TextSize,'fontname','Times New Roman');

subplot('position',[0.66 0.49 0.2 0.16]);
errorbar(kappaall,dFMN0_kappa_mean{1},std_dFMN0_kappa{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(kappaall,dFMN0_kappa_mean{2},std_dFMN0_kappa{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,dFMN0_kappa_mean{3},std_dFMN0_kappa{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,dFMN0_kappa_mean{4},std_dFMN0_kappa{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,dFMN0_kappa_mean{5},std_dFMN0_kappa{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,dFMN0_kappa_mean{6},std_dFMN0_kappa{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LD); hold on;
ylabel('$d_F(\mathbf{M})$','Interpreter','Latex')
xticks([0.6 0.7 0.8 0.9 1])
ylim([0.2 0.6]);              
xticklabels({'0.6' '0.7' '0.8' '0.9' '1'})
xlim([0.6 1])
set(gca,'FontSize',TextSize,'fontname','Times New Roman');

subplot('position',[0.66 0.28 0.2 0.16]);
errorbar(kappaall,KM_N0_kappa_mean{1},std_KM_N0_kappa{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(kappaall,KM_N0_kappa_mean{2},std_KM_N0_kappa{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,KM_N0_kappa_mean{3},std_KM_N0_kappa{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,KM_N0_kappa_mean{4},std_KM_N0_kappa{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,KM_N0_kappa_mean{5},std_KM_N0_kappa{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LD); hold on;
errorbar(kappaall,KM_N0_kappa_mean{6},std_KM_N0_kappa{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LD); hold on;
ylabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')
xticks([0.6 0.7 0.8 0.9 1])
xticklabels({'0.6' '0.7' '0.8' '0.9' '1'})
set(gca, 'XScale', 'log')  
xlim([0.6 1])
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
xlabel('$\kappa$','Interpreter','Latex');
ylim([0.5 4.5])
axes('Position',[0.68 0.372 .085 0.085*0.8])
box on
mmm=2;

errorbar(dFM_mean{1},KM_N0_theta_mean{1},std_KM_N0_theta{1},'-o','MarkerSize',MS/mmm,'color',colorcode(1,:),'LineWidth',LD/mmm); hold on;grid on
errorbar(dFM_mean{2},KM_N0_theta_mean{2},std_KM_N0_theta{2},'-d','MarkerSize',MS/mmm,'color',colorcode(2,:),'LineWidth',LD/mmm); hold on;grid on
errorbar(dFMN0_kappa_mean{1},KM_N0_kappa_mean{1},std_KM_N0_kappa{1},'-p','color',colorcode(3,:),'MarkerSize',MS/2,'LineWidth',LD/mmm); hold on;grid on
errorbar(dFMN0_kappa_mean{2},KM_N0_kappa_mean{2},std_KM_N0_kappa{2},'-^','color',colorcode(4,:),'MarkerSize',MS/2,'LineWidth',LD/mmm); hold on;grid on
errorbar(dFMN0_kappa_mean{3},KM_N0_kappa_mean{3},std_KM_N0_kappa{3},'-*','color',colorcode(5,:),'MarkerSize',MS/mmm,'LineWidth',LD/mmm); hold on;grid on
errorbar(dFMN0_kappa_mean{4},KM_N0_kappa_mean{4},std_KM_N0_kappa{4},'-h','color',colorcode(6,:),'MarkerSize',MS/mmm,'LineWidth',LD/mmm); hold on;grid on
errorbar(dFMN0_kappa_mean{5},KM_N0_kappa_mean{5},std_KM_N0_kappa{5},'-+','color',colorcode(7,:),'MarkerSize',MS/mmm,'LineWidth',LD/mmm); hold on;grid on
errorbar(dFMN0_kappa_mean{6},KM_N0_kappa_mean{6},std_KM_N0_kappa{6},'-x','color',colorcode(8,:),'MarkerSize',MS/mmm,'LineWidth',LD/mmm); hold on;grid on
ylim([0.5 4.5])
xlabel('$d_F(\mathbf{M})$','Interpreter','Latex')
xticks([0.2 0.3 0.4 0.5 0.6])
xticklabels({'0.2' '0.3' '0.4' '0.5' '0.6'})
ylabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')
xlim([0.2 0.6])
set(gca,'FontSize',5.5,'fontname','Times New Roman');


subplot('position',[5 0.05 0.1 0.08]);
errorbar(thetaall,KM_N0_theta_mean{1},std_KM_N0_theta{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(thetaall,KM_N0_theta_mean{2},std_KM_N0_theta{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(kappaall,KM_N0_kappa_mean{1},std_KM_N0_kappa{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(kappaall,KM_N0_kappa_mean{2},std_KM_N0_kappa{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(kappaall,KM_N0_kappa_mean{3},std_KM_N0_kappa{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(kappaall,KM_N0_kappa_mean{4},std_KM_N0_kappa{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(kappaall,KM_N0_kappa_mean{5},std_KM_N0_kappa{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
errorbar(kappaall,KM_N0_kappa_mean{6},std_KM_N0_kappa{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LD); hold on;grid on
xlabel('$d_F(\mathbf{M})$','Interpreter','Latex')         
ylabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')
legend('$N_0=1,\kappa=0.98,\theta$','$N_0=5,\kappa=0.98,\theta$',...
       '$N_0=1,\theta=0,\kappa$','$N_0=5,\theta=0,\kappa$',...
       '$N_0=1,\theta=0.5,\kappa$','$N_0=5,\theta=0.5,\kappa$',...
       '$N_0=1,\theta=1,\kappa$','$N_0=5,\theta=1,\kappa$',...
       'Interpreter','Latex','location',[0.23 0.335 0.02 0.02],'NumColumns',1);
set(gca,'FontSize',10,'fontname','Times New Roman');


set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);
set(gcf, 'PaperSize', [25 25]); 
saveas(gcf,'figureS1.pdf');