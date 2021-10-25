%%
clear
clc

visualization
%%
% Extracting Files
%estimated data from robot
% 1V = 22.3N for Fx & Fy
% 1V = 44.5N for Fz
Fx_meas = csvread('Fx_scope.csv',19,1)*22.38;
Fy_meas = csvread('Fy_scope.csv',19,1)*22.38; %different attentuations
Fz_meas = csvread('Fz_scope.csv',19,1)*44.5;

Mx_meas = csvread('Mx_scope.csv',19,1)*2*1.13;
My_meas = csvread('My_scope.csv',19,1);
Mz_meas = csvread('Mz_scope.csv',19,1)*(-1);

t_meas  = linspace(0,length(Fx_meas)/1e6,length(Fx_meas));
t_meas_z= linspace(0,length(Fz_meas)/1e3,length(Fz_meas));

%measured data from MC3A sensor
Fx_data = load('Fx_force_step_data_mc3aFTsensor.mat');
Fy_data = load('Fy_force_step_data_mc3aFTsensor.mat');
Fz_data = load('Fz_force_step_data_mc3aFTsensor.mat');

Mx_data = load('Mx_force_step_data_mc3aFTsensor.mat');
My_data = load('My_force_step_data_mc3aFTsensor.mat');
Mz_data = load('Mz_force_step_data_mc3aFTsensor.mat');

length_est = min([length(Fx_data.FT_est_0.time),...
                  length(Fy_data.FT_est_0.time),...
                  length(Fz_data.FT_est_1.time),...
                  length(Mx_data.FT_est_0.time),...
                  length(My_data.FT_est_0.time),...
                  length(Mz_data.FT_est_0.time)]);
                
t_est = linspace(0,length_est/1000,length_est);

Fx_ref = Fx_data.FT_est_0.signals(1).values(1:length_est,1);
Fx_est = Fx_data.FT_est_0.signals(1).values(1:length_est,2);

Fy_ref = Fy_data.FT_est_0.signals(2).values(1:length_est,1);
Fy_est = Fy_data.FT_est_0.signals(2).values(1:length_est,2);

Fz_ref = Fz_data.FT_est_1.signals(3).values(1:length_est,1)*(-1);
Fz_est = Fz_data.FT_est_1.signals(3).values(1:length_est,2)*(-1);

Mx_ref = Mx_data.FT_est_0.signals(4).values(1:length_est,1);
Mx_est = Mx_data.FT_est_0.signals(4).values(1:length_est,2);

My_ref = My_data.FT_est_0.signals(5).values(1:length_est,1);
My_est = My_data.FT_est_0.signals(5).values(1:length_est,2);

Mz_ref = Mz_data.FT_est_0.signals(6).values(1:length_est,1);
Mz_est = Mz_data.FT_est_0.signals(6).values(1:length_est,2);

%%
Fx_est_avg = mean(Fx_est(4e3:end));
Fx_meas_avg = mean(Fx_meas(7e5:end));

Fy_est_avg = mean(Fy_est(4e3:end));
Fy_meas_avg = mean(Fy_meas(7e5:end));

Fz_est_avg = mean(Fz_est(4e3:end));
Fz_meas_avg = mean(Fz_meas(7e5:end));

Mx_est_avg = mean(Mx_est(4e3:end));
Mx_meas_avg = mean(Mx_meas(7e5:end));

My_est_avg = mean(My_est(4e3:end));
My_meas_avg = mean(My_meas(7e5:end));

Mz_est_avg = mean(Mz_est(4e3:end));
Mz_meas_avg = mean(Mz_meas(7e5:end));

fprintf('AVERAGE FINAL VALUES\n')
fprintf('      Est.    ') 
fprintf('Meas.\n')
fprintf('Fx | %.2f   ', Fx_est_avg)
fprintf('%.2f\n', Fx_meas_avg)

fprintf('Fy | %.2f   ', Fy_est_avg)
fprintf('%.2f\n', Fy_meas_avg)

%%
%Fz_offset = mean(Fz_meas(4e5:45e4));
%Fz_meas = (Fz_meas)*(22.38/.2);
Mz_offset = mean(Mz_meas(4e5:45e4));
Mz_meas = Mz_meas - Mz_offset;
%% FORCES
figure(1)
subplot(211)
    plot(t_est, Fx_ref,'Color',WAVE,'LineWidth',1.2)
    hold on
    plot(t_est, Fx_est,'Color',ORANGE,'LineWidth',1.2)
    xlim([28e-1 34e-1])
    xlabel('time [s]')
    ylabel('Force [N]')
    title('Fx Estimated');
    
subplot(212)
    plot(t_meas, Fx_meas,'Color',ORANGE,'LineWidth',1.2)
    xlim([4e-1 7e-1])
    title('Fx Measured')
    xlabel('time [s]')
    ylabel('Force [N]')  
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    

figure(2)
subplot(211)
    plot(t_est, Fy_ref,'Color',WAVE,'LineWidth',1.2)
    hold on
    plot(t_est, Fy_est,'Color',ORANGE,'LineWidth',1.2)
    xlim([28e-1 34e-1])
    title('Fy Estimated')
    xlabel('time [s]')
    ylabel('Force [N]')
    
subplot(212)
    plot(t_meas, Fy_meas,'Color',ORANGE,'LineWidth',1.2)
    xlim([4e-1 7e-1])
    title('Fy Measured')
    xlabel('time [s]')
    ylabel('Force [N]')
    
    set(gcf, 'Units', 'inches', 'Position',...
    [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)

figure(3)
subplot(211)
    plot(t_est, Fz_ref,'Color',WAVE,'LineWidth',1.2)
    hold on
    plot(t_est, Fz_est,'Color',ORANGE,'LineWidth',1.2)
    xlim([28e-1 34e-1])
    title('Fz Estimated')
    
subplot(212)
    plot(t_meas_z, Fz_meas,'Color',ORANGE,'LineWidth',1.2)
    xlim([45e-1 6])
    title('Fz Measured')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)

%% TORQUES
figure(4)
subplot(211)
    plot(t_est, Mx_ref,'Color',WAVE,'LineWidth',1.2)
    hold on
    plot(t_est, Mx_est,'Color',ORANGE,'LineWidth',1.2)
    xlim([28e-1 34e-1])
    title('Mx Estimated')
subplot(212)
    plot(t_meas, Mx_meas,'Color',ORANGE,'LineWidth',1.2)
    xlim([4e-1 7e-1])
    title('Mx Measured')
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)

figure(5)
subplot(211)
    plot(t_est, My_ref,'Color',WAVE,'LineWidth',1.2)
    hold on
    plot(t_est, My_est,'Color',ORANGE,'LineWidth',1.2)
    xlim([28e-1 34e-1])
    title('My Estimated')
    
subplot(212)
    plot(t_meas, My_meas,'Color',ORANGE,'LineWidth',1.2)
    xlim([4e-1 7e-1])
    title ('My measured')
    
    set(gcf, 'Units', 'inches', 'Position',...
    [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)

figure(6)
subplot(211)
    plot(t_est, Mz_ref,'Color',WAVE,'LineWidth',1.2)
    hold on
    plot(t_est, Mz_est,'Color',ORANGE,'LineWidth',1.2)
    xlim([28e-1 34e-1])
    title('Mz Estimated')
subplot(212)
    plot(t_meas, Mz_meas,'Color',ORANGE,'LineWidth',1.2)
    xlim([4e-1 8e-1])
    title('Mz Measured')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)









% % Time Data
% t_scope = linspace(0,length(data_scope/10),length(data_scope));
% t_lv = linspace(0,length(data_lv/10),length(data_lv));
% t_ra = data_ra.Force_1.time(1950:2300,1);
% 
% data_ra_m = data_ra.Force_1.signals(1).values(1950:2300,2);
% data_ra_d = data_ra.Force_1.signals(1).values(1950:2300,1);
% 
% figure(1)
% subplot(311)
%     plot(t_scope,data_scope)
%     title('Scope Fz')
% subplot(312)
%     plot(t_lv(150:350),data_lv(150:350))
%     xlim([150 350])
%     title('LabView Fz')
% subplot(313)
%     plot(t_ra,data_ra_m)
%     hold on
%     plot(t_ra,data_ra_d)
%     legend('measured','desired')
%     xlim([1.95 2.3])
%     title('Robotic Arm Fz')
    




% fCutoff = 10;   % Hz
% L = length(x); 
% X = fft(x);
% Xtwoside = [flipud(X(2:(L+1)/2)) ; X(1) ; X(2:(L+1)/2)];
% ftwoside = 1/Ts*[-(L-1)/2:(L-1)/2]/L;
% 
% foneside_idx = ftwoside>=0;
% Xoneside = Xtwoside(foneside_idx);
% foneside = ftwoside(foneside_idx);
% 
% % Filter
% Xoneside(foneside>=fCutoff) = 0;
% 
% % Reconstruct
% Xfilt = [Xoneside ; conj(flipud(Xoneside(2:end)))];
% xFilt = ifft(Xfilt);
% 
% 
% plot(t,xFilt)

