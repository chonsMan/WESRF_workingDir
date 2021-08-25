%% Data Extraction
% This file contains code that will generates an iddata object to be used
% in the System Identification Toolbox.
% INPUTS: 6 DOF outputs from robotic arm
%% Data to be used for System Identification
comp_data = 1; % Is there data to compare?
series = 2; % what data set?
raw_data = load('rn_6dof_input.mat');
Ts = 1e-3;
t_end = 12 * (1/Ts); % # seconds * sample freq. for estimation

u1 = raw_data.FT_est_0.signals(1).values(1:t_end,1);
y1 = raw_data.FT_est_0.signals(1).values(1:t_end,2);
u2 = raw_data.FT_est_0.signals(2).values(1:t_end,1);
y2 = raw_data.FT_est_0.signals(2).values(1:t_end,2);
u3 = raw_data.FT_est_0.signals(3).values(1:t_end,1);
y3 = raw_data.FT_est_0.signals(3).values(1:t_end,2);
u4 = raw_data.FT_est_0.signals(4).values(1:t_end,1);
y4 = raw_data.FT_est_0.signals(4).values(1:t_end,2);
u5 = raw_data.FT_est_0.signals(5).values(1:t_end,1);
y5 = raw_data.FT_est_0.signals(5).values(1:t_end,2);
u6 = raw_data.FT_est_0.signals(6).values(1:t_end,1);
y6 = raw_data.FT_est_0.signals(6).values(1:t_end,2);

u = [u1 u2 u3 u4 u5 u6];
y = [y1 y2 y3 y4 y5 y6];

data = iddata(y,u,Ts);
%% Run systemIdentification and attain transfer functions