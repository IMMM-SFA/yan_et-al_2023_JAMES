%% load all data

clear all; clc;
label_size = 12; line_width = 0.5; tick_size = 12; legend_size = 11;
title_size = 12; tick_size = 12; text_size = 12; scatter_size = 15; colorbar_size= 12;      
      

ax1 = subplot(2,2,1)
para = load('./parameter_ensemble_LHS1500');
succ_id = load('./sucessful_par_id');
para_ensemble = nan(1307, 15);
for i = 1:1307
    para_ensemble(i,:) = para(succ_id(i),:);
end


basin_id = 2011400;  % basin in VA (cluster 1)

n_sa = load('./SA_metrics/n_delta_OUT_daily_q0_10_volume_bias');
basin_sa = n_sa(n_sa(:,1)==basin_id,5:19);
para_id_1 = find(basin_sa>0.3);
para_id_1_score = basin_sa(para_id_1);

data = readtable('../1500Ensemble/flow_metrics/OUT_daily_q0_10_volume_bias.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));

threshold = 50;
index = abs(ensemble)<=threshold;
metric = ensemble(index);
max(metric)
min(metric)



h11=scatter(par1, par2, scatter_size-5,  ensemble, 'filled'); hold on;
colormap(ax1, brewermap([],'*Spectral'));   c1 = colorbar; 

h12=scatter(par1(abs(ensemble)<=threshold), par2(abs(ensemble)<=threshold), scatter_size-5,ensemble(abs(ensemble)<=threshold),...
     'MarkerEdgeColor',[0 0 0]/255,'LineWidth',line_width+1);  hold on;

 

xlabel(sprintf('fff (%4.2f)', para_id_1_score(1)), 'FontSize', label_size, 'Interpreter', 'none'); 
ylabel(sprintf('p_{lip} (%4.2f)', para_id_1_score(2)), 'FontSize', label_size); 
% zlabel(sprintf('frac_sat_soil_dsl_init (%4.2f)', para_id_1_score(3)), 'FontSize', label_size, 'Interpreter', 'none'); 
title('(a) Abs. Q0-10% Flow Volume Bias ≤ 50% (2% Total)', 'FontSize',title_size);

box on; grid on;

set(gca,'color',[240 240 240]/255)


ax2 = subplot(2,2,2)
basin_id = 2011400;  % basin in VA (cluster 1)

n_sa = load('./SA_metrics/n_delta_OUT_M_RMSE');
basin_sa = n_sa(n_sa(:,1)==basin_id,5:19);
para_id_1 = find(basin_sa>0.3);
para_id_1_score = basin_sa(para_id_1);

data = readtable('../1500Ensemble/flow_metrics/OUT_M_NSE.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));


threshold = 0.5;



index = ensemble>=threshold;
metric = ensemble(index);
max(metric)
min(metric)


h21=scatter(par1, par2, scatter_size-5,  ensemble, 'filled'); hold on;
colormap(ax2, brewermap([],'Spectral'));   c2 = colorbar; 

h22=scatter(par1((ensemble)>=threshold), par2((ensemble)>=threshold), scatter_size-5,ensemble((ensemble)>=threshold),...
    'MarkerEdgeColor',[0 0 0]/255,'LineWidth',line_width+1);  hold on;

xlabel(sprintf('fff (%4.2f)', para_id_1_score(1)), 'FontSize', label_size, 'Interpreter', 'none'); 
ylabel(sprintf('ψ_{sat} (%4.2f)', para_id_1_score(2)), 'FontSize', label_size); 
% zlabel(sprintf('frac_sat_soil_dsl_init (%4.2f)', para_id_1_score(3)), 'FontSize', label_size, 'Interpreter', 'none'); 
title('(b) Monthly Flow NSE ≥ 0.5 (2% Total)', 'FontSize',title_size);

box on; grid on;

set(gca,'color',[240 240 240]/255)



ax3 = subplot(2,2,3)
basin_id = 2011400;  % basin in VA (cluster 1)

n_sa = load('./SA_metrics/n_delta_OUT_D_KGE');
basin_sa = n_sa(n_sa(:,1)==basin_id,5:19);
para_id_1 = find(basin_sa>0.50);
para_id_1_score = basin_sa(para_id_1);

data = readtable('../1500Ensemble/flow_metrics/OUT_D_KGE.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));
par3 = para_ensemble(:,para_id_1(3));

threshold = 0.3;



index = ensemble>=threshold;
metric = ensemble(index);
max(metric)
min(metric)




scatter3(par1, par2, par3, scatter_size-5,  ensemble, 'o','filled'); hold on;
colormap(ax3, brewermap([],'Spectral'));   c2 = colorbar;  
caxis([-0.5,0.5]);

scatter3(par1(ensemble>=threshold), par2(ensemble>=threshold), par3(ensemble>=threshold), scatter_size-5,ensemble(ensemble>=threshold),...
    'o',  'MarkerEdgeColor',[0 0 0]/255,'LineWidth',line_width+1); hold on;
% view(-30,10)
box on;
ax = gca;
ax.BoxStyle = 'full';

xlabel(sprintf('fff (%4.2f)', para_id_1_score(1)), 'FontSize', label_size, 'Interpreter', 'none'); 
ylabel(sprintf('ψ_{sat} (%4.2f)', para_id_1_score(2)), 'FontSize', label_size); 
zlabel(sprintf('Ɵ_{sat} (%4.2f)', para_id_1_score(3)), 'FontSize', label_size); 

% zlabel(sprintf('frac_sat_soil_dsl_init (%4.2f)', para_id_1_score(3)), 'FontSize', label_size, 'Interpreter', 'none'); 
title('(c) Daily Flow KGE ≥ 0.3 (2% Total)', 'FontSize',title_size);

box on; grid on;

set(gca,'color',[240 240 240]/255)




ax4 = subplot(2,2,4)
basin_id = 2011400;  % basin in VA (cluster 1)

n_sa = load('./SA_metrics/n_delta_OUT_daily_volume_bias');
basin_sa = n_sa(n_sa(:,1)==basin_id,5:19);
para_id_1 = find(basin_sa>0.4);
para_id_1_score = basin_sa(para_id_1);

data = readtable('../1500Ensemble/flow_metrics/OUT_daily_volume_bias.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));
par3 = para_ensemble(:,para_id_1(3));

threshold = 10;



index = abs(ensemble)<=threshold;
metric = ensemble(index);
max(metric)
min(metric)


scatter3(par1, par2, par3, scatter_size-5,  ensemble, 'o','filled'); hold on;
colormap(ax4, brewermap([],'*Spectral'));  c2 = colorbar;


scatter3(par1(abs(ensemble)<=threshold), par2(abs(ensemble)<=threshold), par3(abs(ensemble)<=threshold), scatter_size-5,ensemble(abs(ensemble)<=threshold),...
     'MarkerEdgeColor',[0 0 0]/255,'LineWidth',line_width+1);  
% view(-30,10)
box on;
ax = gca;
ax.BoxStyle = 'full';

xlabel(sprintf('Ɵ_{sat} (%4.2f)', para_id_1_score(1)), 'FontSize', label_size); 
ylabel(sprintf('p_{lip} (%4.2f)', para_id_1_score(2)), 'FontSize', label_size); 
zlabel(sprintf('Ɵ_{ini} (%4.2f)', para_id_1_score(3)), 'FontSize', label_size); 

title('(d) Abs. Annual Flow Volume Bias ≤ 10% (28% Total)', 'FontSize',title_size);
set(gca,'color',[240 240 240]/255)
