%% load all data

clear all; clc;

US = load('./other_files/us_coor.txt');
SL = load('./other_files/sl_coor.txt');

label_size = 12; line_width = 1; tick_size = 11; legend_size = 10; box_width = 0.5;
title_size = 12; tick_size = 12; text_size = 14; scatter_size = 20; colorbar_size= 10;
scatter_size = 40; label_size = 14; legend_size = 14; tick_size = 14; colorbar_size= 14;title_size = 14;

data = readtable('./other_files/default_daily_metrics.csv');
lat = data.Var2; lon = data.Var3; cluster_ID = data.Var4;
metric_daily = data.Var7;   % var6-nse, var7-kge
fmt = {'o','^','v','s','>','h','<'};
cluster=1; scatter(lon(cluster_ID==cluster), lat(cluster_ID==cluster), scatter_size, metric_daily(cluster_ID==cluster), fmt{cluster},'filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
cluster=2; scatter(lon(cluster_ID==cluster), lat(cluster_ID==cluster), scatter_size, metric_daily(cluster_ID==cluster), fmt{cluster},'filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
cluster=3; scatter(lon(cluster_ID==cluster), lat(cluster_ID==cluster), scatter_size, metric_daily(cluster_ID==cluster), fmt{cluster},'filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
cluster=4; scatter(lon(cluster_ID==cluster), lat(cluster_ID==cluster), scatter_size+16, metric_daily(cluster_ID==cluster), fmt{cluster},'filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
cluster=5; scatter(lon(cluster_ID==cluster), lat(cluster_ID==cluster), scatter_size, metric_daily(cluster_ID==cluster), fmt{cluster},'filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
cluster=6; scatter(lon(cluster_ID==cluster), lat(cluster_ID==cluster), scatter_size+16, metric_daily(cluster_ID==cluster), fmt{cluster},'filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;
cluster=7; scatter(lon(cluster_ID==cluster), lat(cluster_ID==cluster), scatter_size, metric_daily(cluster_ID==cluster), fmt{cluster},'filled', 'MarkerEdgeColor',[105 105 105]/255, 'LineWidth',line_width-0.5); hold on;

cluster=1;h1 = scatter(80, 30, scatter_size, 1, fmt{cluster}, 'MarkerEdgeColor',[0 0 0]/255, 'LineWidth',line_width+0.5); hold on;
cluster=2;h2 = scatter(80, 30, scatter_size, 1, fmt{cluster}, 'MarkerEdgeColor',[0 0 0]/255, 'LineWidth',line_width+0.5); hold on;
cluster=3;h3 = scatter(80, 30, scatter_size, 1, fmt{cluster}, 'MarkerEdgeColor',[0 0 0]/255, 'LineWidth',line_width+0.5); hold on;
cluster=4;h4 = scatter(80, 30, scatter_size, 1, fmt{cluster}, 'MarkerEdgeColor',[0 0 0]/255, 'LineWidth',line_width+0.5); hold on;
cluster=5;h5 = scatter(80, 30, scatter_size, 1, fmt{cluster}, 'MarkerEdgeColor',[0 0 0]/255, 'LineWidth',line_width+0.5); hold on;
cluster=6;h6 = scatter(80, 30, scatter_size, 1, fmt{cluster}, 'MarkerEdgeColor',[0 0 0]/255, 'LineWidth',line_width+0.5); hold on;
cluster=7;h7 = scatter(80, 30, scatter_size, 1, fmt{cluster}, 'MarkerEdgeColor',[0 0 0]/255, 'LineWidth',line_width+0.5); hold on;

set(gca,'FontSize',tick_size);

c = colorbar; 
caxis([-1 1]);  
colormap(brewermap([],'*RdBu'));    
c.FontSize = colorbar_size;


c=colorbar;
x1=get(gca,'position');
x=get(c,'Position');
x(3)=0.02;
set(c,'Position',x)
set(gca,'position',x1)


d = cbarrow('down');



plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color','black'); hold on; 
plot(SL(:,1), SL(:,2),'.','MarkerSize',2,'Color','black');

xlim([-128 -64]); ylim([22 52]); box on;
xlabel('Longitude', 'FontSize', label_size); 
ylabel('Latitude', 'FontSize', label_size); 

title('Daily Flow: KGE', 'FontSize', title_size);
box on; 

set(gca,'color',[240 240 240]/255)