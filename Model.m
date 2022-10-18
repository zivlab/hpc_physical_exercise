clear all
clc

rng(0);
number_of_iterations = 50;

mean_within_day_PV_corr_run_7_days = nan(number_of_iterations,7);
mean_within_day_PV_corr_sed_7_days = nan(number_of_iterations,7);
mean_within_day_PV_corr_run_8_days = nan(number_of_iterations,8);
mean_within_day_PV_corr_sed_8_days = nan(number_of_iterations,8);
mean_adjacent_days_similarity_run = nan(number_of_iterations,7);
mean_adjacent_days_similarity_sed = nan(number_of_iterations,7);
mean_elapsed_time_similarity_run = nan(number_of_iterations,7);
mean_elapsed_time_similarity_sed = nan(number_of_iterations,7);
std_within_day_PV_corr_run_8_days = nan(number_of_iterations,8);
std_within_day_PV_corr_sed_8_days = nan(number_of_iterations,8);
std_adjacent_days_similarity_run = nan(number_of_iterations,7);
std_adjacent_days_similarity_sed = nan(number_of_iterations,7);
std_elapsed_time_similarity_run = nan(number_of_iterations,7);
std_elapsed_time_similarity_sed = nan(number_of_iterations,7);

model_type = 1; % 1 - complete model, 2 - same drift constant for both groups
% 3 - same noise for both groups

for run_iteration = 1:number_of_iterations
    num_of_mice = 5;
    total_num_of_days = 8;
    days_vec = [1:total_num_of_days];
    num_of_trials = 5;
    
    % General tuning properties
    guass_sigma = 1;
    number_of_positions = 20;
    number_of_neurons = 400;
    field_profile = exp(-([-5:5].^2)/(2*guass_sigma^2));
    
    switch model_type
        case 1 % complete model
            % Noise properties
            A_run = 3.6; % A = Starting point
            A_sed = 4; % A = Starting point
            B_run = 0.06; % B = Decay time constant
            B_sed = 0.05; % B = Decay time constant
            C_run = 1.5; % C = Ending point
            C_sed = 2; % C = Ending point
            % Drift properties
            run_drift_constant = 1.2;
            sed_drift_constant = 0.9;
        case 2 % same drift constant for both groups
            % Noise properties
            A_run = 3.6; % A = Starting point
            A_sed = 4; % A = Starting point
            B_run = 0.06; % B = Decay time constant
            B_sed = 0.05; % B = Decay time constant
            C_run = 1.5; % C = Ending point
            C_sed = 2; % C = Ending point
            % Drift properties
            run_drift_constant = 1.2;
            sed_drift_constant = 1.2;
        case 3 % same noise for both groups
            % Noise properties
            A_run = 4; % A = Starting point
            A_sed = 4; % A = Starting point
            B_run = 0.05; % B = Decay time constant
            B_sed = 0.05; % B = Decay time constant
            C_run = 2; % C = Ending point
            C_sed = 2; % C = Ending point
            % Drift properties
            run_drift_constant = 1.2;
            sed_drift_constant = 0.9;
    end
    
    
    within_day_noise_level_run = (A_run - C_run) * exp(-B_run * days_vec) + C_run;
    within_day_noise_level_sed = (A_sed - C_sed) * exp(-B_sed * days_vec) + C_sed;
    
    % Drift properties
    within_day_drift_level_run = run_drift_constant * ones(1,total_num_of_days);
    within_day_drift_level_sed = sed_drift_constant * ones(1,total_num_of_days);
    
    %%
    
    spatial_tuning_mice_by_days_array_run = cell(num_of_mice,total_num_of_days);
    spatial_tuning_mice_by_days_array_sed = cell(num_of_mice,total_num_of_days);
    
    for run_group = 1:2
        switch run_group
            case 1
                within_day_noise_level = within_day_noise_level_run;
                within_day_drift_level = within_day_drift_level_run;
            case 2
                within_day_noise_level = within_day_noise_level_sed;
                within_day_drift_level = within_day_drift_level_sed;
        end
        for run_mice = 1:num_of_mice
            for run_days = days_vec
                if run_days==1
                    % Create mat of [neurons x position]
                    preffered_position_per_neuron = randi(number_of_positions,1,number_of_neurons);
                else
                    current_day_drift_level = within_day_drift_level(run_days);
                    place_displacement_relative_to_prvs_day_per_neuron = (2*randi(2,number_of_neurons,1)-3)'...
                        .* (poissrnd(current_day_drift_level,number_of_neurons,1))';
                    preffered_position_per_neuron = mod(preffered_position_per_neuron + ...
                        place_displacement_relative_to_prvs_day_per_neuron,number_of_positions);
                    preffered_position_per_neuron(preffered_position_per_neuron==0) = 20;
                end
                                
                current_day_tuning_cell_by_position_by_trial = nan(number_of_neurons,number_of_positions,num_of_trials);
                for run_trials = 1:num_of_trials
                    current_day_noise_level = within_day_noise_level(run_days);
                    within_day_place_displacement_per_neuron = (2*randi(2,number_of_neurons,1)-3)'...
                        .* (poissrnd(current_day_noise_level,number_of_neurons,1))';
                    % Alternative way to do it:
                    % within_day_place_displacement_per_neuron = round(current_day_noise_level*randn(number_of_neurons,1));
                    preffered_position_per_neuron_noised = mod(preffered_position_per_neuron + ...
                        within_day_place_displacement_per_neuron,number_of_positions);
                    preffered_position_per_neuron_noised(preffered_position_per_neuron_noised==0) = 20;
                    
                    % Define tuning per neuron:
                    ind_preffered_position_per_neuron = sub2ind([number_of_neurons,number_of_positions],[1:number_of_neurons],...
                        preffered_position_per_neuron_noised);
                    
                    activity_neuron_by_position_mat_temp = zeros(number_of_neurons,number_of_positions);
                    activity_neuron_by_position_mat_temp(ind_preffered_position_per_neuron) = 1;
                    activity_neuron_by_position_mat = conv2(activity_neuron_by_position_mat_temp,field_profile,'same');
                    
                    current_day_tuning_cell_by_position_by_trial(:,:,run_trials) = activity_neuron_by_position_mat;
                end
                
                switch run_group
                    case 1
                        spatial_tuning_mice_by_days_array_run{run_mice,run_days} = current_day_tuning_cell_by_position_by_trial;
                    case 2
                        spatial_tuning_mice_by_days_array_sed{run_mice,run_days} = current_day_tuning_cell_by_position_by_trial;
                end
            end
        end
    end
    
    %%
    
    spatial_tuning_mice_by_days_session_level_array_run = cell(num_of_mice,total_num_of_days);
    spatial_tuning_mice_by_days_session_level_array_sed = cell(num_of_mice,total_num_of_days);
    within_day_PV_corr_mat_run = nan(num_of_mice,total_num_of_days);
    within_day_PV_corr_mat_sed = nan(num_of_mice,total_num_of_days);
    
    for run_group = 1:2
        for run_mice = 1:num_of_mice
            for run_days = days_vec
                switch run_group
                    case 1
                        spatial_tuning_mice_by_days_array = spatial_tuning_mice_by_days_array_run;
                        spatial_tuning_mice_by_days_session_level_array_run{run_mice,run_days} = ...
                            sum(spatial_tuning_mice_by_days_array_run{run_mice,run_days},3);
                    case 2
                        spatial_tuning_mice_by_days_array = spatial_tuning_mice_by_days_array_sed;
                        spatial_tuning_mice_by_days_session_level_array_sed{run_mice,run_days} = ...
                            sum(spatial_tuning_mice_by_days_array_sed{run_mice,run_days},3);
                end
            end
        end
    end
    
    for run_group = 1:2
        for run_mice = 1:num_of_mice
            for run_days = days_vec
                switch run_group
                    case 1
                        spatial_tuning_session_level_current_day = ...
                            spatial_tuning_mice_by_days_session_level_array_run{run_mice,run_days};
                        spatial_tuning_current_day = ...
                            spatial_tuning_mice_by_days_array_run{run_mice,run_days};
                    case 2
                        spatial_tuning_session_level_current_day = ...
                            spatial_tuning_mice_by_days_session_level_array_sed{run_mice,run_days};
                        spatial_tuning_current_day = ...
                            spatial_tuning_mice_by_days_array_sed{run_mice,run_days};
                end
                
                current_day_PV_corr_vec = nan(1,num_of_trials);
                for run_trials = 1:num_of_trials
                    current_trial_spatial_tuning = spatial_tuning_current_day(:,:,run_trials);
                    spatial_tuning_without_current_trial = spatial_tuning_session_level_current_day ...
                        - current_trial_spatial_tuning;
                    correlation_matrix = corr(current_trial_spatial_tuning,spatial_tuning_without_current_trial);
                    current_trial_PV_correlation = mean(diag(correlation_matrix));
                    current_day_PV_corr_vec(run_trials) = current_trial_PV_correlation;
                end
                switch run_group
                    case 1
                        within_day_PV_corr_mat_run(run_mice,run_days) = mean(current_day_PV_corr_vec);
                    case 2
                        within_day_PV_corr_mat_sed(run_mice,run_days) = mean(current_day_PV_corr_vec);
                end
            end
        end
    end
    
    across_days_corr_mat_run = nan(total_num_of_days,total_num_of_days,num_of_mice);
    across_days_corr_mat_sed = nan(total_num_of_days,total_num_of_days,num_of_mice);
    
    for run_group = 1:2
        across_days_corr_mat = nan(total_num_of_days,total_num_of_days,num_of_mice);
        for run_mice = 1:num_of_mice
            for run_days1 = 1:total_num_of_days-1
                for run_days2 = run_days1+1:total_num_of_days
                    switch run_group
                        case 1
                            day1_spatial_tuning = spatial_tuning_mice_by_days_session_level_array_run{run_mice,run_days1};
                            day2_spatial_tuning = spatial_tuning_mice_by_days_session_level_array_run{run_mice,run_days2};
                        case 2
                            day1_spatial_tuning = spatial_tuning_mice_by_days_session_level_array_sed{run_mice,run_days1};
                            day2_spatial_tuning = spatial_tuning_mice_by_days_session_level_array_sed{run_mice,run_days2};
                    end
                    correlation_matrix_between_days = corr(day1_spatial_tuning,day2_spatial_tuning);
                    current_days_pair_PV_correlation = mean(diag(correlation_matrix_between_days));
                    across_days_corr_mat(run_days1,run_days2,run_mice) = current_days_pair_PV_correlation;
                end
            end
        end
        switch run_group
            case 1
                across_days_corr_mat_run = across_days_corr_mat;
            case 2
                across_days_corr_mat_sed = across_days_corr_mat;
        end
    end
            
    adjacent_days_similarity_run = nan(num_of_mice,total_num_of_days-1);
    adjacent_days_similarity_sed = nan(num_of_mice,total_num_of_days-1);
    
    for run_mice = 1:num_of_mice
        adjacent_days_similarity_run(run_mice,:) = diag(across_days_corr_mat_run(:,:,run_mice),1);
        adjacent_days_similarity_sed(run_mice,:) = diag(across_days_corr_mat_sed(:,:,run_mice),1);
    end
    
    elapsed_time_similarity_run = nan(run_mice,total_num_of_days-1);
    elapsed_time_similarity_sed = nan(run_mice,total_num_of_days-1);
    
    for run_mice = 1:num_of_mice
        for run_elapsed_days = 1:total_num_of_days-1
            elapsed_time_similarity_run(run_mice,run_elapsed_days) = mean(diag(across_days_corr_mat_run(:,:,run_mice),run_elapsed_days));
            elapsed_time_similarity_sed(run_mice,run_elapsed_days) = mean(diag(across_days_corr_mat_sed(:,:,run_mice),run_elapsed_days));
        end
    end
 
    mean_within_day_PV_corr_run_7_days(run_iteration,:) = (mean(within_day_PV_corr_mat_run(:,1:total_num_of_days-1))+mean(within_day_PV_corr_mat_run(:,2:total_num_of_days)))/2;
    mean_within_day_PV_corr_sed_7_days(run_iteration,:) = (mean(within_day_PV_corr_mat_sed(:,1:total_num_of_days-1))+mean(within_day_PV_corr_mat_sed(:,2:total_num_of_days)))/2;
    mean_within_day_PV_corr_run_8_days(run_iteration,:) = mean(within_day_PV_corr_mat_run(:,1:total_num_of_days));
    mean_within_day_PV_corr_sed_8_days(run_iteration,:) = mean(within_day_PV_corr_mat_sed(:,1:total_num_of_days));
    mean_adjacent_days_similarity_run(run_iteration,:) = mean(adjacent_days_similarity_run);
    mean_adjacent_days_similarity_sed(run_iteration,:) = mean(adjacent_days_similarity_sed);
    mean_elapsed_time_similarity_run(run_iteration,:) = mean(elapsed_time_similarity_run);
    mean_elapsed_time_similarity_sed(run_iteration,:) = mean(elapsed_time_similarity_sed);
    
    std_within_day_PV_corr_run_8_days(run_iteration,:) = std(within_day_PV_corr_mat_run(:,1:total_num_of_days));
    std_within_day_PV_corr_sed_8_days(run_iteration,:) = std(within_day_PV_corr_mat_sed(:,1:total_num_of_days));
    std_adjacent_days_similarity_run(run_iteration,:) = std(adjacent_days_similarity_run);
    std_adjacent_days_similarity_sed(run_iteration,:) = std(adjacent_days_similarity_sed);
    std_elapsed_time_similarity_run(run_iteration,:) = std(elapsed_time_similarity_run);
    std_elapsed_time_similarity_sed(run_iteration,:) = std(elapsed_time_similarity_sed);
    
end

funct_dots_x_all_mice = [];
funct_dots_y_all_mice = [];
stuck_dots_x_all_mice = [];
stuck_dots_y_all_mice = [];

for run_mice=1:50
    funct_dots_x{run_mice} = mean_within_day_PV_corr_run_7_days(run_mice,:);
    funct_dots_y{run_mice} = mean_adjacent_days_similarity_run(run_mice,:);
    stuck_dots_x{run_mice} = mean_within_day_PV_corr_sed_7_days(run_mice,:);
    stuck_dots_y{run_mice} = mean_adjacent_days_similarity_sed(run_mice,:);
    funct_dots_x_all_mice = [funct_dots_x_all_mice funct_dots_x{run_mice}];
    funct_dots_y_all_mice = [funct_dots_y_all_mice funct_dots_y{run_mice}];
    stuck_dots_x_all_mice = [stuck_dots_x_all_mice stuck_dots_x{run_mice}];
    stuck_dots_y_all_mice = [stuck_dots_y_all_mice stuck_dots_y{run_mice}];
end

funct_dots_x_all_mice_nan_corrected = funct_dots_x_all_mice(~isnan(funct_dots_y_all_mice));
funct_dots_y_all_mice_nan_corrected = funct_dots_y_all_mice(~isnan(funct_dots_y_all_mice));
stuck_dots_x_all_mice_nan_corrected = stuck_dots_x_all_mice(~isnan(stuck_dots_y_all_mice));
stuck_dots_y_all_mice_nan_corrected = stuck_dots_y_all_mice(~isnan(stuck_dots_y_all_mice));

x_funct=[funct_dots_x_all_mice_nan_corrected' ones(size(funct_dots_x_all_mice_nan_corrected'))];
y_funct=funct_dots_y_all_mice_nan_corrected';

x_stuck=[stuck_dots_x_all_mice_nan_corrected' ones(size(stuck_dots_x_all_mice_nan_corrected'))];
y_stuck=stuck_dots_y_all_mice_nan_corrected';

c_funct=x_funct\y_funct;
c_stuck=x_stuck\y_stuck;


x_all=[[funct_dots_x_all_mice_nan_corrected'; stuck_dots_x_all_mice_nan_corrected'] ...
    [ones(size(funct_dots_x_all_mice_nan_corrected')); zeros(size(stuck_dots_x_all_mice_nan_corrected'))] ...
    [zeros(size(funct_dots_x_all_mice_nan_corrected')); ones(size(stuck_dots_x_all_mice_nan_corrected'))]];
y_all=[funct_dots_y_all_mice_nan_corrected'; stuck_dots_y_all_mice_nan_corrected'];

c_all=x_all\y_all;

perpendicular_to_slope = [-c_all(1) 1]'/sqrt(c_all(1)^2+1^2) ;
projection_on_perpendicular_funct = [funct_dots_x_all_mice' funct_dots_y_all_mice'] * perpendicular_to_slope;
projection_on_perpendicular_stuck = [stuck_dots_x_all_mice' stuck_dots_y_all_mice'] * perpendicular_to_slope;

spatial_info_per_cell_mice_by_day_array_run = cell(num_of_mice,total_num_of_days);
spatial_info_per_cell_mice_by_day_array_sed = cell(num_of_mice,total_num_of_days);
mean_spatial_info_mice_by_day_run = nan(num_of_mice,total_num_of_days);
mean_spatial_info_mice_by_day_sed = nan(num_of_mice,total_num_of_days);

for group_type=1:2
    switch group_type
        case 1
            spatial_tuning_mice_by_days_session_level_array_current = spatial_tuning_mice_by_days_session_level_array_run;
        case 2
            spatial_tuning_mice_by_days_session_level_array_current = spatial_tuning_mice_by_days_session_level_array_sed;
    end
    for run_mice=1:num_of_mice
        for run_day = 1: total_num_of_days
            spatial_tuning_current_day = spatial_tuning_mice_by_days_session_level_array_current{run_mice,run_day};
            spatial_tuning_current_day = spatial_tuning_current_day + 0.00001;
            spatial_tuning_current_day_normed = spatial_tuning_current_day./mean(spatial_tuning_current_day,2);
            spatial_info_current_day = mean(spatial_tuning_current_day_normed .* log2(spatial_tuning_current_day_normed),2);
            switch group_type
                case 1
                    spatial_info_per_cell_mice_by_day_array_run{run_mice,run_day} = spatial_info_current_day;
                    mean_spatial_info_mice_by_day_run(run_mice,run_day) = mean(spatial_info_current_day);
                case 2
                    spatial_info_per_cell_mice_by_day_array_sed{run_mice,run_day} = spatial_info_current_day;
                    mean_spatial_info_mice_by_day_sed(run_mice,run_day) = mean(spatial_info_current_day);
            end
        end
    end
end

figure
hold on
errorbar(days_vec,mean(mean_spatial_info_mice_by_day_run),std(mean_spatial_info_mice_by_day_run)/sqrt(num_of_mice),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(days_vec,mean(mean_spatial_info_mice_by_day_sed),std(mean_spatial_info_mice_by_day_sed)/sqrt(num_of_mice),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r','capsize',12);
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylabel({'Information'},'FontName', 'Arial', 'FontSize', 48);
legend('Run','Sed','FontName', 'Arial','FontSize', 28,'Location','northwest','box','off');
axis square
switch model_type
    case 1
        %         ylim([0.1 0.23])
    case 2
        %         ylim([0.11 0.23])
    case 3
        %         ylim([0.11 0.175])
end

figure
hold on
errorbar([1:total_num_of_days-1],mean(mean_adjacent_days_similarity_run),mean(std_adjacent_days_similarity_run)/sqrt(num_of_mice),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:total_num_of_days-1],mean(mean_adjacent_days_similarity_sed),mean(std_adjacent_days_similarity_sed)/sqrt(num_of_mice),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r','capsize',12);
xlim([0.8 7.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
xticks([1 2 3 4 5 6 7]);
xticklabels({'1-4','4-7','7-10','10-13','13-16','16-19','19-22'});
xtickangle(45)
ylabel({'Adjacent days'; 'similarity'},'FontName', 'Arial', 'FontSize', 48);
legend('Run','Sed','FontName', 'Arial','FontSize', 28,'Location','northwest','box','off');
axis square
switch model_type
    case 1
        ylim([0.2 0.37])
    case 2
        ylim([0.175 0.37])
    case 3
        ylim([0.175 0.3])
end

figure
hold on
errorbar([1:total_num_of_days-1],mean(mean_elapsed_time_similarity_run),mean(std_elapsed_time_similarity_run)/sqrt(num_of_mice),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:total_num_of_days-1],mean(mean_elapsed_time_similarity_sed),mean(std_elapsed_time_similarity_sed)/sqrt(num_of_mice),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r','capsize',12);
xlim([0.8 7.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Elapsed time (days)','FontName', 'Arial', 'FontSize', 48);
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylabel({'Elapsed days'; 'similarity'},'FontName', 'Arial', 'FontSize', 48);
legend('Run','Sed','FontName', 'Arial','FontSize', 28,'Location','northeast','box','off');
axis square
switch model_type
    case 1
        ylim([0.09 0.31])
    case 2
        ylim([0.05 0.31])
    case 3
        ylim([0.05 0.26])
end

mean_spatial_info_mice_by_day_run_7_days = (mean_spatial_info_mice_by_day_run(:,1:end-1) + mean_spatial_info_mice_by_day_run(:,2:end))/2;
mean_spatial_info_mice_by_day_sed_7_days = (mean_spatial_info_mice_by_day_sed(:,1:end-1) + mean_spatial_info_mice_by_day_sed(:,2:end))/2;

figure
hold on
plot(mean(mean_spatial_info_mice_by_day_run_7_days),mean(mean_adjacent_days_similarity_run),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b');
plot(mean(mean_spatial_info_mice_by_day_sed_7_days),mean(mean_adjacent_days_similarity_sed),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r');
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel({'Information'},'FontName', 'Arial', 'FontSize', 48);
ylabel({'Adjacent days'; 'similarity'},'FontName', 'Arial', 'FontSize', 48);
legend('Run','Sed','FontName', 'Arial','FontSize', 28,'Location','northwest','box','off');
axis square
switch model_type
    case 1
        ylim([0.20 0.355])
        xlim([0.925 1.1])
    case 2
        ylim([0.18 0.355])
    case 3
        ylim([0.185 0.29])
        xlim([0.935 1.005])
end