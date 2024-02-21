load data_figureS8_Evolution_of_the_net_magnetization.mat
figure;

textSize = 10;
alpha_value = 0.25;
line_width = 0.8;

LW=0.8;

subplot('position',[0.2 0.4 0.5 0.12])
bluecolor = [0.4940, 0.1840, 0.5560];
yyaxis left
for ii = 1:10
    bluecolorii=bluecolor;
    bluecolorii(1) = bluecolorii(1)-ii*0.02;
    bluecolorii(2) = bluecolorii(2)-ii*0.01;
    plot(date{4},aver_P(:,ID_p(ii)),'-','color',bluecolorii,'linewidth',LW);hold on
end
ax = gca;
ax.YAxis(1).Color = bluecolor;

ylabel('simulated price')
xlim([date{4}(1) date{4}(end)])
yyaxis right
plot(date{4},mean_daily_price{4},'linewidth',LW);
ylim([0 25])
ylabel('real price')

axes('Position',[.487 .483 .18 .031])
box on
yyaxis left
for ii = 1:10
    bluecolorii=bluecolor;
    bluecolorii(1) = bluecolorii(1)-ii*0.02;
    bluecolorii(2) = bluecolorii(2)-ii*0.01;
    plot(date{4},aver_x(:,ID_x(ii))*2-1,'-','color',bluecolorii,'linewidth',LW);hold on
end

ylim([-0.05 0.05])
ylabel('m_t')
ax = gca;
ax.YAxis(1).Color = bluecolor;
xlim([date{4}(1) date{4}(end)])
ax = gca; 
ax.FontSize = 6; 

yyaxis right
plot(date{4},mean_daily_price{4},'linewidth',LW);
ylim([0 25])
ylabel('real price')


set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);
set(gcf, 'PaperSize', [25 25]); 
saveas(gcf,'FigureS8.pdf');