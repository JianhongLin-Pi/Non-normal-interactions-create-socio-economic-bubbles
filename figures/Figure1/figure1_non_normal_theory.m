function figure1_non_normal_theory(xdata1, ydata1, zdata1, X1, Y1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6, xdata2, ydata2, zdata2, X7, Y7, X8, Y8, X9, Y9, X10, Y10, X11, Y11, xdata3, ydata3, zdata3, X12, Y12, X13, Y13, X14, Y14, X15, Y15, zdata4)
%CREATEFIGURE(xdata1, ydata1, zdata1, X1, Y1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6, xdata2, ydata2, zdata2, X7, Y7, X8, Y8, X9, Y9, X10, Y10, X11, Y11, xdata3, ydata3, zdata3, X12, Y12, X13, Y13, X14, Y14, X15, Y15, zdata4)
%  XDATA1:  contour x
%  YDATA1:  contour y
%  ZDATA1:  contour z
%  X1:  vector of x data
%  Y1:  vector of y data
%  X2:  vector of x data
%  Y2:  vector of y data
%  X3:  vector of x data
%  Y3:  vector of y data
%  X4:  vector of x data
%  Y4:  vector of y data
%  X5:  vector of x data
%  Y5:  vector of y data
%  X6:  vector of x data
%  Y6:  vector of y data
%  XDATA2:  contour x
%  YDATA2:  contour y
%  ZDATA2:  contour z
%  X7:  vector of x data
%  Y7:  vector of y data
%  X8:  vector of x data
%  Y8:  vector of y data
%  X9:  vector of x data
%  Y9:  vector of y data
%  X10:  vector of x data
%  Y10:  vector of y data
%  X11:  vector of x data
%  Y11:  vector of y data
%  XDATA3:  contour x
%  YDATA3:  contour y
%  ZDATA3:  contour z
%  X12:  vector of x data
%  Y12:  vector of y data
%  X13:  vector of x data
%  Y13:  vector of y data
%  X14:  vector of x data
%  Y14:  vector of y data
%  X15:  vector of x data
%  Y15:  vector of y data
%  ZDATA4:  contour z

%  Auto-generated by MATLAB on 03-Oct-2023 17:46:12

% Create figure
figure('Colormap',...
    [0 1 0.1;0 0.925 0.175;0 0.85 0.25;0 0.775 0.325;0 0.7 0.4;0 0.625 0.475;0 0.55 0.55;0 0.475 0.625;0 0.4 0.7;0 0.325 0.775;0 0.25 0.85;0 0.175 0.925;0 0.1 1;0.06153846153846 0.09230769230769 1;0.12307692307692 0.08461538461538 1;0.18461538461538 0.07692307692308 1;0.24615384615385 0.06923076923077 1;0.30769230769231 0.06153846153846 1;0.36923076923077 0.05384615384615 1;0.43076923076923 0.04615384615385 1;0.49230769230769 0.03846153846154 1;0.55384615384615 0.03076923076923 1;0.61538461538462 0.02307692307692 1;0.67692307692308 0.01538461538462 1;0.73846153846154 0.00769230769231 1;0.8 0 1;0.80769230769231 0 0.92307692307692;0.81538461538462 0 0.84615384615385;0.82307692307692 0 0.76923076923077;0.83076923076923 0 0.69230769230769;0.83846153846154 0 0.61538461538462;0.84615384615385 0 0.53846153846154;0.85384615384615 0 0.46153846153846;0.86153846153846 0 0.38461538461538;0.86923076923077 0 0.30769230769231;0.87692307692308 0 0.23076923076923;0.88461538461538 0 0.15384615384615;0.89230769230769 0 0.07692307692308;0.9 0 0;0.86923076923077 0 0;0.83846153846154 0 0;0.80769230769231 0 0;0.77692307692308 0 0;0.74615384615385 0 0;0.71538461538462 0 0;0.68461538461538 0 0;0.65384615384615 0 0;0.62307692307692 0 0;0.59230769230769 0 0;0.56153846153846 0 0;0.53076923076923 0 0;0.5 0 0;0.54166666666667 0.05 0;0.58333333333333 0.1 0;0.625 0.15 0;0.66666666666667 0.2 0;0.70833333333333 0.25 0;0.75 0.3 0;0.79166666666667 0.35 0;0.83333333333333 0.4 0;0.875 0.45 0;0.91666666666667 0.5 0;0.95833333333333 0.55 0;1 0.6 0],...
    'SizeChangedFcn','resize_et_colourbar(gcbf)');

% Create axes
axes1 = axes('Tag','MainAxes',...
    'Position',[0.0978768577494691 0.256071964017989 0.4 0.25]);
hold(axes1,'on');

% Create contour
contour(xdata1,ydata1,zdata1,'LineWidth',1.5,'LevelList',[-2 -1.5 -1 -0.5]);

% Create plot
plot(X1,Y1,'MarkerSize',16,'Marker','.','LineStyle','none','Color',[0 0 0]);

% Create plot
plot(X2,Y2,'LineWidth',1.5,'LineStyle','--','Color',[0 0 0]);

% Create ylabel
ylabel('$Im(\lambda)$','FontSize',15,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel('$Re(\lambda)$','FontSize',15,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create title
title('(d) normal','FontName','Times New Roman');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[-1.5 0.05]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-0.4 0.6]);
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'BoxStyle','full','CLim',[-2 -0.5],'DataAspectRatio',[1 1 1],...
    'FontName','Times New Roman','FontSize',15,'Layer','top',...
    'PlotBoxAspectRatio',[1.55 1 2]);
% Create colorbar
colorbar(axes1,'Position',...
    [0.792728238036744 0.255917879391714 0.0169851380042464 0.250385210855017],...
    'FontSize',15);

% Create axes
axes2 = axes('Position',...
    [0.336942675159236 0.417391304347822 0.0800000000000001 0.0799999999999999]);
hold(axes2,'on');

% Create plot
plot(X3,Y3,'LineWidth',2,'Color',[0 1 0.1]);

% Create plot
plot(X4,Y4,'LineWidth',2,'Color',[0.55 0.03 1]);

% Create plot
plot(X5,Y5,'LineWidth',2,'Color',[0.78 0 0]);

% Create plot
plot(X6,Y6,'LineWidth',2,'Color',[1 0.6 0]);

% Create ylabel
ylabel('$||s(t)||$','FontName','Times New Roman','Interpreter','latex');

% Create xlabel
xlabel('$t$','FontName','Times New Roman','Interpreter','latex');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes2,[0 20]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes2,[0 2.1]);
box(axes2,'on');
hold(axes2,'off');
% Set the remaining axes properties
set(axes2,'FontName','Times New Roman','XTick',[0 10 20],'XTickLabel',...
    {'0','10','20'},'YTickLabel',{'0','1','2'});
% Create axes
axes3 = axes('Tag','MainAxes',...
    'Position',[0.428874734607218 0.256071964017989 0.4 0.25]);
hold(axes3,'on');

% Create contour
contour(xdata2,ydata2,zdata2,'LineWidth',1.5,'LevelList',[-2 -1.5 -1 -0.5]);

% Create plot
plot(X7,Y1,'MarkerSize',16,'Marker','.','LineStyle','none','Color',[0 0 0]);

% Create plot
plot(X2,Y7,'LineWidth',1.5,'LineStyle','--','Color',[0 0 0]);

% Create ylabel
ylabel('$Im(\lambda)$','FontSize',15,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel('$Re(\lambda)$','FontSize',15,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create title
title('(e) non-normal','FontName','Times New Roman');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes3,[-3 4.75]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes3,[-2.5 2.5]);
box(axes3,'on');
hold(axes3,'off');
% Set the remaining axes properties
set(axes3,'BoxStyle','full','CLim',[-2 -0.5],'DataAspectRatio',[1 1 1],...
    'FontName','Times New Roman','FontSize',15,'Layer','top',...
    'PlotBoxAspectRatio',[3.875 2.5 1]);
% Create axes
axes4 = axes('Position',...
    [0.678768577494692 0.415892053973009 0.0800000000000001 0.0799999999999999]);
hold(axes4,'on');

% Create plot
plot(X8,Y8,'LineWidth',1.5,'Color',[0 1 0.1]);

% Create plot
plot(X9,Y9,'LineWidth',1.5,'Color',[0.55 0.03 1]);

% Create plot
plot(X10,Y10,'LineWidth',1.5,'Color',[0.78 0 0]);

% Create plot
plot(X11,Y11,'LineWidth',1.5,'Color',[1 0.6 0]);

% Create ylabel
ylabel('$||s(t)||$','FontName','Times New Roman','Interpreter','latex');

% Create xlabel
xlabel('$t$','FontName','Times New Roman','Interpreter','latex');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes4,[0 20]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes4,[0 17]);
box(axes4,'on');
hold(axes4,'off');
% Set the remaining axes properties
set(axes4,'FontName','Times New Roman','YTick',[0 8 16]);
% Create axes
axes5 = axes('Position',[0.451167728237792 0.308845577211394 0.4 0.3]);
axis off

box(axes5,'on');
% Create axes
axes6 = axes('Tag','MainAxes',...
    'Position',[0.178874734607219 0.745314842578711 0.218152866242038 0.154047976011994]);
hold(axes6,'on');

% Create contour
contour(xdata3,ydata3,zdata3,'LineWidth',1.5,'LevelList',[-0.65 -0.4]);

% Create plot
plot(X12,Y12,'MarkerSize',16,'Marker','.','LineStyle','none',...
    'Color',[0 0 0]);

% Create title
title('(a) normal','FontSize',15,'FontName','Times New Roman');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes6,[-4 0]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes6,[-0.5 1.5]);
box(axes6,'on');
hold(axes6,'off');
% Set the remaining axes properties
set(axes6,'BoxStyle','full','CLim',[-0.650000000000001 -0.4],...
    'DataAspectRatio',[1 1 1],'Layer','top','PlotBoxAspectRatio',[2 1 1],...
    'XColor','none','XTick',zeros(1,0),'YColor','none','YTick',zeros(1,0));
% Create axes
axes7 = axes('Position',...
    [0.491507430997876 0.61469265367316 0.318471337579618 0.250374812593703]);
hold(axes7,'on');

% Create plot
plot(X13,Y13,'LineWidth',1.5);

% Create plot
plot(X14,Y14,'LineWidth',1.5,'LineStyle','--');

% Create plot
plot(X15,Y15,'LineWidth',1.5,'LineStyle','--');

% Create text
text('FontSize',14,'FontName','Times New Roman','Interpreter','latex',...
    'String',{'slope determined by','numerical abscissa $\omega(\mathbf{M})$'},...
    'Position',[0.4 3.33066907387547e-16 0]);

% Create text
text('FontSize',14,'FontName','Times New Roman','Interpreter','latex',...
    'String',{'slope determined by','spectral abscissa $\alpha(\mathbf{M})$'},...
    'Position',[5.52666666666667 0.597784431137724 1.4210854715202e-14]);

% Create text
text('FontSize',14,'FontName','Times New Roman','Interpreter','latex',...
    'String',{'transient approximately determinated','by pseudospectral abscissa $\alpha_{\epsilon}(\mathbf{M})$'},...
    'Position',[1.13333333333333 1.43293413173653 0]);

% Create ylabel
ylabel('$||log(e^{t\mathbf{M}})||$','FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel('$t$','FontName','Times New Roman','Interpreter','latex');

% Create title
title({'(c)'},'FontName','Times New Roman');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes7,[0 10.6]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes7,[-1 1.78]);
box(axes7,'on');
hold(axes7,'off');
% Set the remaining axes properties
set(axes7,'FontName','Times New Roman','FontSize',15);
% Create axes
axes8 = axes('Tag','MainAxes',...
    'Position',[0.178874734607219 0.562406295024115 0.217091295116773 0.153298350824588]);
hold(axes8,'on');

% Create contour
contour(xdata3,ydata3,zdata4,'LineWidth',1.5,'LevelList',[-0.65 -0.4]);

% Create plot
plot(X12,Y12,'MarkerSize',16,'Marker','.','LineStyle','none',...
    'Color',[0 0 0]);

% Create title
title('(b) non-normal','FontSize',15,'FontName','Times New Roman');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes8,[-4 0]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes8,[-0.6 1.4]);
box(axes8,'on');
hold(axes8,'off');
% Set the remaining axes properties
set(axes8,'BoxStyle','full','CLim',[-0.650000000000001 -0.4],...
    'DataAspectRatio',[1 1 1],'Layer','top','PlotBoxAspectRatio',[2 1 1],...
    'XColor','none','XTick',zeros(1,0),'YColor','none','YTick',zeros(1,0));
