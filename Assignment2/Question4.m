clear all

t=-1:0.001:1;
single_period=0.25:0.01:0.75;
period_of_signal=0.75-0.25;
g = @(t)3*pi*sin(8*pi*t+1.3).*cos(4*pi*t-0.8).*exp(sin(12*pi*t));
energy_period=trapz(single_period,abs(g(single_period)).^2)
power=energy_period/period_of_signal
