load ('data_figure2_example_networks_level_independent.mat')
figure;
FS=10;
MS=4;

AS=4;


LW=0.21;
rate_LW=0.8;

subplot('position',[0.05 0.2 LW LW*rate_LW]);
G=digraph(el1(:,1),el1(:,2));

plot(G,'Layout','layered','NodeCData',S1,'EdgeColor',[0 0 0],'NodeLabel',{},'MarkerSize',MS,'LineWidth',LW,'ArrowSize',AS,'NodeColor',nodecolor_pink((S1-1)*18+1,:));
title('(a) $N_0=1, \theta=0$','Interpreter','Latex','position',[12.3 6.5 2],'Fontsize',FS)
axis off ; 
set(gca,'FontSize',FS);


subplot('position',[0.05+LW 0.2 LW LW*rate_LW]);
G=digraph(el2(:,1),el2(:,2));
plot(G,'Layout','layered','NodeCData',S2,'EdgeColor',[0 0 0],'NodeLabel',{},'MarkerSize',MS,'LineWidth',LW,'ArrowSize',AS,'NodeColor',nodecolor_pink((S2-1)*18+1,:));
title('(b) $N_0=2, \theta=0.5$','Interpreter','Latex','position',[15.8 5.4 2],'Fontsize',FS)
colormap('pink');
c=colorbar('Ticks',linspace(0,1,8),'TickLabels',["1" "3" "5" "7" "9" "11" "13" "15"]);

c.Location = 'south';
c.Position= [0.085 0.187 0.57 0.01];
set(gca,'FontSize',FS);
axis off ; 



subplot('position',[0.05+2*LW 0.2 LW LW*rate_LW]);
G=digraph(el3(:,1),el3(:,2));
plot(G,'Layout','layered','NodeCData',S3,'EdgeColor',[0 0 0],'NodeLabel',{},'MarkerSize',MS,'LineWidth',LW,'ArrowSize',AS,'NodeColor',nodecolor_pink(1,:));
title('(c) $N_0=3, \theta=1$','Interpreter','Latex','position',[13.3 5.4 2],'Fontsize',FS)
axis off ; 
set(gca,'FontSize',FS);
text(-22.7,-1.07,'trophic level $\ell$','Interpreter','Latex','Fontsize',FS);    




subplot('position',[0.05+LW*3+0.06 0.1905 LW LW*rate_LW]);
f1 = errorbar(xdata,ydata,std_sample,'-o','MarkerSize',MS*1.3,'linewidth',1);grid on;hold on
xx = 1:100:5000;
f3 = plot(x,y,'-','linewidth',1);

legend([f3],'fit','interpreter','latex','location','southeast','Fontsize',FS)
legend boxoff  
set(gca, 'XScale', 'log')
xlabel('trophic level $\ell$','interpreter','latex','Fontsize',FS)
ylabel('rate of reciprocity','interpreter','latex','Fontsize',FS)
xlim([1 7000]);
ylim([0 0.35]);
set(gca,'FontSize',FS)
title('(d) level-dependent reciprocity','interpreter','latex','Fontsize',FS)
set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.73 0.22 26.5 26]);
set(gcf, 'PaperSize', [25 25]); 
xticks([1 10 100 1000 ]);
xticklabels({'10^{0}' '10^{1}' '10^{2}' '10^{3}'});
yticks([0 0.1 0.2 0.3]);
yticklabels({'0' '0.1' '0.2' '0.3'});
set(gca,'fontname','Times New Roman')

set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);
set(gcf, 'PaperSize', [25 25]); 
saveas(gcf,'figure2.pdf');