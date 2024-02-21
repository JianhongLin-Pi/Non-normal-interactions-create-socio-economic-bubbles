load 'data_figureS2_evolution_of_price.mat'

figure;
LW=1;
pos1=[0.1 0.2 0.255*1.5 0.05*1.5];
FS=10;
subplot('position',pos1);

f1 = plot(P{1},'LineWidth',LW); hold on; 
f2 = plot(x1+t1,fity3,'LineWidth',LW*1.1);grid on;
title('$\kappa=0.98$','Interpreter','Latex')
txt3 =   strcat('P_t={',num2str(P{1}(t1),'%4.3f'),'}e^{{',num2str((cfunP.a11),'%4.3f'),'}*{',num2str(x{1}(t11),'%4.3f'),'}({',num2str((cfunx.a1),'%4.3f'),'}^{t-t_{1}}-1)}');
legend('P_t',txt3, 'FontSize',7,'Location','northeast','FontName','Arial')
legend boxoff
ylim([0.5 5.5])
xlim([0 2016])
xticks([0 504 1008 1512 2016]);
xticklabels({'0' '2 year' '4 year' '6 year' '8 year'});
ylabel('P_t')
pos2=[0.53 0.2 0.255*1.5 0.05*1.5];
legend([f2],'fit','interpreter','latex','location','northeast','Fontsize',FS)
legend boxoff 
yticks([1 3 5]);
yticklabels({'1' '3' '5'});

subplot('position',pos2);
plot(P{2},'LineWidth',LW); hold on; 
plot(xx1+tt1,fityy3,'LineWidth',LW*1.1,'Color',[0.8500, 0.3250, 0.0980]);grid on;
title('$\kappa=0.90$','Interpreter','Latex')
txt3 =   strcat('P_t={',num2str(P{2}(tt1),'%4.3f'),'}e^{{',num2str((cfunPP.a11),'%4.3f'),'}*{',num2str(x{2}(tt11),'%4.3f'),'}({',num2str((cfunxx.a1),'%4.3f'),'}^{t-t_{1}}-1)}');
ylim([0.5 3])
xlim([0 2016])
xticks([0 504 1008 1512 2016]);
xticklabels({'0' '2 year' '4 year' '6 year' '8 year'});


yticks([1 2 3]);
yticklabels({'1' '2' '3'});
set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);
set(gcf, 'PaperSize', [25 25]); 
saveas(gcf,'figureS2.pdf');
