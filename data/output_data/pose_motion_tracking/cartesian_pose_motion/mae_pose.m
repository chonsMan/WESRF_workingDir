%%
% The purpose of this file is to fine the MAR of pose data using 
% the "Cartesian Pose - Internal Mode Contoller" Control Mode.
% Data Format: pose_data_direction_amplitude (pi/5; pi/10;etc...)
%%
visualization
%% 
data = load('x_data.mat');

Ts = 1e-3;
t_end = length(data.data_0.time);
t = linspace(0,t_end*Ts,t_end);

x_input  = data.data_0.signals(1).values(1:t_end,1);
x_output = data.data_0.signals(1).values(1:t_end,2);

%% MAE
   x_sigma = std(x_input); 
   
   x_e = x_input - x_output; % model error
  
   x_mae = mean(abs(x_e))/(6*x_sigma)*100;

   fprintf('x_mae = %2f %% \n',x_mae);
%% 
% Note that all positions are the EE pose represented in the base frame
figure(1)
% subplot(211)
    plot(t,x_input,'Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,x_output,'-.','Color',WAVE,'LineWidth',1.2)
    hold on
    ylim([0.3 0.45]);
    legend('reference', 'output')
    title('Surge Displacement with Cartesian Mode IMC (mae=0.14%)')
    



    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze)