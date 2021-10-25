%%
% The purpose of this file is to fine the MAE of pose data using 
% the "Cartesian Pose - Internal Mode Contoller" Control Mode.
% Data Format: pose_data_direction_amplitude (pi/5; pi/10;etc...)
%%
visualization
%% 
data = load('x_dir_step.mat');

length_t = length(data.data_0.time);
t = linspace(0,length_t/1e3,length_t);

data_ref = data.data_0.signals(1).values*100; % *100 m --> cm
data_out = data.data_0.signals(2).values*100;

error = abs(mean(data_out(4500:5000))-mean(data_ref(4500:5000)));
%% 
figure(1)
    plot(t,data_ref,'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,data_out,'Color',WAVE,'LineWidth',1.2)
    legend('reference', 'output')
    title('Step Response in Impedance Control Mode (e=0.43 cm)')
    ylim([30 45])
    xlim([2.5 5])
    xlabel('time [s]');
    ylabel('displacement [cm]')
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.5])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze)