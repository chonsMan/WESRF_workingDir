

tau_f = 1e-3*2;
n = 4;
s=tf('s');

lpf = 1/((1+tau_f*s)^n);
