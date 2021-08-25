%% Visualization Parameters
savefig = 1;    %variable if the figure should be save everytime the script is run
fileformat = '-depsc';  %use vector graphics (-dsvg,-dpdf,-depsc... see print properties)

clmnwdth_pt = 506;  %obtained in latex with: \the \columnwidth
clmnwdth_inches = clmnwdth_pt/72; %one inch has 72 pt
fntsze = 10;    
fnttype = 'Times New Roman';

ORANGE = [215 63 9]/255; %color definition in rgb. From 8 bit to 0...1
MOSS   = [196 214 164]/255;
WAVE   = [13 82 87]/255;
BINE   = [170 157 46]/255;
PINE   = [74 119 60]/255;


%% EXAMPLE

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set(gcf, 'Units', 'inches', 'Position',...
%     [2 2 clmnwdth_inches clmnwdth_inches/3])
% set(gca, 'FontName', fnttype, 'FontSize', fntsze)
% legend('Power', 'Interpreter','latex')   
% xlabel('Time [s]');
% 
% if savefig
%    print('sim_vs_real', fileformat); 
% end