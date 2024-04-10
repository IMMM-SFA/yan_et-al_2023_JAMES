%% load all data

clear all; clc;

US = load('./other_files/us_coor.txt');
SL = load('./other_files/sl_coor.txt');

label_size = 12; line_width = 1; tick_size = 11; legend_size = 10; box_width = 0.5;
title_size = 12; tick_size = 12; text_size = 14; scatter_size = 20; colorbar_size= 10;
scatter_size = 40; label_size = 14; legend_size = 14; tick_size = 14; colorbar_size= 14;title_size = 14;


m_flow_metric_NSE = nan(7, 1308);  % 1-default sim, others, ensembles
m_flow_metric_AB  = nan(7, 1308);
m_flow_metric_KGE = nan(7, 1308);
m_flow_metric_TRMSE = nan(7, 1308);


cluster=1;
for i = 1:1308
    obs = r_c1_m(:,1); sim = r_c1_m(:,i+1); 
    m_flow_metric_NSE(cluster, i) = 1 - sum((sim-obs).^2)/sum( (obs -mean(obs)).^2);
    m_flow_metric_AB(cluster, i) =  (sum(sim)-sum(obs))/sum(obs)*100;
    m_flow_metric_KGE(cluster, i) =   1 - ((corr(obs,sim)-1)^2 + (mean(sim)/mean(obs)-1)^2 + ( std(sim)/std(obs)-1)^2)^0.5;
    
    lmada = 0.3; obs_t = ((1+obs).^lmada-1)/lmada; sim_t = ((1+sim).^lmada-1)/lmada;
    m_flow_metric_TRMSE(cluster, i) = (sum((sim_t-obs_t).^2)/length(sim_t))^0.5;
end

cluster=2;
for i = 1:1308
    obs = r_c2_m(:,1); sim = r_c2_m(:,i+1); 
    m_flow_metric_NSE(cluster, i) = 1 - sum((sim-obs).^2)/sum( (obs -mean(obs)).^2);
    m_flow_metric_AB(cluster, i) =  (sum(sim)-sum(obs))/sum(obs)*100;
    m_flow_metric_KGE(cluster, i) =   1 - ((corr(obs,sim)-1)^2 + (mean(sim)/mean(obs)-1)^2 + ( std(sim)/std(obs)-1)^2)^0.5;

    lmada = 0.3; obs_t = ((1+obs).^lmada-1)/lmada; sim_t = ((1+sim).^lmada-1)/lmada;
    m_flow_metric_TRMSE(cluster, i) = (sum((sim_t-obs_t).^2)/length(sim_t))^0.5;
end

cluster=3;
for i = 1:1308
    obs = r_c3_m(:,1); sim = r_c3_m(:,i+1); 
    m_flow_metric_NSE(cluster, i) = 1 - sum((sim-obs).^2)/sum( (obs -mean(obs)).^2);
    m_flow_metric_AB(cluster, i) =  (sum(sim)-sum(obs))/sum(obs)*100;
    m_flow_metric_KGE(cluster, i) =   1 - ((corr(obs,sim)-1)^2 + (mean(sim)/mean(obs)-1)^2 + ( std(sim)/std(obs)-1)^2)^0.5;

        lmada = 0.3; obs_t = ((1+obs).^lmada-1)/lmada; sim_t = ((1+sim).^lmada-1)/lmada;
    m_flow_metric_TRMSE(cluster, i) = (sum((sim_t-obs_t).^2)/length(sim_t))^0.5;
end

cluster=4;
for i = 1:1308
    obs = r_c4_m(:,1); sim = r_c4_m(:,i+1); 
    m_flow_metric_NSE(cluster, i) = 1 - sum((sim-obs).^2)/sum( (obs -mean(obs)).^2);
    m_flow_metric_AB(cluster, i) =  (sum(sim)-sum(obs))/sum(obs)*100;
    m_flow_metric_KGE(cluster, i) =   1 - ((corr(obs,sim)-1)^2 + (mean(sim)/mean(obs)-1)^2 + ( std(sim)/std(obs)-1)^2)^0.5;

        lmada = 0.3; obs_t = ((1+obs).^lmada-1)/lmada; sim_t = ((1+sim).^lmada-1)/lmada;
    m_flow_metric_TRMSE(cluster, i) = (sum((sim_t-obs_t).^2)/length(sim_t))^0.5;
end

cluster=5;
for i = 1:1308
    obs = r_c5_m(:,1); sim = r_c5_m(:,i+1); 
    m_flow_metric_NSE(cluster, i) = 1 - sum((sim-obs).^2)/sum( (obs -mean(obs)).^2);
    m_flow_metric_AB(cluster, i) =  (sum(sim)-sum(obs))/sum(obs)*100;
    m_flow_metric_KGE(cluster, i) =   1 - ((corr(obs,sim)-1)^2 + (mean(sim)/mean(obs)-1)^2 + ( std(sim)/std(obs)-1)^2)^0.5;

        lmada = 0.3; obs_t = ((1+obs).^lmada-1)/lmada; sim_t = ((1+sim).^lmada-1)/lmada;
    m_flow_metric_TRMSE(cluster, i) = (sum((sim_t-obs_t).^2)/length(sim_t))^0.5;
end

cluster=6;
for i = 1:1308
    obs = r_c6_m(:,1); sim = r_c6_m(:,i+1); 
    m_flow_metric_NSE(cluster, i) = 1 - sum((sim-obs).^2)/sum( (obs -mean(obs)).^2);
    m_flow_metric_AB(cluster, i) =  (sum(sim)-sum(obs))/sum(obs)*100;
    m_flow_metric_KGE(cluster, i) =   1 - ((corr(obs,sim)-1)^2 + (mean(sim)/mean(obs)-1)^2 + ( std(sim)/std(obs)-1)^2)^0.5;

        lmada = 0.3; obs_t = ((1+obs).^lmada-1)/lmada; sim_t = ((1+sim).^lmada-1)/lmada;
    m_flow_metric_TRMSE(cluster, i) = (sum((sim_t-obs_t).^2)/length(sim_t))^0.5;
end

cluster=7;
for i = 1:1308
    obs = r_c7_m(:,1); sim = r_c7_m(:,i+1); 
    m_flow_metric_NSE(cluster, i) = 1 - sum((sim-obs).^2)/sum( (obs -mean(obs)).^2);
    m_flow_metric_AB(cluster, i) =  (sum(sim)-sum(obs))/sum(obs)*100;
    m_flow_metric_KGE(cluster, i) =   1 - ((corr(obs,sim)-1)^2 + (mean(sim)/mean(obs)-1)^2 + ( std(sim)/std(obs)-1)^2)^0.5;

        lmada = 0.3; obs_t = ((1+obs).^lmada-1)/lmada; sim_t = ((1+sim).^lmada-1)/lmada;
    m_flow_metric_TRMSE(cluster, i) = (sum((sim_t-obs_t).^2)/length(sim_t))^0.5;
end

% box plot
x = 1:7; box_width=0.5; outlier_size = 3; default_size = 20; 
label_size = 12; line_width = 1; tick_size = 11; legend_size = 12; box_width = 0.5;
title_size = 12; tick_size = 12; text_size = 14; scatter_size = 20; colorbar_size= 12;

subplot(2,2,1)
h1 = boxplot(m_flow_metric_NSE(:, 2:end)', x, 'width', box_width); hold on; ylim([-2 1]);
h2 = scatter(x, m_flow_metric_NSE(:,1), default_size, 'MarkerEdgeColor', [255 0 0]/255, 'MarkerFaceColor', [255 0 0]/255);
set(gca,'color',[240 240 240]/255); grid on; box on;
color1 = [100 149 237]/255;
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
set(lines, 'Color', 'k');
h = findobj(gcf,'tag','Outliers')
for j=1:length(h)
     set(h(j), 'Marker', 'o', 'MarkerEdgeColor', 'k', 'Markersize', outlier_size);
     
end
h = findobj(gca,'Tag','Box');
for j=1:length(h)
     patch(get(h(j),'XData'),get(h(j),'YData'),color1,'FaceAlpha',0.5);
end

set(gca,'FontSize',tick_size);
% ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);  
% title('Cluster 7-Southeast', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7])
xticklabels({'C1-Northeast', 'C2-Pacific', 'C3-AZ/NM', 'C4-Rockies', 'C5-Great Plains', 'C6-Great Lakes', 'C7-Southeast'})
xtickangle(45)
ylabel('NSE of Monthly Flow', 'FontSize', label_size); 
text(0.85, 0.95, '(a)', 'FontSize', text_size, 'Units' ,'Normalized', 'fontweight','bold');

subplot(2,2,2)

h1 = boxplot(m_flow_metric_AB(:, 2:end)', x, 'width', box_width); hold on; ylim([-100 200]);
h2 = scatter(x, m_flow_metric_AB(:,1), default_size, 'MarkerEdgeColor', [255 0 0]/255, 'MarkerFaceColor', [255 0 0]/255);
set(gca,'color',[240 240 240]/255); grid on; box on;
color1 = [100 149 237]/255;
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
set(lines, 'Color', 'k');
h = findobj(gcf,'tag','Outliers')
for j=1:length(h)
     set(h(j), 'Marker', 'o', 'MarkerEdgeColor', 'k', 'Markersize', outlier_size);
     
end
h = findobj(gca,'Tag','Box');
for j=1:length(h)
     patch(get(h(j),'XData'),get(h(j),'YData'),color1,'FaceAlpha',0.5);
end

set(gca,'FontSize',tick_size);
% ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);  
% title('Cluster 7-Southeast', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7])
xticklabels({'C1-Northeast', 'C2-Pacific', 'C3-AZ/NM', 'C4-Rockies', 'C5-Great Plains', 'C6-Great Lakes', 'C7-Southeast'})
xtickangle(45)
ylabel('Annual Flow Volume Bias (%)', 'FontSize', label_size); 
text(0.85, 0.95, '(b)', 'FontSize', text_size, 'Units' ,'Normalized', 'fontweight','bold');

c = get(gca, 'Children');
[hh, hleg1] = legend([c(2) h2],   'Ensemble Sim.', 'Default Sim.'); 
set(hh,'FontSize',legend_size, 'Location','northwest','Orientation','vertical');
grid on;
legend boxoff;
PatchInLegend = findobj(hleg1, 'type', 'patch');
set(PatchInLegend(1), 'FaceAlpha', 0.5);


subplot(2,2,3)
h1 = boxplot(m_flow_metric_KGE(:, 2:end)', x, 'width', box_width); hold on; ylim([-1 1]);
h2 = scatter(x, m_flow_metric_KGE(:,1), default_size, 'MarkerEdgeColor', [255 0 0]/255, 'MarkerFaceColor', [255 0 0]/255);
set(gca,'color',[240 240 240]/255); grid on; box on;
color1 = [100 149 237]/255;
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
set(lines, 'Color', 'k');
h = findobj(gcf,'tag','Outliers')
for j=1:length(h)
     set(h(j), 'Marker', 'o', 'MarkerEdgeColor', 'k', 'Markersize', outlier_size);
     
end
h = findobj(gca,'Tag','Box');
for j=1:length(h)
     patch(get(h(j),'XData'),get(h(j),'YData'),color1,'FaceAlpha',0.5);
end

set(gca,'FontSize',tick_size);
% ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);  
% title('Cluster 7-Southeast', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7])
xticklabels({'C1-Northeast', 'C2-Pacific', 'C3-AZ/NM', 'C4-Rockies', 'C5-Great Plains', 'C6-Great Lakes', 'C7-Southeast'})
xtickangle(45)
ylabel('KGE of Monthly Flow', 'FontSize', label_size); 
text(0.85, 0.95, '(c)', 'FontSize', text_size, 'Units' ,'Normalized', 'fontweight','bold');


subplot(2,2,4)
h1 = boxplot(m_flow_metric_TRMSE(:, 2:end)', x, 'width', box_width); hold on; %ylim([-1 1]);
h2 = scatter(x, m_flow_metric_TRMSE(:,1), default_size, 'MarkerEdgeColor', [255 0 0]/255, 'MarkerFaceColor', [255 0 0]/255);
set(gca,'color',[240 240 240]/255); grid on; box on;
color1 = [100 149 237]/255;
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
set(lines, 'Color', 'k');
h = findobj(gcf,'tag','Outliers')
for j=1:length(h)
     set(h(j), 'Marker', 'o', 'MarkerEdgeColor', 'k', 'Markersize', outlier_size);
     
end
h = findobj(gca,'Tag','Box');
for j=1:length(h)
     patch(get(h(j),'XData'),get(h(j),'YData'),color1,'FaceAlpha',0.5);
end

set(gca,'FontSize',tick_size);
% ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);  
% title('Cluster 7-Southeast', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7])
xticklabels({'C1-Northeast', 'C2-Pacific', 'C3-AZ/NM', 'C4-Rockies', 'C5-Great Plains', 'C6-Great Lakes', 'C7-Southeast'})
xtickangle(45)
ylabel('TRMSE of Monthly Flow (mm/day)', 'FontSize', label_size); 
text(0.85, 0.95, '(d)', 'FontSize', text_size, 'Units' ,'Normalized', 'fontweight','bold');
