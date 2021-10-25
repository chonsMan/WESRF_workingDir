%%
% The purpose of this file is to fine the MAR of pose data using 
% the "Cartesian Pose - Internal Mode Contoller" Control Mode.
% Data Format: pose_data_direction_amplitude (pi/5; pi/10;etc...)
%%
visualization
%% 
data = load('pose_data_x_1_pi10.mat');
%data = load('xy_1_pi10.mat');

Ts = 1e-3;
t_end = length(data.control_scope_0.time);
t = linspace(0,t_end*Ts,t_end);

x_input  = data.control_scope_0.signals(1).values(1:t_end,1);
x_output = data.control_scope_0.signals(1).values(1:t_end,2);

% z_input  = data.control_scope_0.signals(2).values(1:t_end,1);
% z_output = data.control_scope_0.signals(2).values(1:t_end,2);

%% MAE
   x_sigma = std(x_input); 
%    z_sigma = std(z_input);
   
   x_e = x_input - x_output; % model error
%    z_e = z_input - z_output;
  
   x_mae = mean(abs(x_e))/(6*x_sigma)*100;
%    z_mae = mean(abs(z_e))/(6*z_sigma)*100;

   fprintf('x_mae = %2f %% \n',x_mae);
   %fprintf('z_mae = %2f\n',z_mae);

%% 
% Note that all positions are the EE pose represented in the base frame
figure(1)
% subplot(211)
    plot(t,x_input,'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,x_output,'Color',WAVE,'LineWidth',1.2)
    hold on
    ylim([max(x_input)*(0.98) max(x_input)*(1.01)])
    legend('Input', 'Output')
    title('Surge')
    
% subplot(212)
%     plot(t,z_input,'--','Color',ORANGE,'LineWidth',1.2)
%     hold on
%     plot(t,z_output,'Color',WAVE,'LineWidth',1.2)
%     hold on
%  
%     legend('Input', 'Output')
%     title('Heave')


    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)