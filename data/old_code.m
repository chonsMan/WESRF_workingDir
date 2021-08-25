% SURGE
figure(1)
subplot(211)
    plot(t,M_ra_in(:,1),'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_in(:,1),'-','Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Surge Inputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(212)
    plot(t,M_ra_out(:,1),'Color',ORANGE,'LineWidth',1.2)
    hold on 
    plot(t,M_tf_out(:,1),'Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Surge Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)

% SWAY
figure(2)
subplot(211)
    plot(t,M_ra_in(:,2),'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_in(:,2),'-','Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Sway Inputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(212)
    plot(t,M_ra_out(:,2),'Color',ORANGE,'LineWidth',1.2)
    hold on 
    plot(t,M_tf_out(:,2),'Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Sway Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)

% HEAVE
figure(3)
subplot(211)
    plot(t,M_ra_in(:,3),'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_in(:,3)*(-1),'-','Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Heave Inputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    
subplot(212)
    plot(t,M_ra_out(:,3),'Color',ORANGE,'LineWidth',1.2)
    hold on 
    plot(t,M_tf_out(:,3)*(-1),'Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Heave Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    
% ROLL
figure(4)
subplot(211)
    plot(t,M_ra_in(:,4),'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_in(:,4),'-','Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Roll Inputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(212)
    plot(t,M_ra_out(:,4),'Color',ORANGE,'LineWidth',1.2)
    hold on 
    plot(t,M_tf_out(:,4),'Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Roll Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    
% PITCH
figure(5)
subplot(211)
    plot(t,M_ra_in(:,5),'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_in(:,5),'-','Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Pitch Inputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(212)
    plot(t,M_ra_out(:,5),'Color',ORANGE,'LineWidth',1.2)
    hold on 
    plot(t,M_tf_out(:,5),'Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Pitch Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    
% YAW
figure(6)
subplot(211)
    plot(t,M_ra_in(:,6),'--','Color',ORANGE,'LineWidth',1.2)
    hold on
    plot(t,M_tf_in(:,6),'-','Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Yaw Inputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
subplot(212)
    plot(t,M_ra_out(:,6),'Color',ORANGE,'LineWidth',1.2)
    hold on 
    plot(t,M_tf_out(:,6),'Color',WAVE,'LineWidth',1.2)
    legend('Robotic Arm', 'Transfer Function')
    title('Yaw Outputs')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    
    
    
    
    
    
    
    
    
    
    % SURGE
figure(7)

    plot(t,M_ra_in(:,1),'--','Color',ORANGE,'LineWidth',2)
    hold on
    plot(t,M_ra_out(:,1),'Color',PINE,'LineWidth',1.2)
    hold on 
    plot(t,M_tf_out(:,1),'Color',WAVE,'LineWidth',1.2)
    legend('Input','Robot Output', 'Transfer Function Output')
    title('Surge')
    
    set(gcf, 'Units', 'inches', 'Position',...
        [2 2 clmnwdth_inches clmnwdth_inches/2.8])
    set(gca, 'FontName', fnttype, 'FontSize', fntsze*1.1)
    