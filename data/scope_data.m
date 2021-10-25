% Extracting Files
data_scope = csvread('data_ft_scope.csv',19,1); %data from O-scope
data_ra       = load('data_ra_3.mat');      %robotic arm
data_step_1   = csvread('step_1.csv',5,1);  %step to 1 kg
data_step_2   = csvread('step_2.csv',5,1);  %step t0 2 kg

% Time Data
t_scope = linspace(0,length(data_scope/10),length(data_scope));
t_lv = linspace(0,length(data_lv/10),length(data_lv));
t_ra = data_ra.Force_1.time(1950:2300,1);

data_ra_m = data_ra.Force_1.signals(1).values(1950:2300,2);
data_ra_d = data_ra.Force_1.signals(1).values(1950:2300,1);

figure(1)
subplot(311)
    plot(t_scope,data_scope)
    title('Scope Fz')
subplot(312)
    plot(t_lv(150:350),data_lv(150:350))
    xlim([150 350])
    title('LabView Fz')
subplot(313)
    plot(t_ra,data_ra_m)
    hold on
    plot(t_ra,data_ra_d)
    legend('measured','desired')
    xlim([1.95 2.3])
    title('Robotic Arm Fz')
    




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

