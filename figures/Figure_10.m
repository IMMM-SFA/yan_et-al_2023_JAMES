%% load all data

clear all; clc;
label_size = 8; line_width = 0.5; tick_size = 8; legend_size = 8;
title_size = 8; tick_size = 8; text_size = 8; scatter_size = 15; colorbar_size= 8;      
 
para = load('./parameter_ensemble_LHS1500');
succ_id = load('./sucessful_par_id');
para_ensemble = nan(1307, 15);
for i = 1:1307
    para_ensemble(i,:) = para(succ_id(i),:);
end


basin_id = 2011400;  % basin in VA (cluster 1)


subplot(4, 4,1)
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

quantile95 = 50;

index = abs(ensemble)<=quantile95;
metric = ensemble(index);
max(metric)
min(metric)

SixMPG = ensemble;
pdSix = fitdist(SixMPG','Kernel','Width',3);
x = min(SixMPG)-20:0.01:max(SixMPG)+20;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h1 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h1, .5); hold on;
xlim([-120,0]);

SixMPG = metric;
pdSix = fitdist(SixMPG','Kernel','Width',3);
x = min(SixMPG)-20:0.01:max(SixMPG)+20;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;
xlim([-120,0]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Bias (%)', 'FontSize', label_size);
title('(a) Abs. Q0-10% Flow Volume Bias ≤ 50%', 'FontSize', label_size);
l = legend('Prior', 'Behavioral');
set(l,'FontSize',legend_size, 'Location','northeast','Orientation','vertical'); 
legend boxoff; 





subplot(4, 4,2)
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

quantile95 = 0.5;

index = ensemble>=quantile95;
metric = ensemble(index);

SixMPG = ensemble;
pdSix = fitdist(SixMPG','Kernel','Width',0.05);
x = min(SixMPG)-20:0.01:max(SixMPG)+20;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h1 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h1, .5); hold on;
xlim([-1, 1]);

SixMPG = metric;
pdSix = fitdist(SixMPG','Kernel','Width',0.02);
x = min(SixMPG)-20:0.01:max(SixMPG)+20;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;
xlim([-1, 1]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('NSE', 'FontSize', label_size);
title('(b) Monthly Flow NSE ≥ 0.5', 'FontSize', label_size);



subplot(4,4,3)

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

quantile95 = 0.3;

index = ensemble>=quantile95;
metric = ensemble(index);

SixMPG = ensemble;
pdSix = fitdist(SixMPG','Kernel','Width',0.05);
x = min(SixMPG)-10:0.1:max(SixMPG)+10;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h1 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h1, .5); hold on;
xlim([-1, 1]);

SixMPG = metric;
pdSix = fitdist(SixMPG','Kernel','Width',0.01);
x = min(SixMPG)-10:0.1:max(SixMPG)+10;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;
xlim([-1, 1]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('KGE', 'FontSize', label_size);
title('(c) Daily Flow KGE ≥ 0.3', 'FontSize', label_size);


subplot(4,4,4)
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

quantile95 = 10;

index = abs(ensemble)<=quantile95;
metric = ensemble(index);

SixMPG = ensemble;
pdSix = fitdist(SixMPG','Kernel','Width',3);
x = min(SixMPG)-10:0.1:max(SixMPG)+10;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h1 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h1, .5); hold on;
xlim([-60, 30]);

SixMPG = metric;
pdSix = fitdist(SixMPG','Kernel','Width',2);
x = min(SixMPG)-20:0.1:max(SixMPG)+20;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;
xlim([-60, 30]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Bias (%)', 'FontSize', label_size);
title('(d) Abs. Annual Flow Volume Bias ≤ 10%', 'FontSize', label_size);


subplot(4,4,5)
prior = load('parameter_ensemble_LHS1500');
prior = prior(:,12);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);

data = readtable('../1500Ensemble/flow_metrics/OUT_daily_q0_10_volume_bias.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));

quantile95 = 50;

index = abs(ensemble)<=quantile95;
post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.1);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.05);
x = min(SixMPG)-1:0.1:max(SixMPG)+2;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;


xlim([0, 2]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(e) P_{lip} (1.00)', 'FontSize', label_size);
% ylim([0, 1.5]);

subplot(4,4,6)
prior = load('parameter_ensemble_LHS1500');
prior = prior(:,1);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);

data = readtable('../1500Ensemble/flow_metrics/OUT_M_NSE.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));

quantile95 = 0.5;

index = ensemble>=quantile95;

post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.1);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.2);
x = min(SixMPG)-1:0.1:max(SixMPG)+2;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;


xlim([0, 5]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(f) fff (1.00)', 'FontSize', label_size);
ylim([0,0.8]);

subplot(4,4,7)
prior = load('parameter_ensemble_LHS1500');
prior = prior(:,8);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);

data = readtable('../1500Ensemble/flow_metrics/OUT_D_KGE.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));
par3 = para_ensemble(:,para_id_1(3));

quantile95 = 0.3;

index = ensemble>=quantile95;

post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.01);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.01);
x = min(SixMPG)-1:0.1:max(SixMPG)+2;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;


xlim([0.8, 1.2]);
% ylim([0, 1]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(g) Ɵ_{sat} (1.00)', 'FontSize', label_size);



subplot(4,4,8)
prior = load('parameter_ensemble_LHS1500');
prior = prior(:,12);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);
data = readtable('../1500Ensemble/flow_metrics/OUT_daily_volume_bias.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));
par3 = para_ensemble(:,para_id_1(3));

quantile95 = 10;

index = abs(ensemble)<=quantile95;

post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.1);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.1);
x = min(SixMPG)-1:0.1:max(SixMPG)+2;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;


xlim([0, 2]);
% ylim([0, 1]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(h) P_{lip} (1.00)', 'FontSize', label_size);



subplot(4,4,9)
prior = load('parameter_ensemble_LHS1500');
prior = prior(:,1);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);

data = readtable('../1500Ensemble/flow_metrics/OUT_daily_q0_10_volume_bias.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));

quantile95 = 50;

index = abs(ensemble)<=quantile95;
post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.1);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.2);
x = min(SixMPG)-1:0.1:max(SixMPG)+5;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;


xlim([0, 5]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(i) fff (0.57)', 'FontSize', label_size);
% ylim([0, 0.8]);




subplot(4,4,10)
prior = load('parameter_ensemble_LHS1500');
prior = prior(:,6);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);

data = readtable('../1500Ensemble/flow_metrics/OUT_M_NSE.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));

quantile95 = 0.5;

index = ensemble>=quantile95;

post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.1);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.4);
x = min(SixMPG)-1:0.1:max(SixMPG)+2;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

xlim([0, 5]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(j) ψ_{sat} (0.54)', 'FontSize', label_size);



subplot(4,4,11)
prior = load('parameter_ensemble_LHS1500');
prior = prior(:,1);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);

data = readtable('../1500Ensemble/flow_metrics/OUT_D_KGE.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));
par3 = para_ensemble(:,para_id_1(3));

quantile95 = 0.3;

index = ensemble>=quantile95;

post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.1);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.3);
x = min(SixMPG)-1:0.1:max(SixMPG)+2;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

xlim([0, 5]);
% ylim([0, 1]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(k) fff (0.83)', 'FontSize', label_size);



subplot(4,4,12)
prior = load('parameter_ensemble_LHS1500');
prior = prior(:,8);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);
data = readtable('../1500Ensemble/flow_metrics/OUT_daily_volume_bias.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));
par3 = para_ensemble(:,para_id_1(3));

quantile95 = 10;

index = abs(ensemble)<=quantile95;

post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.01);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.02);
x = min(SixMPG)-1:0.1:max(SixMPG)+2;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;


xlim([0.8, 1.2]);
% ylim([0, 1]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(l) Ɵ_{sat} (0.62)', 'FontSize', label_size);


% subplot(4,4,13)
% 
% subplot(4,4,13)




subplot(4,4,15)

prior = load('parameter_ensemble_LHS1500');
prior = prior(:,6);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);

data = readtable('../1500Ensemble/flow_metrics/OUT_D_KGE.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));
par3 = para_ensemble(:,para_id_1(3));

quantile95 = 0.3;

index = ensemble>=quantile95;

post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.1);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.3);
x = min(SixMPG)-1:0.1:max(SixMPG)+2;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

xlim([0, 5]);
% ylim([0, 1]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(m) ψ_{sat} (0.51)', 'FontSize', label_size);





subplot(4,4,16)
prior = load('parameter_ensemble_LHS1500');
prior = prior(:,15);
prior1 = prior;

succ_id = load('../gen_ensemble_par_LHS/sucessful_par_id');
prior = prior(succ_id);
data = readtable('../1500Ensemble/flow_metrics/OUT_daily_volume_bias.csv');
lat = data.Var2; lon = data.Var3; cluster = data.Var4; basin_ID = data.Var1;
ensemble = data{:,5:end};
ensemble(ensemble(:)==-9999) = nan;
ensemble = ensemble(basin_ID==basin_id,:);

par1 = para_ensemble(:,para_id_1(1));
par2 = para_ensemble(:,para_id_1(2));
par3 = para_ensemble(:,para_id_1(3));

quantile95 = 10;

index = abs(ensemble)<=quantile95;

post = prior(index);

SixMPG = prior1;
pdSix = fitdist(SixMPG,'Kernel','Width',0.01);
x = min(SixMPG)-1:0.1:max(SixMPG)+1;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [255, 127, 80]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;

SixMPG = post;
pdSix = fitdist(SixMPG,'Kernel','Width',0.06);
x = min(SixMPG)-1:0.1:max(SixMPG)+2;  % must be 1xN
ySix = pdf(pdSix,x);
curve_high = ySix; % must be 1xN
curve_low  = zeros(1, length(curve_high));
x2 = [x, fliplr(x)]; 
inBetween = [curve_low , fliplr(curve_high)];  hold on; % must be 1x
c = [100 149 237]/255;
h2 = fill(x2, inBetween, c, 'LineStyle','none'); alpha(h2, .5); hold on;


xlim([0.5, 1]);
% ylim([0, 1]);
box on; grid on;
set(gca,'color',[240 240 240]/255)
ylabel('Density', 'FontSize', label_size);
xlabel('Parameter Value', 'FontSize', label_size);
title('(n) Ɵ_{ini} (0.48)', 'FontSize', label_size);