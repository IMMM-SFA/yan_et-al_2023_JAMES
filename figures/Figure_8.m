%% load all data

clear all; clc;
scatter_size = 40; label_size = 16; legend_size = 14; tick_size = 14; colorbar_size= 14;title_size = 14;

metric = {'D_KGE', 'D_MAE', 'D_NSE', 'D_RMSE', 'D_TRMSE', 'M_KGE', 'M_MAE', 'M_NSE', 'M_RMSE', 'M_TRMSE', 'daily_variance_bias', ...
          'monthly_variance_bias', 'daily_volume_bias', 'daily_q0_10_volume_bias', 'daily_q10_25_volume_bias', 'daily_q25_50_volume_bias',...
          'daily_q50_75_volume_bias', 'daily_q75_90_volume_bias', 'daily_q90_100_volume_bias', 'daily_winter_volume_bias', ...
          'daily_spring_volume_bias', 'daily_summer_volume_bias', 'daily_fall_volume_bias'};
      
      
      
label_size = 12; line_width = 1; tick_size = 12; legend_size = 11;
title_size = 12; tick_size = 12; text_size = 12; scatter_size = 15; colorbar_size= 12;      
      
      
      
subplot(3,3,1)
cluster = 1;
matrix = nan(15, length(metric));     
for i = 1:length(metric)
    n_sa = load(sprintf('./SA_metrics/n_delta_OUT_%s', metric{i}));
    % rank by cluster
    r_sa = sortrows(n_sa,4);
    score = r_sa(:,5:end);
    metric1 = r_sa(r_sa(:,4)==cluster,:);
    sum_SA = nansum(metric1(:,5:end),1);
    for j = 1:15
        matrix(j,i) = (sum_SA(j) - min(sum_SA)) / (max(sum_SA) - min(sum_SA));
    end 
end

h1 = imagesc(matrix); hold on; 
caxis([0 1]);  colormap(brewermap([10],'*RdBu'));    
%ylabel(h, 'Normalized Sensitive Score', 'FontSize', label_size);
set(gca,'YDir','normal')

x=1:15;
y=1:15; yticks(x); yticklabels({'fff', 'N_{bf}', 'K_{bf}', 'S_y', 'B', 'ψ_{sat}', 'k_{sat}', 'Ɵ_{sat}', 'N_{melt}', 'k_{acc}',...
    'p_{sno}', 'p_{lip}', 'f_{wet}', 'd_{max}', 'Ɵ_{ini}'});




xlabel('Metric Number', 'FontSize', label_size); 
ylabel('Parameters', 'FontSize', label_size); 
xticks(1:23);
title(sprintf('(a) Cluster %d-Northeast', cluster), 'FontSize', title_size); 

for i = 0.5:1:23.5
    line([i, i], [0 25], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

for i = 0.5:1:23.5
   line([0,25], [i , i], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

set(gca,'FontSize',tick_size);








subplot(3,3,2)
cluster = 2;
matrix = nan(15, length(metric));     
for i = 1:length(metric)
    n_sa = load(sprintf('./SA_metrics/n_delta_OUT_%s', metric{i}));
    % rank by cluster
    r_sa = sortrows(n_sa,4);
    score = r_sa(:,5:end);
    metric1 = r_sa(r_sa(:,4)==cluster,:);
    sum_SA = nansum(metric1(:,5:end),1);
    for j = 1:15
        matrix(j,i) = (sum_SA(j) - min(sum_SA)) / (max(sum_SA) - min(sum_SA));
    end 
end

h2 = imagesc(matrix); hold on; 
caxis([0 1]);  colormap(brewermap([10],'*RdBu'));    
%ylabel(h, 'Normalized Sensitive Score', 'FontSize', label_size);
set(gca,'YDir','normal')


y=1:15; yticks(x); yticklabels({'fff', 'N_{bf}', 'K_{bf}', 'S_y', 'B', 'ψ_{sat}', 'k_{sat}', 'Ɵ_{sat}', 'N_{melt}', 'k_{acc}',...
    'p_{sno}', 'p_{lip}', 'f_{wet}', 'd_{max}', 'Ɵ_{ini}'});

xlabel('Metric Number', 'FontSize', label_size); 
ylabel('Parameters', 'FontSize', label_size); 
xticks(1:23);
title(sprintf('(b) Cluster %d-Pacific', cluster), 'FontSize', title_size); 

for i = 0.5:1:23.5
    line([i, i], [0 25], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

for i = 0.5:1:23.5
   line([0,25], [i , i], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

set(gca,'FontSize',tick_size);








subplot(3,3,3)
cluster = 3;
matrix = nan(15, length(metric));     
for i = 1:length(metric)
    n_sa = load(sprintf('./SA_metrics/n_delta_OUT_%s', metric{i}));
    % rank by cluster
    r_sa = sortrows(n_sa,4);
    score = r_sa(:,5:end);
    metric1 = r_sa(r_sa(:,4)==cluster,:);
    sum_SA = nansum(metric1(:,5:end),1);
    for j = 1:15
        matrix(j,i) = (sum_SA(j) - min(sum_SA)) / (max(sum_SA) - min(sum_SA));
    end 
end

h3 = imagesc(matrix); hold on; 
caxis([0 1]);  colormap(brewermap([10],'*RdBu'));    
%ylabel(h, 'Normalized Sensitive Score', 'FontSize', label_size);
set(gca,'YDir','normal')


y=1:15; yticks(x); yticklabels({'fff', 'N_{bf}', 'K_{bf}', 'S_y', 'B', 'ψ_{sat}', 'k_{sat}', 'Ɵ_{sat}', 'N_{melt}', 'k_{acc}',...
    'p_{sno}', 'p_{lip}', 'f_{wet}', 'd_{max}', 'Ɵ_{ini}'});

xlabel('Metric Number', 'FontSize', label_size); 
ylabel('Parameters', 'FontSize', label_size); 
xticks(1:23);
title(sprintf('(c) Cluster %d-AZ/NM', cluster), 'FontSize', title_size); 

for i = 0.5:1:23.5
    line([i, i], [0 25], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

for i = 0.5:1:23.5
   line([0,25], [i , i], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

set(gca,'FontSize',tick_size);



subplot(3,3,4)
cluster = 4;
matrix = nan(15, length(metric));     
for i = 1:length(metric)
    n_sa = load(sprintf('./SA_metrics/n_delta_OUT_%s', metric{i}));
    % rank by cluster
    r_sa = sortrows(n_sa,4);
    score = r_sa(:,5:end);
    metric1 = r_sa(r_sa(:,4)==cluster,:);
    sum_SA = nansum(metric1(:,5:end),1);
    for j = 1:15
        matrix(j,i) = (sum_SA(j) - min(sum_SA)) / (max(sum_SA) - min(sum_SA));
    end 
end

h4 = imagesc(matrix); hold on; 
caxis([0 1]);  colormap(brewermap([10],'*RdBu'));    
%ylabel(h, 'Normalized Sensitive Score', 'FontSize', label_size);
set(gca,'YDir','normal')


y=1:15; yticks(x); yticklabels({'fff', 'N_{bf}', 'K_{bf}', 'S_y', 'B', 'ψ_{sat}', 'k_{sat}', 'Ɵ_{sat}', 'N_{melt}', 'k_{acc}',...
    'p_{sno}', 'p_{lip}', 'f_{wet}', 'd_{max}', 'Ɵ_{ini}'});

xlabel('Metric Number', 'FontSize', label_size); 
ylabel('Parameters', 'FontSize', label_size); 
xticks(1:23);
title(sprintf('(d) Cluster %d-Rockies', cluster), 'FontSize', title_size); 

for i = 0.5:1:23.5
    line([i, i], [0 25], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

for i = 0.5:1:23.5
   line([0,25], [i , i], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

set(gca,'FontSize',tick_size);



subplot(3,3,5)
cluster = 5;
matrix = nan(15, length(metric));     
for i = 1:length(metric)
    n_sa = load(sprintf('./SA_metrics/n_delta_OUT_%s', metric{i}));
    % rank by cluster
    r_sa = sortrows(n_sa,4);
    score = r_sa(:,5:end);
    metric1 = r_sa(r_sa(:,4)==cluster,:);
    sum_SA = nansum(metric1(:,5:end),1);
    for j = 1:15
        matrix(j,i) = (sum_SA(j) - min(sum_SA)) / (max(sum_SA) - min(sum_SA));
    end 
end

h5 = imagesc(matrix); hold on; 
caxis([0 1]);  colormap(brewermap([10],'*RdBu'));    
%ylabel(h, 'Normalized Sensitive Score', 'FontSize', label_size);
set(gca,'YDir','normal')


y=1:15; yticks(x); yticklabels({'fff', 'N_{bf}', 'K_{bf}', 'S_y', 'B', 'ψ_{sat}', 'k_{sat}', 'Ɵ_{sat}', 'N_{melt}', 'k_{acc}',...
    'p_{sno}', 'p_{lip}', 'f_{wet}', 'd_{max}', 'Ɵ_{ini}'});

xlabel('Metric Number', 'FontSize', label_size); 
ylabel('Parameters', 'FontSize', label_size); 
xticks(1:23);
title(sprintf('(e) Cluster %d-Great Plains', cluster), 'FontSize', title_size); 

for i = 0.5:1:23.5
    line([i, i], [0 25], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

for i = 0.5:1:23.5
   line([0,25], [i , i], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

set(gca,'FontSize',tick_size);



subplot(3,3,6)
cluster = 6;
matrix = nan(15, length(metric));     
for i = 1:length(metric)
    n_sa = load(sprintf('./SA_metrics/n_delta_OUT_%s', metric{i}));
    % rank by cluster
    r_sa = sortrows(n_sa,4);
    score = r_sa(:,5:end);
    metric1 = r_sa(r_sa(:,4)==cluster,:);
    sum_SA = nansum(metric1(:,5:end),1);
    for j = 1:15
        matrix(j,i) = (sum_SA(j) - min(sum_SA)) / (max(sum_SA) - min(sum_SA));
    end 
end

h6 = imagesc(matrix); hold on; 
caxis([0 1]);  colormap(brewermap([10],'*RdBu'));    
%ylabel(h, 'Normalized Sensitive Score', 'FontSize', label_size);
set(gca,'YDir','normal')


y=1:15; yticks(x); yticklabels({'fff', 'N_{bf}', 'K_{bf}', 'S_y', 'B', 'ψ_{sat}', 'k_{sat}', 'Ɵ_{sat}', 'N_{melt}', 'k_{acc}',...
    'p_{sno}', 'p_{lip}', 'f_{wet}', 'd_{max}', 'Ɵ_{ini}'});

xlabel('Metric Number', 'FontSize', label_size); 
ylabel('Parameters', 'FontSize', label_size); 
xticks(1:23);
title(sprintf('(f) Cluster %d-Great Lakes', cluster), 'FontSize', title_size); 

for i = 0.5:1:23.5
    line([i, i], [0 25], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

for i = 0.5:1:23.5
   line([0,25], [i , i], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

set(gca,'FontSize',tick_size);


subplot(3,3,7)
cluster = 7;
matrix = nan(15, length(metric));     
for i = 1:length(metric)
    n_sa = load(sprintf('./SA_metrics/n_delta_OUT_%s', metric{i}));
    % rank by cluster
    r_sa = sortrows(n_sa,4);
    score = r_sa(:,5:end);
    metric1 = r_sa(r_sa(:,4)==cluster,:);
    sum_SA = nansum(metric1(:,5:end),1);
    for j = 1:15
        matrix(j,i) = (sum_SA(j) - min(sum_SA)) / (max(sum_SA) - min(sum_SA));
    end 
end

h7 = imagesc(matrix); hold on; 
caxis([0 1]);  colormap(brewermap([10],'*RdBu'));    
%ylabel(h, 'Normalized Sensitive Score', 'FontSize', label_size);
set(gca,'YDir','normal')


y=1:15; yticks(x); yticklabels({'fff', 'N_{bf}', 'K_{bf}', 'S_y', 'B', 'ψ_{sat}', 'k_{sat}', 'Ɵ_{sat}', 'N_{melt}', 'k_{acc}',...
    'p_{sno}', 'p_{lip}', 'f_{wet}', 'd_{max}', 'Ɵ_{ini}'});

xlabel('Metric Number', 'FontSize', label_size); 
ylabel('Parameters', 'FontSize', label_size); 
xticks(1:23);
title(sprintf('(g) Cluster %d-Southeast', cluster), 'FontSize', title_size); 

for i = 0.5:1:23.5
    line([i, i], [0 25], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

for i = 0.5:1:23.5
   line([0,25], [i , i], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

set(gca,'FontSize',tick_size);
c=colorbar; 
colorbar('FontSize',colorbar_size)