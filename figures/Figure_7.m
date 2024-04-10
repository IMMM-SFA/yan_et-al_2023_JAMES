%% load all data

clear all; clc;
scatter_size = 40; label_size = 16; legend_size = 14; tick_size = 14; colorbar_size= 14;title_size = 14;

n_sa = load('./SA_metrics/n_delta_OUT_M_RMSE');

% rank by cluster
r_sa = sortrows(n_sa,4);

score = r_sa(:,5:end);

% find a threshold
% score(score(:)<0.4)=0;
% score(score(:)>=0.4)=1;

imagesc(score ); hold on; 
c = colorbar; caxis([0 1]);  colormap(brewermap([10],'*RdBu'));    
c.FontSize = colorbar_size;
ylabel(c, 'Normalized Sensitivity Score to Monthly RMSE', 'FontSize', label_size);
set(gca,'YDir','normal')
ylabel('Basins in Cluster', 'FontSize', label_size); 
xlabel('Parameters', 'FontSize', label_size); 
xticks(1:15);

set(gca,'FontSize',tick_size);
x1=get(gca,'position');
x=get(c,'Position');
x(3)=0.02;
set(c,'Position',x)
set(gca,'position',x1)




set(gca,'color',[240 240 240]/255)


% title('Monthly RMSE', 'FontSize',title_size);



% plot the cluster horizational line
lines_num = nan(7,2);
for i = 1:7
    index = find(r_sa(:,4)==i);
    lines_num(i,1) = index(end);
    lines_num(i,2) = index(round(length(index)/2));
end


y=1:464; yticks(lines_num(:,2)); yticklabels({'1-Northeast', '2-Pacific', '3-AZ/NM', '4-Rockies', '5-Great Plains', '6-Great Lakes', '7-Southeast'});
ytickangle(0)
x=1:15; xticks(y); xticklabels({'fff', 'N_{bf}', 'K_{bf}', 'S_y', 'B', 'ψ_{sat}', 'k_{sat}', 'Ɵ_{sat}', 'N_{melt}', 'k_{acc}',...
    'p_{sno}', 'p_{lip}', 'f_{wet}', 'd_{max}', 'Ɵ_{ini}'});





for i = 0.5:1:15.5
    line([i, i], [0 464], 'color',[0 0 0]/255,  'Linewidth', line_width, 'LineStyle','-' ); hold on;  
end

for i = 1:6
   line([0,16],[lines_num(i,1), lines_num(i,1)], 'color',[255 255 0]/255,  'Linewidth',line_width+1 ); hold on;
end