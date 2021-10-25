%%
% clear 
% clc

visualization
%%
imc = load('x_imc_ss.mat');
og  = load('x_og_data.mat');
imc2 = load('x_imc_ss_2.mat');

Ts = 1e-3;
t_end = min(length(og.FT_est_0.signals(1).values),...
            length(imc.FT_est_0.signals(1).values));
t = linspace(0,t_end*Ts,t_end);

input    = imc.FT_est_0.signals(1).values((1:t_end),1);
surge_imc = imc.FT_est_0.signals(1).values((1:t_end),2);
surge_og = og.FT_est_0.signals(1).values((1:t_end),2);
surge_imc2 = imc2.FT_est_0.signals(1).values((1:t_end),2);


%% MAE
   sigma = std(input); 
   
   e_imc = input - surge_imc; % model error
   e_og  = input - surge_og;  % robot error
  
   mae_imc = mean(abs(e_imc))/(6*sigma)*100;
   mae_og  = mean(abs(e_og ))/(6*sigma)*100;
   
   fprintf('MAE IMC = %2f\n',mae_imc);
   fprintf('MAE_og  = %2f\n',mae_og);

%%
figure(1)
subplot(211)
    plot(t,input,'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,surge_imc,'Color',PINE,'LineWidth',1.2)
    hold on
    plot(t,surge_og,'Color',WAVE','LineWidth',1.2)
    hold on
    plot(t,surge_imc2)
    legend('Input', 'IMC_{out}', 'OG_{out}','IMC2_{out}')
    title('Surge - Robotic Arm')
subplot(212)
    plot(t,input,'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,surge_imc,'Color',PINE,'LineWidth',1.2)
    hold on
    plot(t,surge_og,'Color',WAVE','LineWidth',1.2)
    hold on
    plot(t, surge_imc2)
    legend('Input', 'IMC_{out}', 'OG_{out}','IMC2_{out}')
    xlim([1 2])
    
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)