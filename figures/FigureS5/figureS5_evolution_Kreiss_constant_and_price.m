load data_figureS5_evolution_Kreiss_constant_and_price.mat

dataName{1}='Gamestop';
dataName{2}='AMC Entertainment';
dataName{3}='Nokia';
dataName{4}='BlackBerry';

figure; 
textSize = 10;
alpha_value = 0.25;
line_width = 1;

for ii = 1:4
    if ii == 1
       subplot('position',[0.1 0.9-3*0.15 0.5 0.11]);
    end
    
    if ii == 2
       subplot('position',[0.1 0.9-4*0.15 0.5 0.11]);
    end
    
    if ii == 3
       subplot('position',[0.1 0.9-2*0.15 0.5 0.11]);
    end
    
    if ii == 4
       subplot('position',[0.1 0.9-1*0.15 0.5 0.11]);
    end
    
    yyaxis left
    
    color_value = [0, 0.4470, 0.7410];
    MU = KMmovingmean{ii};
    SIGMA = stdKM{ii};
    Ptop = MU+SIGMA;
    Pbot = MU-SIGMA;
    X=date{ii};
    
    for i=1:numel(X)-1
        Px = [X(i) X(i+1) X(i+1) X(i)];
        Py = [Ptop(i) Ptop(i+1) Pbot(i+1) Pbot(i)];
        fill(Px,Py,color_value,'FaceAlpha',alpha_value,'EdgeColor','none');hold on
    end
    
    plot(date{ii},MU,'-','LineWidth',line_width,'Color',color_value);hold on;
    if ii == 4
        ylim([0 13]);
    end
    ylabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex');

    yyaxis right

    plot(date{ii},mean_daily_price{ii},'linewidth',line_width);
    xlim([date{ii}(1) date{ii}(end)]);
    if ii == 3
        ylim([3 8]);
    end
    title(sprintf('%s', dataName{ii}))
    ylabel('Price');
    if ii ~= 2
        set(gca,'xticklabel',[])
    end
    if ii==4
        text(-20, 27,'(a)','Fontsize',FS);
    end
end

MS=5;
FS=10;
lw=1;
for ii = 1:4
    if ii == 1
       subplot('position',[0.7 0.9-3*0.15 0.15 0.11]);
    end
    
    if ii == 2
       subplot('position',[0.7 0.9-4*0.15 0.15 0.11]);
    end
    
    if ii == 3
       subplot('position',[0.7 0.9-2*0.15 0.15 0.11]);
    end
    
    if ii == 4
       subplot('position',[0.7 0.9-1*0.15 0.15 0.11]);
       
    end
    plot(KM{ii},bubble_size{ii},'o','MarkerSize',MS,'linewidth',lw);hold on
    plot(xall{ii},yKMall{ii},'-','color',[0.9290, 0.6940, 0.1250],'linewidth',lw); hold on  
    title(sprintf('%s', dataName{ii}))
    ylim([0 1.1*max(bubble_size{ii})]);
    ylabel('Bubble Size')
    if ii==2
        xlabel('$\mathcal{K}(\mathbf{M})$','Interpreter','Latex');
    end
    if ii==4
        text(-1, 1.83,'(b)','Fontsize',FS);
    end
    if ii ==1
        txt =  strcat('y={',num2str(ball{ii}(2)),'}x+{',num2str(ball{ii}(1)),'}');
        text(1,5/6*(max(yyall{ii})-min(yyall{ii}))+min(yyall{ii}+0.2),txt,'Fontsize',textSize);
        xlim([0 12])
    end
     
     if ii ==3
        txt =  strcat('y={',num2str(ball{ii}(2)),'}x{',num2str(ball{ii}(1)),'}');
        text(0.55,0.85,txt,'Fontsize',textSize);
        ylim([0 1])
        
     end
     
     if ii ==2
        txt =  strcat('y={',num2str(ball{ii}(2)),'}x+{',num2str(ball{ii}(1)),'}');
        text(0.7,2.2,txt,'Fontsize',textSize);
        
     end
     
     
     if ii ==4
        txt =  strcat('y={',num2str(ball{ii}(2)),'}x{',num2str(ball{ii}(1)),'}');
        text(0.8,1.3,txt,'Fontsize',textSize);
        xlim([0 8])
        ylim([0 1.6])

     end
end
    
set(gca,'looseInset',[0 0 0 0])
set(gcf, 'PaperPosition', [-0.75 0.2 26.5 26]);
set(gcf, 'PaperSize', [25 25]);
saveas(gcf,'figureS5.pdf');










