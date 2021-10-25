d1 = load('rand_noise1.mat').xFilt(1:120e3);
d2 = load('rand_noise2.mat').xFilt(1:120e3);
d3 = load('rand_noise3.mat').xFilt(1:120e3);
d4 = load('rand_noise4.mat').xFilt(1:120e3);
d5 = load('rand_noise5.mat').xFilt(1:120e3);
d6 = load('rand_noise6.mat').xFilt(1:120e3);

t = linspace(0, length(d1)/1000, length(d1));

d1_ts = timeseries(d1,t);
d2_ts = timeseries(d2,t);
d3_ts = timeseries(d3,t);
d4_ts = timeseries(d4,t);
d5_ts = timeseries(d5,t);
d6_ts = timeseries(d6,t);

% figure(1)
% plot(d1.xFilt)
% hold on
% plot(d2.xFilt)
% hold on
% plot(d3.xFilt);
% hold on
% plot(d4.xFilt);
% hold on
% plot(d5.xFilt);
% hold on 
% plot(d6.xFilt);