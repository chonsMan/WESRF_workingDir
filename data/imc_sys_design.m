tf_funcs = load('tf_8s_2p_0z.mat');
surge_num = tf_funcs.tf_8s_2p_0z.Numerator{1,1};
surge_den = tf_funcs.tf_8s_2p_0z.Denominator{1,1};
delay = 1e-3;
s=tf('s');
Ts = 1e-3;

Gp_p = tf(surge_num,surge_den);
Gp_n = (1-delay*s)/(1+delay*s); % Pade approx
Gp   = Gp_p*Gp_n;

Gc = inv(Gp_p);

%% 
% G(s) = w^2/(s^2 + 2*zeta*w*s + w^2) <--Standard Form
% tau = 1/(zeta*w)
% Need 2x setling time on filter
tau_Gp  = 1/(surge_den(2)/2);
Tset_Gp = 5*tau_Gp; %settling time 

Tset_Gf = Tset_Gp/2;
% tau_f = Tset_Gf/5/;  %Tset = 5*tau
tau_f = 1/(20*2*pi);

Gf = tf(1, [tau_f 1]);

Gimc = inv(Gp_p)*(Gf^2);
Gpid = Gimc/(1-Gp_n*Gf);

Gpid_dt = c2d(Gpid, Ts);
Gp_p_dt = c2d(Gp_p, Ts);

[num_Gp,den_Gp] = tfdata(Gp_p_dt,'v');
[num_pid,den_pid] = tfdata(Gpid_dt,'v');
[a,b,c,d] = tf2ss(num_pid,den_pid);

%%
xz_num = tf_funcs.tf_8s_2p_0z.Numerator{1,3};
xz_den = tf_funcs.tf_8s_2p_0z.Denominator{1,3};

[xz_a,xz_b,xz_c,xz_d]=tf2ss(xz_num,xz_den);

heave_num = tf_funcs.tf_8s_2p_0z.Numerator{3,3};
heave_den = tf_funcs.tf_8s_2p_0z.Denominator{3,3};

[heave_a,heave_b,heave_c,heave_d]=tf2ss(heave_num,heave_den);
