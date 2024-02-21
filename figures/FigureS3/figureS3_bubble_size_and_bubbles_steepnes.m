

load data_figureS3_bubble_size_and_bubbles_steepness.mat

colorcode=[0,0.4470,0.7410;0.8500,0.3250,0.0980;0.9290,0.6940,0.1250;0.4940,0.1840,0.5560;0.4660,0.6740,0.1880;0.3010,0.7450, 0.9330;0.6350 0.0780,0.1840;0.7176,0.2745,1.0000];

pos1 =   [0.65 0.7 0.2 0.16];
figure;
FS=10;
TextSize=10;
legnedpos = [0.28 0.54 0.02 0.02];
MS = 4;
LW = 1;


subplot('position',[0.15 0.7 0.2 0.16]);

errorbar(thetaall,SizeBubble_theta_T25000{1},std_SizeBubble_theta_T25000{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(thetaall,SizeBubble_theta_T25000{2},std_SizeBubble_theta_T25000{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
xlabel('$\theta$','Interpreter','Latex')
ylabel('Bubble Size');
xlim([0 1]);
ylim([0 1.5]);
set(gca,'FontSize',TextSize,'fontname','Times New Roman');

subplot('position',[0.4 0.7 0.2 0.16]);
errorbar(kappaall,SizeBubble_kappa_T25000{1},std_SizeBubble_kappa_T25000{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(kappaall,SizeBubble_kappa_T25000{2},std_SizeBubble_kappa_T25000{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(kappaall,SizeBubble_kappa_T25000{3},std_SizeBubble_kappa_T25000{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(kappaall,SizeBubble_kappa_T25000{4},std_SizeBubble_kappa_T25000{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(kappaall,SizeBubble_kappa_T25000{5},std_SizeBubble_kappa_T25000{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(kappaall,SizeBubble_kappa_T25000{6},std_SizeBubble_kappa_T25000{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on


xlim([0.6 1]);
xlabel('\kappa')
xticks([0.6 0.7 0.8 0.9 1])
xticklabels({'0.6' '0.7' '0.8' '0.9' '1'})
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
ylim([0 1.5]);

subplot('position',pos1);

errorbar(KM_N0_theta_mean{1},SizeBubble_theta_T25000{1},std_SizeBubble_theta_T25000{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_theta_mean{2},SizeBubble_theta_T25000{2},std_SizeBubble_theta_T25000{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on

errorbar(KM_N0_kappa_mean{1},SizeBubble_kappa_T25000{1},std_SizeBubble_kappa_T25000{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{2},SizeBubble_kappa_T25000{2},std_SizeBubble_kappa_T25000{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{3},SizeBubble_kappa_T25000{3},std_SizeBubble_kappa_T25000{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{4},SizeBubble_kappa_T25000{4},std_SizeBubble_kappa_T25000{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{5},SizeBubble_kappa_T25000{5},std_SizeBubble_kappa_T25000{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean{6},SizeBubble_kappa_T25000{6},std_SizeBubble_kappa_T25000{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
       legend('$N_0=1, \kappa=0.98, \theta$','$N_0=5, \kappa=0.98, \theta$',...
       '$N_0=1, \theta=0, \kappa$','$N_0=5, \theta=0, \kappa$',...
       '$N_0=1, \theta=0.5, \kappa$','$N_0=5, \theta=0.5, \kappa$',...
       '$N_0=1, \theta=1, \kappa$','$N_0=5, \theta=1, \kappa$',...
       'Interpreter','Latex','location',[0.48 0.385 0.04 0.04],'NumColumns',4,'FontSize',10);

set(gca,'FontSize',TextSize,'fontname','Times New Roman');
xlim([1,4])
ylim([0 1.5]);
xlabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')
set(gca, 'Fontname', 'Times New Roman','FontSize',FS);


subplot('position',[0.15 0.48 0.2 0.16]);
errorbar(thetaall,bubble_steepness_theta_T25000{1},std_bubble_steepness_theta_T25000{1},'-o','color',colorcode(1,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(thetaall,bubble_steepness_theta_T25000{2},std_bubble_steepness_theta_T25000{2},'-d','color',colorcode(2,:),'linewidth',1,'Markersize',MS); grid on; hold on
%set(gca, 'Xscale','log')
xlabel('$\theta$','Interpreter','Latex')
ylabel('Bubble Steepness');
%xlim([0.00000001 1]);
%xticks([0.00000001 0.000001 0.0001 0.01  1])
%xticklabels({'10^{-8}'  '10^{-6}'  '10^{-4}'  '10^{-2}'  '10^{0}'})
%ylabel('Bubble Steepness');
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
ylim([0 1.6]);
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'0' '0.4' '0.8' '1.2' '1.6'});
subplot('position',[0.4 0.48 0.2 0.16])

errorbar(kappaall,bubble_steepness_kappa_T25000{1},std_bubble_steepness_kappa_T25000{1},'-p','color',colorcode(3,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(kappaall,bubble_steepness_kappa_T25000{2},std_bubble_steepness_kappa_T25000{2},'-^','color',colorcode(4,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(kappaall,bubble_steepness_kappa_T25000{3},std_bubble_steepness_kappa_T25000{3},'-*','color',colorcode(5,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(kappaall,bubble_steepness_kappa_T25000{4},std_bubble_steepness_kappa_T25000{4},'-h','color',colorcode(6,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(kappaall,bubble_steepness_kappa_T25000{5},std_bubble_steepness_kappa_T25000{5},'-+','color',colorcode(7,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(kappaall,bubble_steepness_kappa_T25000{6},std_bubble_steepness_kappa_T25000{6},'-x','color',colorcode(8,:),'linewidth',1,'Markersize',MS); grid on; hold on
xlim([0.6 1]);
xlabel('\kappa')
xticks([0.6 0.7 0.8 0.9 1])
xticklabels({'0.6' '0.7' '0.8' '0.9' '1'})
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
ylim([0 1.6]);
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'0' '0.4' '0.8' '1.2' '1.6'});

subplot('position',[0.65 0.48 0.2 0.16])
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
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'0' '0.4' '0.8' '1.2' '1.6'});

set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);
set(gcf, 'PaperSize', [25 25]); 
saveas(gcf,'figureS3.pdf');