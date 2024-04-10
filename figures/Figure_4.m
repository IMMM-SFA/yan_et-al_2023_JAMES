%% load all data

clear all; clc;

US = load('./other_files/us_coor.txt');
SL = load('./other_files/sl_coor.txt');

label_size = 12; line_width = 1; tick_size = 11; legend_size = 10; box_width = 0.5;
title_size = 12; tick_size = 12; text_size = 14; scatter_size = 20; colorbar_size= 10;
scatter_size = 40; label_size = 14; legend_size = 14; tick_size = 14; colorbar_size= 14;title_size = 14;


%% effects of parameter uncertainty

data = readtable('./flow_metrics/default_daily_metrics.csv');
lat = data.Var2; lon = data.Var3; cluster_ID = data.Var4; basin_ID = data.Var1; clear data;

% load mean annual flow
default_obs = nan(464, 2);  % 1- default, 2-obs all in m3/s
for i = 1:464
    data = load (sprintf('./default_flow/%08d_annually', basin_ID(i)));
    data(data(:)<0) = nan;
    default_obs(i,1) = nanmean(data(:,2));
    default_obs(i,2) = nanmean(data(:,3));
end

% load ensemble flow
ensemble = nan(464, 1307);
for i = 1:464
    data = load (sprintf('./ensemble_flow/%08d_annually_ensemble', basin_ID(i)));
    data(data(:)<0) = nan;
    ensemble(i,:) = nanmean(data,1);
end

% estimate the CV (in %, compared to default)
cv_mean_annual_flow = nan(464, 3);   % 1-compared to default, 2-compared to obs, 3-compared the parameter mean
for i = 1:464
    cv_mean_annual_flow(i,1) = std(ensemble(i,:))/default_obs(i,1)*100;
    cv_mean_annual_flow(i,2) = std(ensemble(i,:))/default_obs(i,2)*100;
    cv_mean_annual_flow(i,3) = std(ensemble(i,:))/mean(ensemble(i,:))*100;
end


    




%%

% load 99% percentile daily flow
default_obs = nan(464, 2);  % 1- default, 2-obs all in m3/s
for i = 1:464
    data = load (sprintf('./default_flow/%08d_daily', basin_ID(i)));
    data(data(:)<0) = nan;
    default_obs(i,1) = quantile(data(:,4), 0.99);
    default_obs(i,2) = quantile(data(:,5), 0.99);
end

% load ensemble flow
ensemble = load('ensemble_flow99_daily');
ensemble = ensemble(:,2:end);

% estimate the CV (in %, compared to default)
cv_99_flow = nan(464, 3);   % 1-compared to default, 2-compared to obs, 3-compared the parameter mean
for i = 1:464
    cv_99_flow(i,1) = std(ensemble(i,:))/default_obs(i,1)*100;
    cv_99_flow(i,2) = std(ensemble(i,:))/default_obs(i,2)*100;
    cv_99_flow(i,3) = std(ensemble(i,:))/mean(ensemble(i,:))*100;
end

% find the regional median value
regional_median = nan(7,2);  %1-cv of mean annual flow, 2-cv of 99% flow
for cluster = 1:7
    regional_median(cluster,1) = median(cv_mean_annual_flow(cluster_ID==cluster,3));
    regional_median(cluster,2) = median(cv_99_flow(cluster_ID==cluster,3));
end

%%
subplot(2,1,1)

metric_daily = cv_mean_annual_flow(:,3);
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


colormap(brewermap([],'Reds'));    
caxis([0 50]);  

c = colorbar; 
c.FontSize = colorbar_size;
% c=colorbar;
x1=get(gca,'position');
x=get(c,'Position');
x(3)=0.02;
set(c,'Position',x)
set(gca,'position',x1)


d = cbarrow('up');



plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color','black'); hold on; 
plot(SL(:,1), SL(:,2),'.','MarkerSize',2,'Color','black');

xlim([-128 -64]); ylim([22 52]); box on;
xlabel('Longitude', 'FontSize', label_size); 
ylabel('Latitude', 'FontSize', label_size); 

title('(a) Mean Annual Flow', 'FontSize', title_size);

set(gca,'color',[240 240 240]/255)

subplot(2,1,2)



metric_daily = cv_99_flow(:,3);
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

colormap(brewermap([],'Reds'));    
caxis([0 50]);  

% c = colorbar; 
% c.FontSize = colorbar_size;
% % c=colorbar;
% x1=get(gca,'position');
% x=get(c,'Position');
% x(3)=0.02;
% set(c,'Position',x)
% set(gca,'position',x1)
% 
% 
% d = cbarrow('up');



plot(US(:,1), US(:,2),'.','MarkerSize',2,'Color','black'); hold on; 
plot(SL(:,1), SL(:,2),'.','MarkerSize',2,'Color','black');

xlim([-128 -64]); ylim([22 52]); box on;
xlabel('Longitude', 'FontSize', label_size); 
ylabel('Latitude', 'FontSize', label_size); 

title('(b) Daily Flow 99% Quantile', 'FontSize', title_size);
set(gca,'color',[240 240 240]/255)