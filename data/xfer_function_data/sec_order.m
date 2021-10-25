%%
close all
clc
clear
format compact
%%
load('Fx_data_1.mat');
    t_fx = FT_est_0.time;
    u_fx = FT_est_0.signals(1).values(:,1);
    F_x  = FT_est_0.signals(1).values(:,2);
    
load('Fy_data_1.mat');
    t_fy = FT_est_0.time;
    u_fy = FT_est_0.signals(2).values(:,1);
    F_y  = FT_est_0.signals(2).values(:,2);
    
load('Fz_data_1.mat');
    t_fz = FT_est_0.time;
    u_fz = FT_est_0.signals(3).values(:,1);
    F_z  = FT_est_0.signals(3).values(:,2);

load('Mx_data_1.mat');
    t_mx = FT_est_0.time;
    u_mx = FT_est_0.signals(4).values(:,1);
    M_x =  FT_est_0.signals(4).values(:,2);
    
load('My_data_1.mat');
    t_my = FT_est_0.time;
    u_my = FT_est_0.signals(5).values(:,1);
    M_y =  FT_est_0.signals(5).values(:,2);
    
load('Mz_data_1.mat');
    t_mz = FT_est_0.time;
    u_mz = FT_est_0.signals(6).values(:,1);
    M_z  = FT_est_0.signals(6).values(:,2);
    
%%
figure()
plot(t_fx, u_fx);
hold on
plot(t_fx, F_x);
xlim([4.99 5.01])
ylim([-2 11])