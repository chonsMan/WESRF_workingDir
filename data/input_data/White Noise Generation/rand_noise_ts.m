%% This code generates a white noise time series
%%
rn_end_t = 50e3;
% One second white noise time series
rn1 = load('rand_noise1.mat').xFilt(1:rn_end_t);
rn2 = load('rand_noise2.mat').xFilt(1:rn_end_t);
rn3 = load('rand_noise3.mat').xFilt(1:rn_end_t);
rn4 = load('rand_noise4.mat').xFilt(1:rn_end_t)/2;
rn5 = load('rand_noise5.mat').xFilt(1:rn_end_t);
rn6 = load('rand_noise6.mat').xFilt(1:rn_end_t);

t=linspace(0,length(rn1)/1000,length(rn1));

rn1_ts = timeseries(rn1,t);
rn2_ts = timeseries(rn2,t);
rn3_ts = timeseries(rn3,t);
rn4_ts = timeseries(rn4,t);
rn5_ts = timeseries(rn5,t);
rn6_ts = timeseries(rn6,t);

% Convert pre-calculated continuous transfer functions to discrete
% ctf = load('tf_out.mat'); 



    
   
    


