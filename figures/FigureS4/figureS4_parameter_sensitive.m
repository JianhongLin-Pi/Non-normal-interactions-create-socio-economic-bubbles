
load data_figureS4_parameter_sensitive.mat

colorcode=[0,0.4470,0.7410;0.8500,0.3250,0.0980;0.9290,0.6940,0.1250;0.4940,0.1840,0.5560;0.4660,0.6740,0.1880;0.3010,0.7450, 0.9330;0.6350 0.0780,0.1840;0.7176,0.2745,1.0000];

pos1 =   [0.08 0.7 0.2 0.16];
pos2 =   [0.08 0.48 0.2 0.16];

pos3 =   [0.3 0.7 0.2 0.16];
pos4 =   [0.3 0.48 0.2 0.16];

pos5 =   [0.52 0.7 0.2 0.16];
pos6 =   [0.52 0.48 0.2 0.16];

pos7 =   [0.74 0.7 0.2 0.16];
pos8 =   [0.74 0.48 0.2 0.16];

figure;

FS=11;
TextSize=11;
legnedpos = [0.28 0.54 0.02 0.02];
MS = 4;
LW = 1;

subplot('position',pos1);
errorbar(KM_N0_theta_mean_N500_m2{1},SizeBubble_theta_T25000_N500_m2{1},std_SizeBubble_theta_T25000_N500_m2{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_theta_mean_N500_m2{2},SizeBubble_theta_T25000_N500_m2{2},std_SizeBubble_theta_T25000_N500_m2{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N500_m2{1},SizeBubble_kappa_T25000_N500_m2{1},std_SizeBubble_kappa_T25000_N500_m2{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N500_m2{2},SizeBubble_kappa_T25000_N500_m2{2},std_SizeBubble_kappa_T25000_N500_m2{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N500_m2{3},SizeBubble_kappa_T25000_N500_m2{3},std_SizeBubble_kappa_T25000_N500_m2{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N500_m2{4},SizeBubble_kappa_T25000_N500_m2{4},std_SizeBubble_kappa_T25000_N500_m2{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N500_m2{5},SizeBubble_kappa_T25000_N500_m2{5},std_SizeBubble_kappa_T25000_N500_m2{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N500_m2{6},SizeBubble_kappa_T25000_N500_m2{6},std_SizeBubble_kappa_T25000_N500_m2{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
xlabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')
title('$N=500, m=2, p^{\pm}=0.05$','Interpreter','Latex')
ylabel('Bubble Size');
ylim([0 1.6]);
xlim([1  3]);
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'0' '0.4' '0.8' '1.2' '1.6'});

subplot('position',pos2)
errorbar(omegaM_N0_theta_mean_N500_m2{1},bubble_steepness_theta_T25000_N500_m2{1},std_bubble_steepness_theta_T25000_N500_m2{1},'-o','color',colorcode(1,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_theta_mean_N500_m2{2},bubble_steepness_theta_T25000_N500_m2{2},std_bubble_steepness_theta_T25000_N500_m2{2},'-d','color',colorcode(2,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N500_m2{1},bubble_steepness_kappa_T25000_N500_m2{1},std_SizeBubble_kappa_T25000_N500_m2{1},'-p','color',colorcode(3,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N500_m2{2},bubble_steepness_kappa_T25000_N500_m2{2},std_SizeBubble_kappa_T25000_N500_m2{2},'-^','color',colorcode(4,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N500_m2{3},bubble_steepness_kappa_T25000_N500_m2{3},std_SizeBubble_kappa_T25000_N500_m2{3},'-*','color',colorcode(5,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N500_m2{4},bubble_steepness_kappa_T25000_N500_m2{4},std_SizeBubble_kappa_T25000_N500_m2{4},'-h','color',colorcode(6,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N500_m2{5},bubble_steepness_kappa_T25000_N500_m2{5},std_SizeBubble_kappa_T25000_N500_m2{5},'-+','color',colorcode(7,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N500_m2{6},bubble_steepness_kappa_T25000_N500_m2{6},std_SizeBubble_kappa_T25000_N500_m2{6},'-x','color',colorcode(8,:),'linewidth',1,'Markersize',MS); grid on; hold on
xlabel('$\omega{(\mathbf{M})}$','Interpreter','Latex')
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
ylabel('Bubble Steepness');
ylim([0 1.6]);
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
xlim([0 0.12]);
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'0' '0.4' '0.8' '1.2' '1.6'});
xticks([0 0.03 0.06 0.09 0.12]);
xticklabels({'0' '0.03' '0.06' '0.09' '0.12'});

legend('$N_0=1, \kappa=0.98, \theta$','$N_0=5, \kappa=0.98, \theta$',...
       '$N_0=1, \theta=0, \kappa$','$N_0=5, \theta=0, \kappa$',...
       '$N_0=1, \theta=0.5, \kappa$','$N_0=5, \theta=0.5, \kappa$',...
       '$N_0=1, \theta=1, \kappa$','$N_0=5, \theta=1, \kappa$',...
       'Interpreter','Latex','location',[0.49 0.38 0.04 0.04],'NumColumns',4,'FontSize',10);

   
subplot('position',pos3);
errorbar(KM_N0_theta_mean_N1500_m2{1},SizeBubble_theta_T25000_N1500_m2{1},std_SizeBubble_theta_T25000_N1500_m2{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_theta_mean_N1500_m2{2},SizeBubble_theta_T25000_N1500_m2{2},std_SizeBubble_theta_T25000_N1500_m2{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1500_m2{1},SizeBubble_kappa_T25000_N1500_m2{1},std_SizeBubble_kappa_T25000_N1500_m2{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1500_m2{2},SizeBubble_kappa_T25000_N1500_m2{2},std_SizeBubble_kappa_T25000_N1500_m2{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1500_m2{3},SizeBubble_kappa_T25000_N1500_m2{3},std_SizeBubble_kappa_T25000_N1500_m2{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1500_m2{4},SizeBubble_kappa_T25000_N1500_m2{4},std_SizeBubble_kappa_T25000_N1500_m2{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1500_m2{5},SizeBubble_kappa_T25000_N1500_m2{5},std_SizeBubble_kappa_T25000_N1500_m2{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1500_m2{6},SizeBubble_kappa_T25000_N1500_m2{6},std_SizeBubble_kappa_T25000_N1500_m2{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
xlabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')
title('$N=1500, m=2, p^{\pm}=0.05$','Interpreter','Latex')
ylim([0.2 1.2]);
%xlim([0.75 2.75]);
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
set(gca,'yticklabel',[]);
xlim([1 5]);
ylim([0 1.6]);
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'' '' '' '' ''});


subplot('position',pos4)
errorbar(omegaM_theta_N1500_m2{1},bubble_steepness_theta_T25000_N1500_m2{1},std_bubble_steepness_theta_T25000_N1500_m2{1},'-o','color',colorcode(1,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_theta_N1500_m2{2},bubble_steepness_theta_T25000_N1500_m2{2},std_bubble_steepness_theta_T25000_N1500_m2{2},'-d','color',colorcode(2,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1500_m2{1},bubble_steepness_kappa_T25000_N1500_m2{1},std_SizeBubble_kappa_T25000_N1500_m2{1},'-p','color',colorcode(3,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1500_m2{2},bubble_steepness_kappa_T25000_N1500_m2{2},std_SizeBubble_kappa_T25000_N1500_m2{2},'-^','color',colorcode(4,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1500_m2{3},bubble_steepness_kappa_T25000_N1500_m2{3},std_SizeBubble_kappa_T25000_N1500_m2{3},'-*','color',colorcode(5,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1500_m2{4},bubble_steepness_kappa_T25000_N1500_m2{4},std_SizeBubble_kappa_T25000_N1500_m2{4},'-h','color',colorcode(6,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1500_m2{5},bubble_steepness_kappa_T25000_N1500_m2{5},std_SizeBubble_kappa_T25000_N1500_m2{5},'-+','color',colorcode(7,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1500_m2{6},bubble_steepness_kappa_T25000_N1500_m2{6},std_SizeBubble_kappa_T25000_N1500_m2{6},'-x','color',colorcode(8,:),'linewidth',1,'Markersize',MS); grid on; hold on
xlabel('$\omega{(\mathbf{M})}$','Interpreter','Latex')
set(gca,'FontSize',TextSize,'fontname','Times New Roman');

set(gca,'FontSize',TextSize,'fontname','Times New Roman');
%xlim([0 0.08]);
set(gca,'yticklabel',[]);

xlim([0 0.16]);
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'' '' '' '' ''});
xlim([0 0.16]);
xticks([0 0.04 0.08 0.12 0.16]);
xticklabels({'0' '0.04' '0.08' '0.12' '0.16'});

subplot('position',pos5);
errorbar(KM_N0_theta_mean_N1000_m4{1},SizeBubble_theta_T25000_N1000_m4{1},std_SizeBubble_theta_T25000_N1000_m4{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_theta_mean_N1000_m4{2},SizeBubble_theta_T25000_N1000_m4{2},std_SizeBubble_theta_T25000_N1000_m4{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m4{1},SizeBubble_kappa_T25000_N1000_m4{1},std_SizeBubble_kappa_T25000_N1000_m4{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m4{2},SizeBubble_kappa_T25000_N1000_m4{2},std_SizeBubble_kappa_T25000_N1000_m4{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m4{3},SizeBubble_kappa_T25000_N1000_m4{3},std_SizeBubble_kappa_T25000_N1000_m4{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m4{4},SizeBubble_kappa_T25000_N1000_m4{4},std_SizeBubble_kappa_T25000_N1000_m4{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m4{5},SizeBubble_kappa_T25000_N1000_m4{5},std_SizeBubble_kappa_T25000_N1000_m4{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m4{6},SizeBubble_kappa_T25000_N1000_m4{6},std_SizeBubble_kappa_T25000_N1000_m4{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
xlabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')

set(gca,'FontSize',TextSize,'fontname','Times New Roman');
xlim([1 4]);
title('$N=1000, m=4, p^{\pm}=0.05$','Interpreter','Latex')
set(gca,'yticklabel',[]);
ylim([0 1.6]);
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'' '' '' '' ''});


subplot('position',pos6)
errorbar(omegaM_theta_N1000_m4{1},bubble_steepness_theta_T25000_N1000_m4{1},std_bubble_steepness_theta_T25000_N1000_m4{1},'-o','color',colorcode(1,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_theta_N1000_m4{2},bubble_steepness_theta_T25000_N1000_m4{2},std_bubble_steepness_theta_T25000_N1000_m4{2},'-d','color',colorcode(2,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1000_m4{1},bubble_steepness_kappa_T25000_N1000_m4{1},std_SizeBubble_kappa_T25000_N1000_m4{1},'-p','color',colorcode(3,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1000_m4{2},bubble_steepness_kappa_T25000_N1000_m4{2},std_SizeBubble_kappa_T25000_N1000_m4{2},'-^','color',colorcode(4,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1000_m4{3},bubble_steepness_kappa_T25000_N1000_m4{3},std_SizeBubble_kappa_T25000_N1000_m4{3},'-*','color',colorcode(5,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1000_m4{4},bubble_steepness_kappa_T25000_N1000_m4{4},std_SizeBubble_kappa_T25000_N1000_m4{4},'-h','color',colorcode(6,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1000_m4{5},bubble_steepness_kappa_T25000_N1000_m4{5},std_SizeBubble_kappa_T25000_N1000_m4{5},'-+','color',colorcode(7,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_kappa_N1000_m4{6},bubble_steepness_kappa_T25000_N1000_m4{6},std_SizeBubble_kappa_T25000_N1000_m4{6},'-x','color',colorcode(8,:),'linewidth',1,'Markersize',MS); grid on; hold on
xlabel('$\omega{(\mathbf{M})}$','Interpreter','Latex')
%ylim([0.2 1.4])
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
ylim([0 1.6]);
xlim([0 0.12]);
set(gca,'yticklabel',[]);
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'' '' '' '' ''});
xticks([0 0.03 0.06 0.09 0.12]);
xticklabels({'0' '0.03' '0.06' '0.09' '0.12'});


subplot('position',pos7);
errorbar(KM_N0_theta_mean_N1000_m2_ppm008{1},SizeBubble_theta_T25000_N1000_m2_ppm008{1},std_SizeBubble_theta_T25000_N1000_m2_ppm008{1},'-o','color',colorcode(1,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_theta_mean_N1000_m2_ppm008{2},SizeBubble_theta_T25000_N1000_m2_ppm008{2},std_SizeBubble_theta_T25000_N1000_m2_ppm008{2},'-d','color',colorcode(2,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m2_ppm008{1},SizeBubble_kappa_T25000_N1000_m2_ppm008{1},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{1},'-p','color',colorcode(3,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m2_ppm008{2},SizeBubble_kappa_T25000_N1000_m2_ppm008{2},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{2},'-^','color',colorcode(4,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m2_ppm008{3},SizeBubble_kappa_T25000_N1000_m2_ppm008{3},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{3},'-*','color',colorcode(5,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m2_ppm008{4},SizeBubble_kappa_T25000_N1000_m2_ppm008{4},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{4},'-h','color',colorcode(6,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m2_ppm008{5},SizeBubble_kappa_T25000_N1000_m2_ppm008{5},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{5},'-+','color',colorcode(7,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
errorbar(KM_N0_kappa_mean_N1000_m2_ppm008{6},SizeBubble_kappa_T25000_N1000_m2_ppm008{6},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{6},'-x','color',colorcode(8,:),'MarkerSize',MS,'LineWidth',LW);hold on;grid on
xlabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex')
title('$N=1000, m=2, p^{\pm}=0.08$','Interpreter','Latex')

xlim([1 4]);
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
set(gca,'yticklabel',[]);
ylim([0 1.6]);
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'' '' '' '' ''});


subplot('position',pos8)
errorbar(omegaM_N0_theta_mean_N1000_m2_ppm008{1},bubble_steepness_theta_T25000_N1000_m2_ppm008{1},std_bubble_steepness_theta_T25000_N1000_m2_ppm008{1},'-o','color',colorcode(1,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_theta_mean_N1000_m2_ppm008{2},bubble_steepness_theta_T25000_N1000_m2_ppm008{2},std_bubble_steepness_theta_T25000_N1000_m2_ppm008{2},'-d','color',colorcode(2,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean_N1000_m2_ppm008{1},bubble_steepness_kappa_T25000_N1000_m2_ppm008{1},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{1},'-p','color',colorcode(3,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean_N1000_m2_ppm008{2},bubble_steepness_kappa_T25000_N1000_m2_ppm008{2},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{2},'-^','color',colorcode(4,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean_N1000_m2_ppm008{3},bubble_steepness_kappa_T25000_N1000_m2_ppm008{3},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{3},'-*','color',colorcode(5,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean_N1000_m2_ppm008{4},bubble_steepness_kappa_T25000_N1000_m2_ppm008{4},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{4},'-h','color',colorcode(6,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean_N1000_m2_ppm008{5},bubble_steepness_kappa_T25000_N1000_m2_ppm008{5},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{5},'-+','color',colorcode(7,:),'linewidth',1,'Markersize',MS); grid on; hold on
errorbar(omegaM_N0_kappa_mean_N1000_m2_ppm008{6},bubble_steepness_kappa_T25000_N1000_m2_ppm008{6},std_SizeBubble_kappa_T25000_N1000_m2_ppm008{6},'-x','color',colorcode(8,:),'linewidth',1,'Markersize',MS); grid on; hold on
xlabel('$\omega{(\mathbf{M})}$','Interpreter','Latex')
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
ylim([0 1.6]);
set(gca,'FontSize',TextSize,'fontname','Times New Roman');
xlim([0 0.25]);
set(gca,'yticklabel',[]);
xticks([0 0.05 0.1 0.15 0.2 0.25]);
xticklabels({'0' '0.05' '0.1' '0.15' '0.2' '0.25'});
yticks([0 0.4 0.8 1.2 1.6]);
yticklabels({'' '' '' '' ''});



set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);
set(gcf, 'PaperSize', [25 25]); 
saveas(gcf,'figureS4.pdf');