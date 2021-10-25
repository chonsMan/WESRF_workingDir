%% Plot Comparisons
% This code will generate plots based off the data collected in the 
% `data_extraction.m` file. It will compare the output of the physical 
% system with the output of the modeled system found using the System
% Identification Toolbox.
%%
visualization
plots_on = 0;

Ts = 1e-3;
series = 2;
data_ra = load(['dynamic_floating_body.mat']);

delay = 103; % delay introduced from torque bias block in robot model
i = size(data_ra.FT_est_0.signals(1).values,1); % length of data
j=6; % DOF
t = linspace(0,i*Ts,i);

M_ra_in = zeros(i,j); % Robot Arm input matrix
M_tf_in = zeros(i,j); % Transfer Function input matrix
M_ra_out = zeros(i,j); % Robot Arm ouput matrix
M_tf_out = zeros(i,j); % Transfer Function output matrix

for k = 1:j
    M_ra_out(:,k) = data_ra.FT_est_0.signals(k).values(:,2);
    M_ra_in(:,k) = data_ra.FT_est_0.signals(k).values(:,1);
end

%% MAE
mae_robot = zeros(1,j);
mae_model = zeros(1,j);

for k = 1:j
   sigma_robot = std(M_ra_in(:,k)); 
   e_robot = M_ra_in(:,k) - M_ra_out(:,k); % robot error
   mae_robot(k) = mean(abs(e_robot))/(6*sigma_robot)*100;
end

fprintf('Mean Absolute Error:\n')
fprintf('    ROBOT\n')
fprintf('Surge = %.2f\n', mae_robot(1))
fprintf('Sway  = %.2f\n', mae_robot(2))
fprintf('Heave = %.2f\n', mae_robot(3))
fprintf('Roll  = %.2f\n', mae_robot(4))
fprintf('Pitch = %.2f\n', mae_robot(5))
fprintf('Yaw   = %.2f\n', mae_robot(6))

%% Plots

if plots_on == 1
% SURGE
figure(1)
    plot(t,M_ra_in(:,1),'--','Color',PINE,'LineWidth',1.2)
    hold on
    plot(t,M_ra_out(:,1),'Color',ORANGE,'LineWidth',1.2)
    legend('Input', 'Output')
    title('Surge - Robotic Arm')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)

% SWAY
figure(2)
    plot(t,M_ra_in(:,2),'--','Color',PINE,'LineWidth',1.2)
    hold on
    plot(t,M_ra_out(:,2),'Color',ORANGE,'LineWidth',1.2)
    legend('Input', 'Output')
    title('Sway - Robotic Arm')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    

% HEAVE
figure(3)
    plot(t,M_ra_in(:,3),'--','Color',PINE,'LineWidth',1.2)
    hold on
    plot(t,M_ra_out(:,3),'Color',ORANGE,'LineWidth',1.2)
    legend('Input', 'Output')
    title('Heave - Robotic Arm')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    
    
% ROLL
figure(4)
    plot(t,M_ra_in(:,4),'--','Color',PINE,'LineWidth',1.2)
    hold on
    plot(t,M_ra_out(:,4),'Color',ORANGE,'LineWidth',1.2)
    legend('Input', 'Output')
    title('Roll - Robotic Arm')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    
    
% PITCH
figure(5)
    plot(t,M_ra_in(:,5),'--','Color',PINE,'LineWidth',1.2)
    hold on
    plot(t,M_ra_out(:,5),'Color',ORANGE,'LineWidth',1.2)
    legend('Input', 'Output')
    title('Pitch - Robotic Arm')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)

    
% YAW
figure(6)
    plot(t,M_ra_in(:,6),'--','Color',PINE,'LineWidth',1.2)
    hold on
    plot(t,M_ra_out(:,6),'Color',ORANGE,'LineWidth',1.2)
    legend('Input', 'Output')
    title('Yaw - Robotic Arm')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    
 %%
figure(7)
subplot(321)
    plot(t,M_ra_out(:,1),'Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_out(:,1),'Color',WAVE,'LineWidth',1.2)
    legend('Robot', 'Model')
    title('Surge Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(323)
    plot(t,M_ra_out(:,2),'Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_out(:,2),'Color',WAVE,'LineWidth',1.2)
    legend('Robot', 'Model')
    title('Sway Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(325)
    plot(t,M_ra_out(:,3),'Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_out(:,3),'Color',WAVE,'LineWidth',1.2)
    legend('Robot', 'Model')
    title('Heave Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(322)
    plot(t,M_ra_out(:,4),'Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_out(:,4),'Color',WAVE,'LineWidth',1.2)
    legend('Robot', 'Model')
    title('Roll Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(324)
    plot(t,M_ra_out(:,5),'Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_out(:,5),'Color',WAVE,'LineWidth',1.2)
    legend('Robot', 'Model')
    title('Pitch Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(326)
    plot(t,M_ra_out(:,6),'Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_out(:,6),'Color',WAVE,'LineWidth',1.2)
    legend('Robot', 'Model')
    title('Yaw Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    
end