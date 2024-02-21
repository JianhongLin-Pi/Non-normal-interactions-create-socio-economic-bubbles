load data_figure4_evolution_of_real_and_simulated_meme_stock_prices.mat
dataName{4}='BlackBerry';

figure; 
textSize = 10;
alpha_value = 0.25;
line_width = 1;



subplot('position',[0.1 0.515 0.35 0.1]);
yyaxis left
color_value = [0.3010, 0.7450, 0.9330];
%[0, 0.4470, 0.7410];
MU = KMmovingmean{4};
SIGMA = stdKM{4};
Ptop = MU+SIGMA;
Pbot = MU-SIGMA;

X=DATE{4};
for i=1:numel(X)-1
    Px = [X(i) X(i+1) X(i+1) X(i)];
    Py = [Ptop(i) Ptop(i+1) Pbot(i+1) Pbot(i)];
    fill(Px,Py,color_value,'FaceAlpha',alpha_value,'EdgeColor','none');hold on
end
  
plot(DATE{4},MU,'-','LineWidth',line_width,'Color',color_value);hold on;
set(gca, 'Fontname', 'Times New Roman','FontSize',FS);
ylim([0 13]);


ylabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex');
yyaxis right
plot(DATE{4},mean_daily_price{4},'linewidth',line_width);
xlim([DATE{4}(1) DATE{4}(end)]);
ylabel('Real Price');
set(gca, 'Fontname', 'Times New Roman','FontSize',FS);
ylim([0 30]);
set(gca,'Xticklabel',[])


subplot('position',[0.1 0.4 0.35 0.1])
FS=10;



alpha_value = 0.25;
line_width = 0.8;


LW=0.8;

yyaxis left

color_value = bluecolor;
MU = moving_price;
SIGMA = std_price;
Ptop = MU+SIGMA;
Pbot = MU-SIGMA;
X= datetimes;
    
for i=1:numel(X)-1
    Px = [X(i) X(i+1) X(i+1) X(i)];
    Py = [Ptop(i) Ptop(i+1) Pbot(i+1) Pbot(i)];
    fill(Px,Py,[0.4940, 0.1840, 0.5560],'FaceAlpha',alpha_value,'EdgeColor','none');hold on
end
%[0.3010, 0.7450, 0.9330]
plot(X,MU,'-','LineWidth',line_width,'Color',[0.4940, 0.1840, 0.5560]);hold on;

ax = gca;
ax.YAxis(1).Color = [0.4940, 0.1840, 0.5560];
set(gca, 'Fontname', 'Times New Roman','FontSize',FS);

%set(gca,'xtick',[]);
%xlim([min(x_axis+t1)-lengthdate(1)*0.5 max(x_axis+t1)+lengthdate(end)*0.5]);
%xticks([x_axis(1)+t1 x_axis(8)+t1 x_axis(15)+t1 x_axis(22)+t1]);
%xticklabels({'2021-05-18','2021-05-27','2021-06-08','2021-06-17'})
%ticks(xticksrange);
%xticklabels({'2021-01-08','2021-01-15','2021-01-25','2021-02-01', '2021-02-08'})
%set(gca,'XTickLabel',{num2str(datecell{1}), num2str(datecell{1+NN}),num2str(datecell{1+NN*2}), num2str(datecell{1+NN*3}), num2str(datecell{1+NN*4}),num2str(datecell{1+NN*5})})
ylabel('Simulated Price')
%yticks([0.1  1  1.05])
%yticklabels({'0.95','1','1.05','1.1','1.15'})
ylim([0.99 1.05]);%1.02*max(aver_P(:,ID_p(1)))])
xlim([DATE{4}(1) DATE{4}(end)])
yyaxis right
plot(DATE{4},mean_daily_price{4},'-','linewidth',LW);
ylim([0 30])
%xlim([min(x_axis+t1)-lengthdate(1)*0.5 max(x_axis+t1)+lengthdate(end)*0.5]);
ylabel('Real Price')
set(gca, 'Fontname', 'Times New Roman','FontSize',FS);


set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);%设置图的位置
set(gcf, 'PaperSize', [25 25]); %Keep the same paper size，设置pdf纸张的大小，
saveas(gcf,'figure4.pdf');%保存命令