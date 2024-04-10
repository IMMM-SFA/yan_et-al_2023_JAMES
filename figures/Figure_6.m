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


basin_id = 3504000;
data_M = load(sprintf('./default_flow/%08d_monthly', basin_id));

quantiles = [1, 5, 10, 25, 50, 75, 90, 95, 99]/100; num_quantile = length(quantiles);

mean_m_flow = nan(7, num_quantile, 4); % 1-obs, 2-default, 3-ensemble min, 4-ensemble max
mean_m_flow_NSE = nan(7, num_quantile, 2); %1-ensemble min, 2-ensemble max
mean_m_flow_AB = nan(7, num_quantile, 2); %1-ensemble min, 2-ensemble max
mean_m_flow_AB_NSE = nan(7, num_quantile, 2); %1-ensemble min, 2-ensemble max

index_NSE = nan(7, 1307);  
index_AB = nan(7, 1307);
index_NSE_AB = nan(7, 1307);

index_NSE(:,:) = m_flow_metric_NSE(:, 2:end)>=0.5;
index_AB(:,:)  = abs(m_flow_metric_AB(:, 2:end))<=10;
index_NSE_AB(:,:) = m_flow_metric_NSE(:, 2:end)>=0.5 & abs(m_flow_metric_AB(:, 2:end))<=10;
 

quantiles = [1, 5, 10, 25, 50, 75, 90, 95, 99]/100; num_quantile = length(quantiles);
mean_m_flow = nan(7, num_quantile, 4);% 0-obs, 1-default, 3-ensemble min, 4-ensemble max

for i = 1:num_quantile
    
    cluster=1;
    mean_m_flow(cluster,i,1)=quantile(r_c1_m(:,1), quantiles(i)); mean_m_flow(cluster,i,2)=quantile(r_c1_m(:,2), quantiles(i)); 
    mean_m_flow(cluster,i,3) = min(quantile(r_c1_m(:,3:end), quantiles(i))); mean_m_flow(cluster,i,4) = max(quantile(r_c1_m(:,3:end), quantiles(i))); 
    
    temp = r_c1_m(:, 3:end); index = index_NSE(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_NSE(cluster,i,1) = nan; mean_m_flow_NSE(cluster,i,2) = nan;
    end
 
    temp = r_c1_m(:, 3:end); index = index_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB(cluster,i,1) = nan; mean_m_flow_AB(cluster,i,2) = nan;
    end   
    
    temp = r_c1_m(:, 3:end); index = index_NSE_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB_NSE(cluster,i,1) = nan; mean_m_flow_AB_NSE(cluster,i,2) = nan;
    end   
    
   
    
    cluster=2;
    mean_m_flow(cluster,i,1)=quantile(r_c2_m(:,1), quantiles(i)); mean_m_flow(cluster,i,2)=quantile(r_c2_m(:,2), quantiles(i)); 
    mean_m_flow(cluster,i,3) = min(quantile(r_c2_m(:,3:end), quantiles(i))); mean_m_flow(cluster,i,4) = max(quantile(r_c2_m(:,3:end), quantiles(i))); 

    
     temp = r_c2_m(:, 3:end); index = index_NSE(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_NSE(cluster,i,1) = nan; mean_m_flow_NSE(cluster,i,2) = nan;
    end
 
    temp = r_c2_m(:, 3:end); index = index_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB(cluster,i,1) = nan; mean_m_flow_AB(cluster,i,2) = nan;
    end   
    
    temp = r_c2_m(:, 3:end); index = index_NSE_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB_NSE(cluster,i,1) = nan; mean_m_flow_AB_NSE(cluster,i,2) = nan;
    end      
    
    
    
    
    
    cluster=3;
    mean_m_flow(cluster,i,1)=quantile(r_c3_m(:,1), quantiles(i)); mean_m_flow(cluster,i,2)=quantile(r_c3_m(:,2), quantiles(i)); 
    mean_m_flow(cluster,i,3) = min(quantile(r_c3_m(:,3:end), quantiles(i))); mean_m_flow(cluster,i,4) = max(quantile(r_c3_m(:,3:end), quantiles(i)));     
 
    temp = r_c3_m(:, 3:end); index = index_NSE(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_NSE(cluster,i,1) = nan; mean_m_flow_NSE(cluster,i,2) = nan;
    end
 
    temp = r_c3_m(:, 3:end); index = index_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB(cluster,i,1) = nan; mean_m_flow_AB(cluster,i,2) = nan;
    end   
    
    temp = r_c3_m(:, 3:end); index = index_NSE_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB_NSE(cluster,i,1) = nan; mean_m_flow_AB_NSE(cluster,i,2) = nan;
    end       
    
    
    
    
    
    
    cluster=4;
    mean_m_flow(cluster,i,1)=quantile(r_c4_m(:,1), quantiles(i)); mean_m_flow(cluster,i,2)=quantile(r_c4_m(:,2), quantiles(i)); 
    mean_m_flow(cluster,i,3) = min(quantile(r_c4_m(:,3:end), quantiles(i))); mean_m_flow(cluster,i,4) = max(quantile(r_c4_m(:,3:end), quantiles(i)));         
 
    temp = r_c4_m(:, 3:end); index = index_NSE(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_NSE(cluster,i,1) = nan; mean_m_flow_NSE(cluster,i,2) = nan;
    end
 
    temp = r_c4_m(:, 3:end); index = index_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB(cluster,i,1) = nan; mean_m_flow_AB(cluster,i,2) = nan;
    end   
    
    temp = r_c4_m(:, 3:end); index = index_NSE_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB_NSE(cluster,i,1) = nan; mean_m_flow_AB_NSE(cluster,i,2) = nan;
    end       
    

    
    cluster=5;
    mean_m_flow(cluster,i,1)=quantile(r_c5_m(:,1), quantiles(i)); mean_m_flow(cluster,i,2)=quantile(r_c5_m(:,2), quantiles(i)); 
    mean_m_flow(cluster,i,3) = min(quantile(r_c5_m(:,3:end), quantiles(i))); mean_m_flow(cluster,i,4) = max(quantile(r_c5_m(:,3:end), quantiles(i))); 
    
    temp = r_c5_m(:, 3:end); index = index_NSE(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_NSE(cluster,i,1) = nan; mean_m_flow_NSE(cluster,i,2) = nan;
    end
 
    temp = r_c5_m(:, 3:end); index = index_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB(cluster,i,1) = nan; mean_m_flow_AB(cluster,i,2) = nan;
    end   
    
    temp = r_c5_m(:, 3:end); index = index_NSE_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB_NSE(cluster,i,1) = nan; mean_m_flow_AB_NSE(cluster,i,2) = nan;
    end   
    
    
  
    
    
    cluster=6;
    mean_m_flow(cluster,i,1)=quantile(r_c6_m(:,1), quantiles(i)); mean_m_flow(cluster,i,2)=quantile(r_c6_m(:,2), quantiles(i)); 
    mean_m_flow(cluster,i,3) = min(quantile(r_c6_m(:,3:end), quantiles(i))); mean_m_flow(cluster,i,4) = max(quantile(r_c6_m(:,3:end), quantiles(i)));    

        temp = r_c6_m(:, 3:end); index = index_NSE(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_NSE(cluster,i,1) = nan; mean_m_flow_NSE(cluster,i,2) = nan;
    end
 
    temp = r_c6_m(:, 3:end); index = index_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB(cluster,i,1) = nan; mean_m_flow_AB(cluster,i,2) = nan;
    end   
    
    temp = r_c6_m(:, 3:end); index = index_NSE_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB_NSE(cluster,i,1) = nan; mean_m_flow_AB_NSE(cluster,i,2) = nan;
    end   
    
    
    
    cluster=7;
    mean_m_flow(cluster,i,1)=quantile(r_c7_m(:,1), quantiles(i)); mean_m_flow(cluster,i,2)=quantile(r_c7_m(:,2), quantiles(i)); 
    mean_m_flow(cluster,i,3) = min(quantile(r_c7_m(:,3:end), quantiles(i))); mean_m_flow(cluster,i,4) = max(quantile(r_c7_m(:,3:end), quantiles(i)));    

        temp = r_c7_m(:, 3:end); index = index_NSE(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_NSE(cluster,i,1) = nan; mean_m_flow_NSE(cluster,i,2) = nan;
    end
 
    temp = r_c7_m(:, 3:end); index = index_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB(cluster,i,1) = nan; mean_m_flow_AB(cluster,i,2) = nan;
    end   
    
    temp = r_c7_m(:, 3:end); index = index_NSE_AB(cluster,:); num = sum(index==1); temp1 = nan(120, num); count = 1;
    if num>0
        for j = 1:1307
            if index(j)==1
                temp1(:,count) = temp(:,j); count = count + 1;
            end
        end
        mean_m_flow_AB_NSE(cluster,i,1) = min(quantile(temp1, quantiles(i)));   
        mean_m_flow_AB_NSE(cluster,i,2) = max(quantile(temp1, quantiles(i)));
    else
        mean_m_flow_AB_NSE(cluster,i,1) = nan; mean_m_flow_AB_NSE(cluster,i,2) = nan;
    end   
end


marksize=3; linewidth=1;tick_size=7;label_size=7;title_size=7;legend_size=7;

subplot(2, 4, 1)
cluster=1;

clear temp; x=1:9;
temp(:,:) = mean_m_flow(cluster, :,:);
h1 = plot(x, temp(:,1), '-o','MarkerSize',marksize,'Color',[205 92 92]/255,'linewidth',linewidth,'MarkerFaceColor',[205 92 92]/255); hold on; 
h2 = plot(x, temp(:,2), '-o','MarkerSize',marksize,'Color',[100 149 237]/255,'linewidth',linewidth,'MarkerFaceColor',[100 149 237]/255); hold on;     
c = [0, 128, 0]/255;
ensemble_M_min = temp(:,3)';  % must be 1xN
ensemble_M_max = temp(:,4)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h3 = fill(x2, inBetween, c); alpha(h3, .2); hold on;
h3.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB(cluster, :, :);
c = [0, 0, 255]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h4 = fill(x2, inBetween, c); alpha(h4, .2); hold on;
h4.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB_NSE(cluster, :, :);
c = [255, 0, 0]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h5 = fill(x2, inBetween, c); alpha(h5, .2); hold on;
h5.EdgeColor = 'none';

set(gca, 'YScale', 'log')
ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);
title('Cluster 1-Northeast', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'0.01','0.05','0.10','0.25','0.50','0.75','0.90','0.95','0.99'})
xlabel('FDC Non-exceedance Probability', 'FontSize', label_size);
% grid on;
xlim([1, 9]);%ylim([10^-4, 10^2]);
set(gca,'FontSize',tick_size);
set(gca,'color',[240 240 240]/255)  
l = legend([h1, h2, h3, h4, h5], {'Obs.', 'Default Sim.', 'Prior Range', 'Behavioral Range: Abs. Annual Flow Bias≤10%', 'Behavioral Range: M-NSE≥0.5 and Abs. Annual Flow Bias≤10%'});
set(l,'FontSize',legend_size, 'Location','southeast','Orientation','vertical'); 
legend boxoff
% grid on;
box on;




subplot(2, 4, 2)
cluster=2;
clear temp; x=1:9;
temp(:,:) = mean_m_flow(cluster, :,:);
h1 = plot(x, temp(:,1), '-o','MarkerSize',marksize,'Color',[205 92 92]/255,'linewidth',linewidth,'MarkerFaceColor',[205 92 92]/255); hold on; 
h2 = plot(x, temp(:,2), '-o','MarkerSize',marksize,'Color',[100 149 237]/255,'linewidth',linewidth,'MarkerFaceColor',[100 149 237]/255); hold on;     

c = [0, 128, 0]/255;
ensemble_M_min = temp(:,3)';  % must be 1xN
ensemble_M_max = temp(:,4)';

x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];

h3 = fill(x2, inBetween, c); alpha(h3, .2); hold on;
h3.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB(cluster, :, :);
c = [0, 0, 255]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h4 = fill(x2, inBetween, c); alpha(h4, .2); hold on;
h4.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB_NSE(cluster, :, :);
c = [255, 0, 0]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h5 = fill(x2, inBetween, c); alpha(h5, .2); hold on;
h5.EdgeColor = 'none';

set(gca, 'YScale', 'log')
ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);
title('Cluster 2-Pacific', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'0.01','0.05','0.10','0.25','0.50','0.75','0.90','0.95','0.99'})
xlabel('FDC Non-exceedance Probability', 'FontSize', label_size);
grid on;
xlim([1, 9]);%ylim([10^-4, 10^2]);
set(gca,'FontSize',tick_size);
set(gca,'color',[240 240 240]/255)  


subplot(2, 4, 3)
cluster=3;
clear temp; x=1:9;
temp(:,:) = mean_m_flow(cluster, :,:);
h1 = plot(x, temp(:,1), '-o','MarkerSize',marksize,'Color',[205 92 92]/255,'linewidth',linewidth,'MarkerFaceColor',[205 92 92]/255); hold on; 
h2 = plot(x, temp(:,2), '-o','MarkerSize',marksize,'Color',[100 149 237]/255,'linewidth',linewidth,'MarkerFaceColor',[100 149 237]/255); hold on;     

c = [0, 128, 0]/255;
ensemble_M_min = temp(:,3)';  % must be 1xN
ensemble_M_max = temp(:,4)';

x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];

h3 = fill(x2, inBetween, c); alpha(h3, .2); hold on;
h3.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB(cluster, :, :);
c = [0, 0, 255]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h4 = fill(x2, inBetween, c); alpha(h4, .2); hold on;
h4.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB_NSE(cluster, :, :);
c = [255, 0, 0]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h5 = fill(x2, inBetween, c); alpha(h5, .2); hold on;
h5.EdgeColor = 'none';

set(gca, 'YScale', 'log')
ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);
title('Cluster 3-AZ/NM', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'0.01','0.05','0.10','0.25','0.50','0.75','0.90','0.95','0.99'})
xlabel('FDC Non-exceedance Probability', 'FontSize', label_size);
grid on;
xlim([1, 9]);%ylim([10^-4, 10^2]);
set(gca,'FontSize',tick_size);
set(gca,'color',[240 240 240]/255)  


subplot(2, 4, 4)
cluster=4;
clear temp; x=1:9;
temp(:,:) = mean_m_flow(cluster, :,:);
h1 = plot(x, temp(:,1), '-o','MarkerSize',marksize,'Color',[205 92 92]/255,'linewidth',linewidth,'MarkerFaceColor',[205 92 92]/255); hold on; 
h2 = plot(x, temp(:,2), '-o','MarkerSize',marksize,'Color',[100 149 237]/255,'linewidth',linewidth,'MarkerFaceColor',[100 149 237]/255); hold on;     

c = [0, 128, 0]/255;
ensemble_M_min = temp(:,3)';  % must be 1xN
ensemble_M_max = temp(:,4)';

x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];

h3 = fill(x2, inBetween, c); alpha(h3, .2); hold on;
h3.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB(cluster, :, :);
c = [0, 0, 255]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h4 = fill(x2, inBetween, c); alpha(h4, .2); hold on;
h4.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB_NSE(cluster, :, :);
c = [255, 0, 0]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h5 = fill(x2, inBetween, c); alpha(h5, .2); hold on;
h5.EdgeColor = 'none';

set(gca, 'YScale', 'log')
ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);
title('Cluster 4-Rockies', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'0.01','0.05','0.10','0.25','0.50','0.75','0.90','0.95','0.99'})
xlabel('FDC Non-exceedance Probability', 'FontSize', label_size);
grid on;
xlim([1, 9]);%ylim([10^-4, 10^2]);
set(gca,'FontSize',tick_size);
set(gca,'color',[240 240 240]/255)  



subplot(2, 4, 5)
cluster=5;
clear temp; x=1:9;
temp(:,:) = mean_m_flow(cluster, :,:);
h1 = plot(x, temp(:,1), '-o','MarkerSize',marksize,'Color',[205 92 92]/255,'linewidth',linewidth,'MarkerFaceColor',[205 92 92]/255); hold on; 
h2 = plot(x, temp(:,2), '-o','MarkerSize',marksize,'Color',[100 149 237]/255,'linewidth',linewidth,'MarkerFaceColor',[100 149 237]/255); hold on;     

c = [0, 128, 0]/255;
ensemble_M_min = temp(:,3)';  % must be 1xN
ensemble_M_max = temp(:,4)';

x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];

h3 = fill(x2, inBetween, c); alpha(h3, .2); hold on;
h3.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB(cluster, :, :);
c = [0, 0, 255]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h4 = fill(x2, inBetween, c); alpha(h4, .2); hold on;
h4.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB_NSE(cluster, :, :);
c = [255, 0, 0]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h5 = fill(x2, inBetween, c); alpha(h5, .2); hold on;
h5.EdgeColor = 'none';

set(gca, 'YScale', 'log')
ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);
title('Cluster 5-Great Plains', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'0.01','0.05','0.10','0.25','0.50','0.75','0.90','0.95','0.99'})
xlabel('FDC Non-exceedance Probability', 'FontSize', label_size);
grid on;
xlim([1, 9]);%ylim([10^-4, 10^2]);
set(gca,'FontSize',tick_size);
set(gca,'color',[240 240 240]/255)  


subplot(2, 4, 6)
cluster=6;
clear temp; x=1:9;
temp(:,:) = mean_m_flow(cluster, :,:);
h1 = plot(x, temp(:,1), '-o','MarkerSize',marksize,'Color',[205 92 92]/255,'linewidth',linewidth,'MarkerFaceColor',[205 92 92]/255); hold on; 
h2 = plot(x, temp(:,2), '-o','MarkerSize',marksize,'Color',[100 149 237]/255,'linewidth',linewidth,'MarkerFaceColor',[100 149 237]/255); hold on;     

c = [0, 128, 0]/255;
ensemble_M_min = temp(:,3)';  % must be 1xN
ensemble_M_max = temp(:,4)';

x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];

h3 = fill(x2, inBetween, c); alpha(h3, .2); hold on;
h3.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB(cluster, :, :);
c = [0, 0, 255]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h4 = fill(x2, inBetween, c); alpha(h4, .2); hold on;
h4.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB_NSE(cluster, :, :);
c = [255, 0, 0]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h5 = fill(x2, inBetween, c); alpha(h5, .2); hold on;
h5.EdgeColor = 'none';

set(gca, 'YScale', 'log')
ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);
title('Cluster 6-Great Lakes', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'0.01','0.05','0.10','0.25','0.50','0.75','0.90','0.95','0.99'})
xlabel('FDC Non-exceedance Probability', 'FontSize', label_size);
grid on;
xlim([1, 9]);%ylim([10^-4, 10^2]);
set(gca,'FontSize',tick_size);
set(gca,'color',[240 240 240]/255)  


subplot(2, 4, 7)
cluster=7;
clear temp; x=1:9;
temp(:,:) = mean_m_flow(cluster, :,:);
h1 = plot(x, temp(:,1), '-o','MarkerSize',marksize,'Color',[205 92 92]/255,'linewidth',linewidth,'MarkerFaceColor',[205 92 92]/255); hold on; 
h2 = plot(x, temp(:,2), '-o','MarkerSize',marksize,'Color',[100 149 237]/255,'linewidth',linewidth,'MarkerFaceColor',[100 149 237]/255); hold on;     

c = [0, 128, 0]/255;
ensemble_M_min = temp(:,3)';  % must be 1xN
ensemble_M_max = temp(:,4)';

x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];

h3 = fill(x2, inBetween, c); alpha(h3, .2); hold on;
h3.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB(cluster, :, :);
c = [0, 0, 255]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h4 = fill(x2, inBetween, c); alpha(h4, .2); hold on;
h4.EdgeColor = 'none';

clear temp; x=1:9;
temp(:,:) = mean_m_flow_AB_NSE(cluster, :, :);
c = [255, 0, 0]/255;
ensemble_M_min = temp(:,1)';  % must be 1xN
ensemble_M_max = temp(:,2)';
x2 = [x, fliplr(x)];
inBetween = [ensemble_M_min, fliplr(ensemble_M_max)];
h5 = fill(x2, inBetween, c); alpha(h5, .2); hold on;
h5.EdgeColor = 'none';

set(gca, 'YScale', 'log')
ylabel('Monthly Runoff (mm/day)', 'FontSize', label_size);
title('Cluster 7-Southeast', 'FontSize', title_size);
xticks([1 2 3 4 5 6 7 8 9])
xticklabels({'0.01','0.05','0.10','0.25','0.50','0.75','0.90','0.95','0.99'})
xlabel('FDC Non-exceedance Probability', 'FontSize', label_size);
grid on;
xlim([1, 9]);%ylim([10^-4, 10^2]);
set(gca,'FontSize',tick_size);
set(gca,'color',[240 240 240]/255)  
