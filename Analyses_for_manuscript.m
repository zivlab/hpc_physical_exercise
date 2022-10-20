%% BrdU

load('stuck_BrdU_count');
load('funct_BrdU_count');

stuck=stuck_BrdU_count;
funct=funct_BrdU_count;

x_of_groups = [1:2];
x_noise = 0.08;

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gca,'linewidth',4)

bar([0.8],[mean(stuck)],'FaceColor','b','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
bar([1.3],[mean(funct)],'FaceColor','r','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
errorbar(0.8,mean(stuck),std(stuck)/sqrt(5),'k','LineWidth',5,'capsize',10);
errorbar(1.3,mean(funct),std(funct)/sqrt(5),'k','LineWidth',5,'capsize',10);
plot(0.8+x_noise*randn(1,length(stuck)),stuck,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
plot(1.3+x_noise*randn(1,length(funct)),funct,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
xticks([0.8 1.3])
set(gca,'FontSize',18)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
set(axes1,'FontName','Arial','FontSize',48,'XTick',[0.8 1.3],'XTickLabel',...
    {'Sed','Run'});
xlim([0.4 1.7])
ylim([0 15])
axis square
ylabel({'BrdU+';'(# cells/DG slice)'},'FontName','Arial','FontSize',48);

%% DCX

load('stuck_DCX_density');
load('funct_DCX_density');
mean_stuck_mice=stuck_DCX_density;
mean_funct_mice=funct_DCX_density;

x_of_groups = [0.8:1.4];
x_noise = 0.08;

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gca,'linewidth',4)
bar([0.8],[mean(mean_stuck_mice)*100],'FaceColor','b','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
bar([1.3],[mean(mean_funct_mice)*100],'FaceColor','r','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
errorbar(0.8,mean(mean_stuck_mice)*100,std(mean_stuck_mice)*100/sqrt(5),'k','LineWidth',5,'capsize',10);
errorbar(1.3,mean(mean_funct_mice)*100,std(mean_funct_mice)*100/sqrt(5),'k','LineWidth',5,'capsize',10);
plot(0.8+x_noise*randn(1,length(mean_stuck_mice)),mean_stuck_mice*100,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
plot(1.3+x_noise*randn(1,length(mean_funct_mice)),mean_funct_mice*100,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
xticks([0.8 1.3])
set(gca,'FontSize',18)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
set(axes1,'FontName','Arial','FontSize',48,'XTick',[0.8 1.3],'XTickLabel',...
    {'Sed','Run'});
xlim([0.4 1.7])
axis square
ylabel({'DCX+';'(% pixels/DG)'},'FontName','Arial','FontSize',48);

%% Information per day

load('stuck_information_per_day');
load('funct_information_per_day');

stuck_SI=stuck_information_per_day;
funct_SI=funct_information_per_day;

figure
hold on
set(gca,'linewidth',4)
errorbar(1:8, mean(stuck_SI),std(stuck_SI)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:8, mean(funct_SI),std(funct_SI)/sqrt(5),...
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
ylabel({'Information'; '(bits/ca2+ event)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([0.8 1.4])


%% Activity rate

load('stuck_activity_rate_per_day');
load('fucnt_activity_rate_per_day');

stuck_firing_rate_Active_cells=stuck_activity_rate_per_day;
funct_firing_rate_Active_cells=fucnt_activity_rate_per_day;

figure
hold on
set(gca,'linewidth',4)
errorbar(1:8, mean(stuck_firing_rate_Active_cells),std(stuck_firing_rate_Active_cells)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:8, mean(funct_firing_rate_Active_cells),std(funct_firing_rate_Active_cells)/sqrt(5),...
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
ylabel({'Activity rate (Hz)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([0.02 0.032])

%% Activity rate per mouse

figure
hold on
set(gca,'linewidth',4)
for i=1:5
plot([1:8],stuck_firing_rate_Active_cells(i,:),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b');
plot([1:8],funct_firing_rate_Active_cells(i,:),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r');
end
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'Ca2+ Event'; 'rate (Hz)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([0.02 0.036])

%% Place cell percentage

load('stuck_PC_percentage');
load('funct_PC_percentage');

stuck_fraction_of_PCs=stuck_PC_percentage;
funct_fraction_of_PCs=funct_PC_percentage;


figure
hold on
set(gca,'linewidth',4)
errorbar(1:8, mean(stuck_fraction_of_PCs)*100,std(stuck_fraction_of_PCs)*100/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:8, mean(funct_fraction_of_PCs)*100,std(funct_fraction_of_PCs)*100/sqrt(5),...
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
ylabel({'Place cells (%)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});

%% Place cell percentage per mouse

figure
hold on
set(gca,'linewidth',4)
for i=1:5
plot([1:8],stuck_fraction_of_PCs(i,:),...
    '-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b');
plot([1:8],funct_fraction_of_PCs(i,:),...
    '-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r');
end
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'Place cells (%)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});


%% Absolute number of active cells per day

load('stuck_abs_number_of_active_cells');
load('funct_abs_number_of_active_cells');

stuck_num_of_active_cells=stuck_abs_number_of_active_cells;
funct_num_of_active_cells=funct_abs_number_of_active_cells;

figure
hold on
set(gca,'linewidth',4)

errorbar(1:8, mean(stuck_num_of_active_cells),std(stuck_num_of_active_cells)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:8, mean(funct_num_of_active_cells),std(funct_num_of_active_cells)/sqrt(5),...
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
ylabel({'Active cells (#)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([400 600])

%% Absolute number of active cells per mouse

figure
hold on
set(gca,'linewidth',4)
for i=1:5
plot([1:8],stuck_num_of_active_cells(i,:),...
    '-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b');
plot([1:8],funct_num_of_active_cells(i,:),...
    '-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r');
end
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'Active cells (#)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([350 700])

%% Fraction of active cells out of total number of cells

load('frac_active_cells_funct');
load('frac_active_cells_stuck');

figure
hold on
set(gca,'linewidth',4)

errorbar(1:8, mean(frac_active_cells_stuck),std(frac_active_cells_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:8, mean(frac_active_cells_funct),std(frac_active_cells_funct)/sqrt(5),...
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
ylabel({'Active' ;'cells (%)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim ([0 0.7])


%% Place cell width

load('mean_field_size_both_envs_stuck_in_cm');
load('mean_field_size_both_envs_funct_in_cm');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:8],mean(mean_field_size_both_envs_stuck_in_cm),std(mean_field_size_both_envs_stuck_in_cm)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:8],mean(mean_field_size_both_envs_funct_in_cm),std(mean_field_size_both_envs_funct_in_cm)/sqrt(5),...
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
ylabel({'Place field (cm)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([(2.8-1)*4 (3.4-1)*4])

%% Place field width per mouse

figure
hold on
set(gca,'linewidth',4)
for i=1:5
plot([1:8],mean_field_size_both_envs_stuck_in_cm(i,:),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b');
plot([1:8],mean_field_size_both_envs_funct_in_cm(i,:),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r');
end
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'Place field (cm)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([6.5 11])

%% Reliability

load('reliability_stuck');
load('reliability_funct');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:8], mean(reliability_stuck)*100, std(reliability_stuck)*100/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:8], mean(reliability_funct)*100, std(reliability_funct)*100/sqrt(5),...
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
ylabel({'Reliability'; '(% of passes)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([0 60])

%% Tuning curves of all place cells in each day according to preferred position in each day

load('stuck_tuning_cells_all_days_ordered_by_all_days');
load('funct_tuning_cells_all_days_ordered_by_all_days');

for group_type=1:2
    figure
    set(gcf,'DefaultAxesFontSize',10);
    set(gcf,'DefaultAxesFontName','arial');
    fig_size_y=23;
    fig_size_x=17;
    set(gcf,'PaperUnits','centimeters','PaperPosition',[5 2 fig_size_x fig_size_y]);
    set(gcf,'PaperOrientation','portrait');
    set(gcf,'Units','centimeters','Position',get(gcf,'paperPosition')+[4 0 0 0]);
    for run_day1=1:8
        for run_day2=1:8
            subplot(8,8,8*(run_day1-1)+run_day2)
            switch group_type
                case 1
                    imagesc(funct_tuning_cells_all_days_ordered_by_all_days{run_day1,run_day2});
                case 2
                    imagesc(stuck_tuning_cells_all_days_ordered_by_all_days{run_day1,run_day2});
            end
            colormap jet
        end
    end
end

%% PV corr across positions across directions

load('corr_mat_to_plot_stuck_all_mice');
load('corr_mat_to_plot_funct_all_mice');

bin_vec = [3:22];

figure;
hold on
corr_mat_to_plot_funct = mean(corr_mat_to_plot_funct_all_mice,3);
imagesc(corr_mat_to_plot_funct(end:-1:1,:));
colormap jet
plot([0 40.5], 20.5*[1 1], '-m','LineWidth',2.5);
plot(20.5*[1 1], [0 40.5],'-m','LineWidth',2.5);
caxis([0 0.9]);
ylim([0.5 40.5]);
xlim([0.5 40.5]);
xticks([])
yticks([])
axis square
colorbar
title('Running')

figure;
hold on
corr_mat_to_plot_stuck = mean(corr_mat_to_plot_stuck_all_mice,3);
imagesc(corr_mat_to_plot_stuck(end:-1:1,:));
colormap jet
plot([0 40.5], 20.5*[1 1], '-m','LineWidth',2.5);
plot(20.5*[1 1], [0 40.5],'-m','LineWidth',2.5);
caxis([0 0.9]);
ylim([0.5 40.5]);
xlim([0.5 40.5]);
xticks([])
yticks([])
axis square
colorbar
title('Sedentary')

%% PV corr across positions across directions per mouse

figure;
for run_mouse=1:5
    subplot(2,5,run_mouse);
    hold on
    corr_mat_to_plot_funct = corr_mat_to_plot_funct_all_mice(:,:,run_mouse);
    imagesc(corr_mat_to_plot_funct(end:-1:1,:));
    colormap jet
    plot([0 40.5], 20.5*[1 1], '-m','LineWidth',2.5);
    plot(20.5*[1 1], [0 40.5],'-m','LineWidth',2.5);
    caxis([0 0.9]);
    ylim([0.5 40.5]);
    xlim([0.5 40.5]);
    xticks([])
    yticks([])
    axis square
    colorbar
    title(['Mouse ' num2str(run_mouse)])
    
    subplot(2,5,run_mouse+5);
    hold on
    corr_mat_to_plot_stuck = corr_mat_to_plot_stuck_all_mice(:,:,run_mouse);
    imagesc(corr_mat_to_plot_stuck(end:-1:1,:));
    colormap jet
    plot([0 40.5], 20.5*[1 1], '-m','LineWidth',2.5);
    plot(20.5*[1 1], [0 40.5],'-m','LineWidth',2.5);
    caxis([0 0.9]);
    ylim([0.5 40.5]);
    xlim([0.5 40.5]);
    xticks([])
    yticks([])
    axis square
    colorbar
    title(['Mouse ' num2str(run_mouse)])
end

%% PV corr across positions across days

load('PV_corr_mat_each_env_both_directions_funct');
load('PV_corr_mat_each_env_both_directions_stuck');

figure;
hold on
mean_corr_mat_both_envs_and_direction_funct = mean(PV_corr_mat_each_env_both_directions_funct,3);
imagesc(mean_corr_mat_both_envs_and_direction_funct(end:-1:1,:));
for run_lines=1:7
   plot([0 320], run_lines*40*[1 1], '-m','LineWidth',1.4);
   plot(run_lines*40*[1 1], [0 320],'-m','LineWidth',1.4);
end
colormap jet
caxis([0 0.8]);
ylim([0 320]);
xlim([0 320]);
axis square
colorbar

figure;
hold on
mean_corr_mat_both_envs_and_direction_stuck = mean(PV_corr_mat_each_env_both_directions_stuck,3);
imagesc(mean_corr_mat_both_envs_and_direction_stuck(end:-1:1,:));
for run_lines=1:7
   plot([0 320], run_lines*40*[1 1], '-m','LineWidth',1.4);
   plot(run_lines*40*[1 1], [0 320],'-m','LineWidth',1.4);
end
colormap jet
caxis([0 0.8]);
ylim([0 320]);
xlim([0 320]);
axis square
colorbar

%% Number of place fields per place cell

load('mean_num_of_fields_averaged_over_envs_funct');
load('mean_num_of_fields_averaged_over_envs_stuck');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:8], mean(mean_num_of_fields_averaged_over_envs_stuck),std(mean_num_of_fields_averaged_over_envs_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:8], mean(mean_num_of_fields_averaged_over_envs_funct),std(mean_num_of_fields_averaged_over_envs_funct)/sqrt(5),...
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
ylabel({'# of place fields'; 'per place cell'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});

%%

figure
hold on
set(gca,'linewidth',4)
for run_mouse=1:5
    plot([1:8], mean_num_of_fields_averaged_over_envs_stuck(run_mouse,:),...
        '-','LineWidth',5,...
        'Color','b');
    plot([1:8], mean_num_of_fields_averaged_over_envs_funct(run_mouse,:),...
        '-','LineWidth',5,...
        'Color','r');
end
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'# of place fields'; 'per place cell'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});



%% Percentage of place cells with a single field

load('funct_percent_of_PCs_with_one_field_mat');
load('stuck_percent_of_PCs_with_one_field_mat');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:8], mean(stuck_percent_of_PCs_with_one_field_mat),std(stuck_percent_of_PCs_with_one_field_mat)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:8], mean(funct_percent_of_PCs_with_one_field_mat),std(funct_percent_of_PCs_with_one_field_mat)/sqrt(5),...
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
ylabel({'% of place cells'; 'with a single field'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});

%% Number of fields per place cell- histogram

load('stuck_hist_num_of_fields');
load('funct_hist_num_of_fields');

figure
hold on
bar([1:6],[stuck_hist_num_of_fields' funct_hist_num_of_fields']);
xlabel('Number of fields');
ylabel('Number of place cells');
legend({'Sed','Run'},'Location','northeast','box','off');
%% Amplitude

load('funct_amp_mean_mouse_by_day_mat');
load('stuck_amp_mean_mouse_by_day_mat');

figure
hold on
errorbar([1:8],mean(stuck_amp_mean_mouse_by_day_mat),std(stuck_amp_mean_mouse_by_day_mat)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:8],mean(funct_amp_mean_mouse_by_day_mat),std(funct_amp_mean_mouse_by_day_mat)/sqrt(5),...
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
ylabel({'Amplitude (\DeltaF/F)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([0.015 0.035])

%% Amplitude per mouse

figure
hold on
for i=1:5
    plot([1:8],stuck_amp_mean_mouse_by_day_mat(i,:),...
        'o-','LineWidth',5,...
        'MarkerSize',6,...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','b',...
        'Color','b');
    plot([1:8],funct_amp_mean_mouse_by_day_mat(i,:),...
        'o-','LineWidth',5,...
        'MarkerSize',6,...
        'MarkerEdgeColor','r',...
        'MarkerFaceColor','r',...
        'Color','r');
end
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'Amplitude (\DeltaF/F)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});

%%

load('stable_PC_elapse_day_interval_funct');
load('stable_PC_elapse_day_interval_stuck');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:7],...
    100*nanmean(stable_PC_elapse_day_interval_stuck),...
    100*nanstd(stable_PC_elapse_day_interval_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:7],...
    100*nanmean(stable_PC_elapse_day_interval_funct),...
    100*nanstd(stable_PC_elapse_day_interval_funct)/sqrt(5),...
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
xticks([1 2 3 4 5 6 7]);
xticklabels({'3','6','9','12','15','18','21'});
ylabel({'Stable place cells (%)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square

%%

load('correct_position_elapse_day_interval_funct');
load('correct_position_elapse_day_interval_stuck');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:7],...
    100*nanmean(correct_position_elapse_day_interval_stuck),...
    100*nanstd(correct_position_elapse_day_interval_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:7],...
    100*nanmean(correct_position_elapse_day_interval_funct),...
    100*nanstd(correct_position_elapse_day_interval_funct)/sqrt(5),...
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
xticks([1 2 3 4 5 6 7]);
xticklabels({'3','6','9','12','15','18','21'});
ylabel({'Accurate decoding'; '(% of frames)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
axis square

%%

load('correct_position_one_day_interval_funct');
load('correct_position_one_day_interval_stuck');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:7],...
    100*nanmean(correct_position_one_day_interval_stuck),...
    100*nanstd(correct_position_one_day_interval_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:7],...
    100*nanmean(correct_position_one_day_interval_funct),...
    100*nanstd(correct_position_one_day_interval_funct)/sqrt(5),...
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
xlabel('Time (day pairs)','FontName', 'Arial', 'FontSize', 48);
xticks([1 2 3 4 5 6 7]);
xticklabels({'1-4','4-7','7-10','10-13','13-16','16-19','19-22'});
ylabel({'Accurate decoding';'(% of frames)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square

%%

load('one_day_interval_within_env_stuck');
load('one_day_interval_within_env_funct');
load('one_day_interval_across_env_stuck');
load('one_day_interval_across_env_funct');

figure
hold on
set(gca,'linewidth',4)
errorbar(1:7, nanmean(one_day_interval_within_env_stuck), nanstd(one_day_interval_within_env_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:7, nanmean(one_day_interval_within_env_funct), nanstd(one_day_interval_within_env_funct)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r','capsize',12);
errorbar(1:7, nanmean(one_day_interval_across_env_stuck), nanstd(one_day_interval_across_env_stuck)/sqrt(5),...
    'o--','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:7, nanmean(one_day_interval_across_env_funct), nanstd(one_day_interval_across_env_funct)/sqrt(5),...
    'o--','LineWidth',5,...
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
xlabel('Time (day pairs)','FontName', 'Arial', 'FontSize', 48);
xticks([1 2 3 4 5 6 7]);
xticklabels({'1-4','4-7','7-10','10-13','13-16','16-19','19-22'});
xtickangle(45)
ylabel({'Ensemble activity'; 'correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed same env','Run same env','Sed diff env','Run diff env'},'FontName', 'Arial','FontSize', 28,'Location','northwest','box','off');
% ylim([0.2 1])
ylim([0 1])
axis square

%%

load('elapsed_time_across_env_funct');
load('elapsed_time_across_env_stuck');
load('elapsed_time_within_env_funct');
load('elapsed_time_within_env_stuck');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:7],nanmean(elapsed_time_within_env_stuck),nanstd(elapsed_time_within_env_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:7],nanmean(elapsed_time_within_env_funct),nanstd(elapsed_time_within_env_funct)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r','capsize',12);
errorbar([0:7],nanmean(elapsed_time_across_env_stuck),nanstd(elapsed_time_across_env_stuck)/sqrt(5),...
    'o--','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([0:7],nanmean(elapsed_time_across_env_funct),nanstd(elapsed_time_across_env_funct)/sqrt(5),...
    'o--','LineWidth',5,...
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
xticks([1 2 3 4 5 6 7]);
xticklabels({'3','6','9','12','15','18','21'});
ylabel({'Ensemble activity';'correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed same env','Run same env','Sed diff env','Run diff env'},'FontName', 'Arial','FontSize', 28,'Location','northeast','box','off');
axis square
ylim([0 0.7])

%%

load('same_day_across_env_stuck');
load('same_day_across_env_funct');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:8],nanmean(same_day_across_env_stuck),nanstd(same_day_across_env_stuck)/sqrt(5),...
    'o--','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:8],nanmean(same_day_across_env_funct),nanstd(same_day_across_env_funct)/sqrt(5),...
    'o--','LineWidth',5,...
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
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'Ensemble activity'; 'correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
ylim([0 0.6]);

%%

load('PV_one_day_interval_within_env_stuck');
load('PV_one_day_interval_within_env_funct');
load('PV_one_day_interval_across_env_stuck');
load('PV_one_day_interval_across_env_funct');

figure
hold on
set(gca,'linewidth',4)
errorbar(1:7, nanmean(PV_one_day_interval_within_env_stuck), nanstd(PV_one_day_interval_within_env_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:7, nanmean(PV_one_day_interval_within_env_funct), nanstd(PV_one_day_interval_within_env_funct)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r','capsize',12);
errorbar(1:7, nanmean(PV_one_day_interval_across_env_stuck), nanstd(PV_one_day_interval_across_env_stuck)/sqrt(5),...
    'o--','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:7, nanmean(PV_one_day_interval_across_env_funct), nanstd(PV_one_day_interval_across_env_funct)/sqrt(5),...
    'o--','LineWidth',5,...
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
xlabel('Time (day pairs)','FontName', 'Arial', 'FontSize', 48);
xticks([1 2 3 4 5 6 7]);
xticklabels({'1-4','4-7','7-10','10-13','13-16','16-19','19-22'});
xtickangle(45)
ylabel({'PV correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed same env','Run same env','Sed diff env','Run diff env'},'FontName', 'Arial','FontSize', 28,'Location','northwest','box','off');
% ylim([0.2 1])
ylim([0 0.5])
axis square

%%

load('PV_elapsed_time_across_env_funct');
load('PV_elapsed_time_across_env_stuck');
load('PV_elapsed_time_within_env_funct');
load('PV_elapsed_time_within_env_stuck');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:7],nanmean(PV_elapsed_time_within_env_stuck),nanstd(PV_elapsed_time_within_env_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:7],nanmean(PV_elapsed_time_within_env_funct),nanstd(PV_elapsed_time_within_env_funct)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r','capsize',12);
errorbar([0:7],nanmean(PV_elapsed_time_across_env_stuck),nanstd(PV_elapsed_time_across_env_stuck)/sqrt(5),...
    'o--','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([0:7],nanmean(PV_elapsed_time_across_env_funct),nanstd(PV_elapsed_time_across_env_funct)/sqrt(5),...
    'o--','LineWidth',5,...
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
xticks([1 2 3 4 5 6 7]);
xticklabels({'3','6','9','12','15','18','21'});
ylabel({'PV correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed same env','Run same env','Sed diff env','Run diff env'},'FontName', 'Arial','FontSize', 28,'Location','northeast','box','off');
axis square
ylim([0 0.4])

%%

load('PV_same_day_across_env_stuck');
load('PV_same_day_across_env_funct');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:8],nanmean(PV_same_day_across_env_stuck),nanstd(PV_same_day_across_env_stuck)/sqrt(5),...
    'o--','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:8],nanmean(PV_same_day_across_env_funct),nanstd(PV_same_day_across_env_funct)/sqrt(5),...
    'o--','LineWidth',5,...
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
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'PV correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
ylim([0 0.2])

%%

load('Tuning_curve_elapsed_time_across_env_funct');
load('Tuning_curve_elapsed_time_across_env_stuck');
load('Tuning_curve_elapsed_time_within_env_funct');
load('Tuning_curve_elapsed_time_within_env_stuck');

figure
hold on
set(gca,'linewidth',4)
errorbar([1:7],nanmean(Tuning_curve_elapsed_time_within_env_stuck),nanstd(Tuning_curve_elapsed_time_within_env_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:7],nanmean(Tuning_curve_elapsed_time_within_env_funct),nanstd(Tuning_curve_elapsed_time_within_env_funct)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r','capsize',12);
errorbar([0:7],nanmean(Tuning_curve_elapsed_time_across_env_stuck),nanstd(Tuning_curve_elapsed_time_across_env_stuck)/sqrt(5),...
    'o--','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([0:7],nanmean(Tuning_curve_elapsed_time_across_env_funct),nanstd(Tuning_curve_elapsed_time_across_env_funct)/sqrt(5),...
    'o--','LineWidth',5,...
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
xticks([1 2 3 4 5 6 7]);
xticklabels({'3','6','9','12','15','18','21'});
ylabel({'Tuning curve'; 'correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed same env','Run same env','Sed diff env','Run diff env'},'FontName', 'Arial','FontSize', 28,'Location','northeast','box','off');
axis square
ylim([-0.1 0.6])

%%

load('funct_num_of_rewards');
load('stuck_num_of_rewards');
figure
hold on
set(gca,'linewidth',4)
errorbar(1:8, mean(stuck_num_of_rewards),std(stuck_num_of_rewards)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:8, mean(funct_num_of_rewards),std(funct_num_of_rewards)/sqrt(5),...
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
ylabel({'Rewards (#)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([0 100])

%%

load('funct_running_velocity');
load('stuck_running_velocity');

figure
hold on
set(gca,'linewidth',4)
errorbar(1:8, mean(stuck_running_velocity),std(stuck_running_velocity)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:8, mean(funct_running_velocity),std(funct_running_velocity)/sqrt(5),...
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
ylabel({'Velocity (cm/s)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([0 20])

%% 

functioning_wheel_list = {'C201M3' 'C204M2' 'C206M3' 'C210M2' 'C210M3'};
stuck_wheel_list = {'C202M1' 'C205M1' 'C205M2' 'C207M3' 'C209M1'};
trials_list = ['3 4 5 8 9 10 13 14 15 18 19 20'];
bucket_list = ['1 2 6 7 11 12 16 17'];
x_of_groups = [0.8:1.4];
x_noise = 0.08;

%% Velocity

load('median_velocity_mat_GroupByMouse');

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gca,'linewidth',4)
bar([0.8],[mean(median_velocity_mat_GroupByMouse(2,:))],'FaceColor','b','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
bar([1.3],[mean(median_velocity_mat_GroupByMouse(1,:))],'FaceColor','r','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
errorbar(0.8,mean(median_velocity_mat_GroupByMouse(2,:)),std(median_velocity_mat_GroupByMouse(2,:))/sqrt(5),'k','LineWidth',5,'capsize',10);
errorbar(1.3,mean(median_velocity_mat_GroupByMouse(1,:)),std(median_velocity_mat_GroupByMouse(1,:))/sqrt(5),'k','LineWidth',5,'capsize',10);
plot(0.8+x_noise*randn(1,length(median_velocity_mat_GroupByMouse(2,:))),median_velocity_mat_GroupByMouse(2,:),'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
plot(1.3+x_noise*randn(1,length(median_velocity_mat_GroupByMouse(1,:))),median_velocity_mat_GroupByMouse(1,:),'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
xticks([0.8 1.3])
set(gca,'FontSize',18)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
set(axes1,'FontName','Arial','FontSize',48,'XTick',[0.8 1.3],'XTickLabel',...
    {'Sed','Run'});
xlim([0.4 1.7])
axis square
ylabel({'Velocity (cm/s)'},'FontName','Arial','FontSize',48);

%% Exploration time

load('high_velocity_frac_mat_GroupByMouse');

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gca,'linewidth',4)
bar([0.8],100*[mean(high_velocity_frac_mat_GroupByMouse(2,:))],'FaceColor','b','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
bar([1.3],100*[mean(high_velocity_frac_mat_GroupByMouse(1,:))],'FaceColor','r','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
errorbar(0.8,100*mean(high_velocity_frac_mat_GroupByMouse(2,:)),100*std(high_velocity_frac_mat_GroupByMouse(2,:))/sqrt(5),'k','LineWidth',5,'capsize',10);
errorbar(1.3,100*mean(high_velocity_frac_mat_GroupByMouse(1,:)),100*std(high_velocity_frac_mat_GroupByMouse(1,:))/sqrt(5),'k','LineWidth',5,'capsize',10);
plot(0.8+x_noise*randn(1,length(high_velocity_frac_mat_GroupByMouse(2,:))),100*high_velocity_frac_mat_GroupByMouse(2,:),'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
plot(1.3+x_noise*randn(1,length(high_velocity_frac_mat_GroupByMouse(1,:))),100*high_velocity_frac_mat_GroupByMouse(1,:),'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
xticks([0.8 1.3])
% xticklabels(['Stuck'; 'Funct']);
set(gca,'FontSize',18)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
set(axes1,'FontName','Arial','FontSize',48,'XTick',[0.8 1.3],'XTickLabel',...
    {'Sed','Run'});
xlim([0.4 1.7])
axis square
ylabel({'Exploration time (%)'},'FontName','Arial','FontSize',48);
ylim(100*[0 0.5])
yticks(100*[0 0.1 0.2 0.3 0.4 0.5])

%% Ca+2 activity rate

load('mean_firing_rate_both_envs_stuck');
load('mean_firing_rate_both_envs_funct');

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gca,'linewidth',4)
bar([0.8],[mean(mean_firing_rate_both_envs_stuck)],'FaceColor','b','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
bar([1.3],[mean(mean_firing_rate_both_envs_funct)],'FaceColor','r','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
errorbar(0.8,mean(mean_firing_rate_both_envs_stuck),std(mean_firing_rate_both_envs_stuck)/sqrt(5),'k','LineWidth',5,'capsize',10);
errorbar(1.3,mean(mean_firing_rate_both_envs_funct),std(mean_firing_rate_both_envs_funct)/sqrt(5),'k','LineWidth',5,'capsize',10);
plot(0.8+x_noise*randn(1,length(mean_firing_rate_both_envs_stuck)),mean_firing_rate_both_envs_stuck,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
plot(1.3+x_noise*randn(1,length(mean_firing_rate_both_envs_funct)),mean_firing_rate_both_envs_funct,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
xticks([0.8 1.3])
% xticklabels(['Stuck'; 'Funct']);
set(gca,'FontSize',18)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
set(axes1,'FontName','Arial','FontSize',48,'XTick',[0.8 1.3],'XTickLabel',...
    {'Sed','Run'});
xlim([0.4 1.7])
axis square
ylabel({'Ca2+ event'; 'rate'},'FontName','Arial','FontSize',48);

%% PV corr mat
load('PV_corr_mat_stuck');
load('PV_corr_mat_funct');

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gca,'linewidth',4)
subplot(1,2,1)
imagesc(mean(PV_corr_mat_stuck,3));
colorbar
title({'Sed'});
axis square
xticks([1 2 3 4]);
xticklabels({'1','2','3','4'});
yticks([1 2 3 4]);
yticklabels({'1','2','3','4'});
xlabel({'Trial'},'FontName', 'Arial', 'FontSize', 48);
ylabel({'Trial'},'FontName', 'Arial', 'FontSize', 48);
set(gca,'FontSize',18)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
subplot(1,2,2)
imagesc(mean(PV_corr_mat_funct,3))
colorbar
title({'Run'});
axis square
xticks([1 2 3 4]);
xticklabels({'1','2','3','4'});
yticks([1 2 3 4]);
yticklabels({'1','2','3','4'});
xlabel({'Trial'},'FontName', 'Arial', 'FontSize', 48);
ylabel({'Trial'},'FontName', 'Arial', 'FontSize', 48);
h = colorbar;
ylabel(h, 'Correlation','FontName','Arial','FontSize',36);
colormap jet
set(gca,'FontSize',18)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])

%% PV corr bars

load('stuck_PV_corr_same');
load('funct_PV_corr_same');
load('stuck_PV_corr_other');
load('funct_PV_corr_other');

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gca,'linewidth',4)
bar([0.8],[mean(stuck_PV_corr_same)],'FaceColor','b','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
bar([1.3],[mean(funct_PV_corr_same)],'FaceColor','r','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
errorbar(0.8,mean(stuck_PV_corr_same),std(stuck_PV_corr_same)/sqrt(5),'k','LineWidth',5,'capsize',10);
errorbar(1.3,mean(funct_PV_corr_same),std(funct_PV_corr_same)/sqrt(5),'k','LineWidth',5,'capsize',10);
plot(0.8+x_noise*randn(1,length(stuck_PV_corr_same)),stuck_PV_corr_same,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
plot(1.3+x_noise*randn(1,length(funct_PV_corr_same)),funct_PV_corr_same,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
bar([2],[mean(stuck_PV_corr_other)],'FaceColor','b','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
bar([2.5],[mean(funct_PV_corr_other)],'FaceColor','r','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
errorbar(2,mean(stuck_PV_corr_other),std(stuck_PV_corr_other)/sqrt(5),'k','LineWidth',5,'capsize',10);
errorbar(2.5,mean(funct_PV_corr_other),std(funct_PV_corr_other)/sqrt(5),'k','LineWidth',5,'capsize',10);
plot(2+x_noise*randn(1,length(stuck_PV_corr_other)),stuck_PV_corr_other,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
plot(2.5+x_noise*randn(1,length(funct_PV_corr_other)),funct_PV_corr_other,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
set(gca,'FontSize',18)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
set(axes1,'FontName','Arial','FontSize',48,'XTick',[1.05 2.25],'XTickLabel',...
    {'Within environment', 'Across environment'});
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northeast','box','off');
xlim([0.4 2.9])
axis square
ylabel({'Population vector'; 'correlation'},'FontName','Arial','FontSize',48);
ylim([0 0.5])

%% Accurate decoding

load('p_correct_per_mouse_stuck');
load('p_correct_per_mouse_funct');

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
set(gca,'linewidth',4)
bar([0.8],[mean(p_correct_per_mouse_stuck*100)],'FaceColor','b','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
bar([1.3],[mean(p_correct_per_mouse_funct*100)],'FaceColor','r','EdgeColor','k','LineWidth',4,'BarWidth', 0.35);
errorbar(0.8,mean(p_correct_per_mouse_stuck*100),std(p_correct_per_mouse_stuck*100)/sqrt(5),'k','LineWidth',5,'capsize',10);
errorbar(1.3,mean(p_correct_per_mouse_funct*100),std(p_correct_per_mouse_funct*100)/sqrt(5),'k','LineWidth',5,'capsize',10);
plot(0.8+x_noise*randn(1,length(p_correct_per_mouse_stuck*100)),p_correct_per_mouse_stuck*100,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
plot(1.3+x_noise*randn(1,length(p_correct_per_mouse_funct*100)),p_correct_per_mouse_funct*100,'LineStyle','none','Marker','o','MarkerEdgeColor',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'LineWidth',1,'MarkerSize',10);
xticks([0.8 1.3])
set(gca,'FontSize',18)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
set(axes1,'FontName','Arial','FontSize',48,'XTick',[0.8 1.3],'XTickLabel',...
    {'Sed','Run'});
xlim([0.4 1.7])
plot(xlim,[25 25],'--k')
axis square
ylabel({'Accurate decoding'; '(% of frames)'},'FontName','Arial','FontSize',48);
ylim([20 55])

%%

load('same_day_temp_funct_all');
load('same_day_temp_stuck_all');

figure
hold on
set(gca,'linewidth',4)

errorbar(1:8, mean(same_day_temp_stuck_all)*100, std(same_day_temp_stuck_all)*100/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:8, mean(same_day_temp_funct_all)*100, std(same_day_temp_funct_all)*100/sqrt(5),...
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
ylabel({'Accurate decoding'; '(% of frames)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([25 60]);

%% Spatial decoder within-session across-trials - per mouse

figure
hold on
set(gca,'linewidth',4)
for run_mouse=1:5
plot(1:8, same_day_temp_stuck_all(run_mouse,:)*100,...
    '-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b');
plot(1:8, same_day_temp_funct_all(run_mouse,:)*100,...
    '-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r');
end
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'Accurate decoding'; '(% of frames)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});

%%

load('MeanTrialCorrPerMousePerSession_stuck');
load('MeanTrialCorrPerMousePerSession_funct');

figure
hold on
set(gca,'linewidth',4)
errorbar(1:8, nanmean(MeanTrialCorrPerMousePerSession_stuck),nanstd(MeanTrialCorrPerMousePerSession_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar(1:8, nanmean(MeanTrialCorrPerMousePerSession_funct),nanstd(MeanTrialCorrPerMousePerSession_funct)/sqrt(5),...
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
ylabel({'Population vector';'correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});
ylim([0.08 0.4])

%% PV Corr within-session across-trials - per mouse

figure
hold on
set(gca,'linewidth',4)
for run_mouse=1:5
plot(1:8, MeanTrialCorrPerMousePerSession_stuck(run_mouse,:),...
    '-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b');
plot(1:8, MeanTrialCorrPerMousePerSession_funct(run_mouse,:),...
    '-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'Color','r');
end
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'Population vector'; 'correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});

%%

load(['funct_SI']);
load(['stuck_SI']);
load(['PV_correlation_mat_funct']);
load(['PV_correlation_mat_stuck']);

PV_corr_one_day_gap_funct_env1 = nan(5,7);
PV_corr_one_day_gap_funct_env2 = nan(5,7);
PV_corr_one_day_gap_stuck_env1 = nan(5,7);
PV_corr_one_day_gap_stuck_env2 = nan(5,7);


for group_type=1:2
    switch group_type
        case 1
            AllMice_PV_CorrMat = AllMice_PV_CorrMat_funct;
        case 2
            AllMice_PV_CorrMat = AllMice_PV_CorrMat_stuck;
    end
    for run_mouse=1:5
        for run_day=1:7
            for run_env=1:2
                if mod(run_day,2) == 0
                    current_day_ind = 2*(run_day-1)+run_env;
                    current_next_day_ind = 2*(run_day)+3-run_env;
                else
                    current_day_ind = 2*(run_day-1)+3-run_env;
                    current_next_day_ind = 2*(run_day)+run_env;
                end
                current_day_PV_corr = ...
                    AllMice_PV_CorrMat(current_day_ind,current_next_day_ind,run_mouse);
                if group_type==1 && run_env==1
                    PV_corr_one_day_gap_funct_env1(run_mouse,run_day) = current_day_PV_corr;
                elseif group_type==1 && run_env==2
                    PV_corr_one_day_gap_funct_env2(run_mouse,run_day) = current_day_PV_corr;
                elseif group_type==2 && run_env==1
                    PV_corr_one_day_gap_stuck_env1(run_mouse,run_day) = current_day_PV_corr;
                elseif group_type==2 && run_env==2
                    PV_corr_one_day_gap_stuck_env2(run_mouse,run_day) = current_day_PV_corr;
                end
            end
        end
    end
end

%%

PV_corr_one_day_gap_funct = (PV_corr_one_day_gap_funct_env1 + PV_corr_one_day_gap_funct_env2)/2;
PV_corr_one_day_gap_stuck = (PV_corr_one_day_gap_stuck_env1 + PV_corr_one_day_gap_stuck_env2)/2;

PV_corr_one_day_gap_funct_vectorized = PV_corr_one_day_gap_funct(:);
PV_corr_one_day_gap_stuck_vectorized = PV_corr_one_day_gap_stuck(:);


funct_SI_without_last_day = (funct_SI(:,1:end-1)+funct_SI(:,2:end))/2;
stuck_SI_without_last_day = (stuck_SI(:,1:end-1)+stuck_SI(:,2:end))/2;


%%

mean_PV_corr_one_day_gap_funct = mean(PV_corr_one_day_gap_funct);
mean_PV_corr_one_day_gap_stuck = mean(PV_corr_one_day_gap_stuck);

mean_funct_SI_without_last_day = mean(funct_SI_without_last_day);
mean_stuck_SI_without_last_day = mean(stuck_SI_without_last_day);

figure
hold on
set(gca,'linewidth',4)
plot(mean_stuck_SI_without_last_day,mean_PV_corr_one_day_gap_stuck,...
    'd-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b');
plot(mean_funct_SI_without_last_day,mean_PV_corr_one_day_gap_funct,...
    'd-','LineWidth',5,...
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
xlabel({'Information (bits/Ca2+ event)'},'FontName', 'Arial', 'FontSize', 48);
ylabel({'Population vector'; 'correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','southeast','box','off');
axis square


%%

funct_dots_x_all_mice = [];
funct_dots_y_all_mice = [];
stuck_dots_x_all_mice = [];
stuck_dots_y_all_mice = [];

for run_mice=1:5
    funct_dots_x{run_mice} = funct_SI_without_last_day(run_mice,:);
    funct_dots_y{run_mice} = PV_corr_one_day_gap_funct(run_mice,:);
    stuck_dots_x{run_mice} = stuck_SI_without_last_day(run_mice,:);
    stuck_dots_y{run_mice} = PV_corr_one_day_gap_stuck(run_mice,:);
    funct_dots_x_all_mice = [funct_dots_x_all_mice funct_dots_x{run_mice}];
    funct_dots_y_all_mice = [funct_dots_y_all_mice funct_dots_y{run_mice}];
    stuck_dots_x_all_mice = [stuck_dots_x_all_mice stuck_dots_x{run_mice}];
    stuck_dots_y_all_mice = [stuck_dots_y_all_mice stuck_dots_y{run_mice}];
end


funct_dots_x_all_mice_nan_corrected = funct_dots_x_all_mice(~isnan(funct_dots_y_all_mice));
funct_dots_y_all_mice_nan_corrected = funct_dots_y_all_mice(~isnan(funct_dots_y_all_mice));
stuck_dots_x_all_mice_nan_corrected = stuck_dots_x_all_mice(~isnan(stuck_dots_y_all_mice));
stuck_dots_y_all_mice_nan_corrected = stuck_dots_y_all_mice(~isnan(stuck_dots_y_all_mice));


x_all=[[funct_dots_x_all_mice_nan_corrected'; stuck_dots_x_all_mice_nan_corrected'] ...
    [ones(size(funct_dots_x_all_mice_nan_corrected')); zeros(size(stuck_dots_x_all_mice_nan_corrected'))] ...
    [zeros(size(funct_dots_x_all_mice_nan_corrected')); ones(size(stuck_dots_x_all_mice_nan_corrected'))]];
y_all=[funct_dots_y_all_mice_nan_corrected'; stuck_dots_y_all_mice_nan_corrected'];

c_all=x_all\y_all;

figure; % Given a specific day, what is the ratio
hold on
set(gca,'linewidth',4)
scatter(stuck_dots_x_all_mice,stuck_dots_y_all_mice,...
    'Marker','o',...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b')%,...
scatter(funct_dots_x_all_mice,funct_dots_y_all_mice,...
    'Marker','o',...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r')%,...
plot(stuck_dots_x_all_mice,stuck_dots_x_all_mice*c_all(1)+c_all(3),...
    '-','LineWidth',5,...
    'MarkerSize',10,...
    'MarkerEdgeColor',[0 0 0.75],...
    'MarkerFaceColor',[0 0 0.75],...
    'Color',[0 0 0.75]);
plot(funct_dots_x_all_mice,funct_dots_x_all_mice*c_all(1)+c_all(2),...
    '-','LineWidth',5,...
    'MarkerSize',10,...
    'MarkerEdgeColor',[0.75 0 0],...
    'MarkerFaceColor',[0.75 0 0],...
    'Color',[0.75 0 0]);
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel({'Information (bits/Ca2+ event)'},'FontName', 'Arial', 'FontSize', 48);
ylabel({'Population vector'; 'correlation'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square

%%

load('PV_corr_funct_day_1_BothEnvs');
load('PV_corr_funct_day_2_BothEnvs');
load('PV_corr_stuck_day_1_BothEnvs');
load('PV_corr_stuck_day_2_BothEnvs');

figure
hold on
errorbar([1:5],mean(PV_corr_funct_day_1_BothEnvs),std(PV_corr_funct_day_1_BothEnvs)/sqrt(5),'r*-')
errorbar([1:5],mean(PV_corr_stuck_day_1_BothEnvs),std(PV_corr_stuck_day_1_BothEnvs)/sqrt(5),'k*-')
errorbar([6:10],mean(PV_corr_funct_day_2_BothEnvs),std(PV_corr_funct_day_2_BothEnvs)/sqrt(5),'r*-')
errorbar([6:10],mean(PV_corr_stuck_day_2_BothEnvs),std(PV_corr_stuck_day_2_BothEnvs)/sqrt(5),'k*-')
ylim([0 0.16])
xticks([1 2 3 4 5 6 7 8 9 10]);
xticklabels({'1','2','3','4','5','1','2','3','4','5'});
xlabel({'Time (trials)'});
ylabel({'Population vector'; 'correlation'});
legend({'Run','Sed'},'Location','northwest');
axis square

%% PV correlation to map on last days of snigle trials first days -per individual mouse
figure
hold on
for run_mouse = 1:5
plot([1:5],PV_corr_funct_day_1_BothEnvs(run_mouse,:),'r-')
plot([1:5],PV_corr_stuck_day_1_BothEnvs(run_mouse,:),'k-')
plot([6:10],PV_corr_funct_day_2_BothEnvs(run_mouse,:),'r-')
plot([6:10],PV_corr_stuck_day_2_BothEnvs(run_mouse,:),'k-')
end

xlim([0.5 10.5])
ylim([0 0.18])

xticks([1 2 3 4 5 6 7 8 9 10]);
xticklabels({'1','2','3','4','5','1','2','3','4','5'});
xlabel({'Time (trials)'});
ylabel({'Population vector'; 'correlation'});
legend({'Run','Sed'},'Location','northwest');
axis square

%%

load('running_in_home')
load('running_on_track')
R_mice_vec=[3 8 9 11 12]; %only mice with neuronl recordings
S_mice_vec=[2 4 5 6 13]; %only mice with neuronl recordings

BarFaceColorS=0.3*[1 1 1];
BarEdgeColorS=0*[1 1 1];
BarFaceColorR=[0.7 0.7 1];
BarEdgeColorR=0*[1 1 1];
DataDotsColor=0.7*[1 1 1];
running_in_home_cumsum=cumsum(running_in_home);

figure
hold on
for run_mice=1:size(running_in_home,2)
    plot(running_in_home_cumsum(:,run_mice),'k-')
end
ylabel('Cumulative running distance (km)')
xlim([1 40])
xticks([1 40])
xticklabels({'Day -27','Day  22'})

running_on_track_R_mice=running_on_track(R_mice_vec,:);
running_on_track_S_mice=running_on_track(S_mice_vec,:);
cumsum_running_on_track_R_mice=cumsum(running_on_track_R_mice,2);
cumsum_running_on_track_S_mice=cumsum(running_on_track_S_mice,2);

overall_running_in_home_per_mouse=running_in_home_cumsum(end,:);
overall_running_on_track_R_mice=cumsum_running_on_track_R_mice(:,end);
overall_running_on_track_S_mice=cumsum_running_on_track_S_mice(:,end);

figure
hold on
bar([1],mean(overall_running_on_track_S_mice),'FaceColor',BarFaceColorS,'EdgeColor',BarEdgeColorS,'LineWidth',1.5)
plot(1*ones(1,length(overall_running_on_track_S_mice))+0.1*randn(1,length(overall_running_on_track_S_mice)),...
    overall_running_on_track_S_mice,...
    'o','MarkerfaceColor',DataDotsColor,'MarkeredgeColor',DataDotsColor)
errorbar([1],mean(overall_running_on_track_S_mice),...
    std(overall_running_on_track_S_mice)/sqrt(length(overall_running_on_track_S_mice)),...
    '.','color',BarEdgeColorS,'LineWidth',1.5)

bar([2],mean(overall_running_on_track_R_mice),'FaceColor',BarFaceColorR,'EdgeColor',BarEdgeColorR,'LineWidth',1.5)
plot(2*ones(1,length(overall_running_on_track_R_mice))+0.1*randn(1,length(overall_running_on_track_R_mice)),...
    overall_running_on_track_R_mice,...
    'o','MarkerfaceColor',DataDotsColor,'MarkeredgeColor',DataDotsColor)
errorbar([2],mean(overall_running_on_track_R_mice),...
    std(overall_running_on_track_R_mice)/sqrt(length(overall_running_on_track_R_mice)),...
    '.','color',BarEdgeColorR,'LineWidth',1.5)

xticks([1 2])
xticklabels({'Sed','Run'})
ylabel('Overall running on tracks (m)')
xlim([0 3])
ylim([0 1000])

%%

SI_shuffle_reduction_flag = 0;

switch SI_shuffle_reduction_flag
    case 0
        load('SI_per_sec_mat_per_day_funct');
        load('SI_per_sec_mat_per_day_stuck');
        load('SI_per_sec_sem_mat_per_day_funct');
        load('SI_per_sec_sem_mat_per_day_stuck');
    case 1
        load('SI_per_sec_mat_per_day_funct_shuffle_reducted');
        load('SI_per_sec_mat_per_day_stuck_shuffle_reducted');
        load('SI_per_sec_sem_mat_per_day_funct_shuffle_reducted');
        load('SI_per_sec_sem_mat_per_day_stuck_shuffle_reducted');
end

figure;
hold on
errorbar([1:8],mean(SI_per_sec_mat_per_day_stuck),std(SI_per_sec_mat_per_day_stuck)/sqrt(5),...
    'o-','LineWidth',5,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b',...
    'Color','b','capsize',12);
errorbar([1:8],mean(SI_per_sec_mat_per_day_funct),std(SI_per_sec_mat_per_day_funct)/sqrt(5),...
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
ylabel('Information (bits/sec)','FontName', 'Arial', 'FontSize', 42);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});


%% SI per sec PER MOUSE

figure;
hold on
for run_mouse=1:5       
    errorbar([1:8],SI_per_sec_mat_per_day_stuck(run_mouse,:),SI_per_sec_sem_mat_per_day_stuck(run_mouse,:),...
        'o-','LineWidth',5,...
        'MarkerSize',6,...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor','b',...
        'Color','b','capsize',12);
    errorbar([1:8],SI_per_sec_mat_per_day_funct(run_mouse,:),SI_per_sec_sem_mat_per_day_funct(run_mouse,:),...
        'o-','LineWidth',5,...
        'MarkerSize',6,...
        'MarkerEdgeColor','r',...
        'MarkerFaceColor','r',...
        'Color','r','capsize',12);
end
xlim([0.8 8.2])
set(gca,'FontSize',36)
x0=10;
y0=10;
width=1000;
height=850;
set(gcf,'position',[x0,y0,width,height])
xlabel('Time (days)','FontName', 'Arial', 'FontSize', 48);
ylabel({'Information'; '(bits/sec)'},'FontName', 'Arial', 'FontSize', 48);
legend({'Sed','Run'},'FontName', 'Arial','FontSize', 40,'Location','northwest','box','off');
axis square
xticks([1 2 3 4 5 6 7 8]);
xticklabels({'1','4','7','10','13','16','19','22'});