close all
clear all
clc

g=@(t) 3*pi*sin(8*pi*t+1.3).*cos(4*pi*t-0.8).*exp(sin(12*pi*t));

dT=0.001;
t_energy=0.25:dT:30.75;  % time window for calculating energy
t_period= -0.627:dT:-0.127; % time window of a signle period from p1
T=-0.127-(-0.627);


% plot(-10:0.001:10,g(-10:0.001:10))
energy_time=trapz(t_energy,abs(g(t_energy)).^2)

power_time=trapz(t_period,abs(g(t_period)).^2)/T

%% frequency domain calculation
 
% FS
w0=2*pi/T; 

% k=-3:3;
% k=-10:10;
k=-100:100;

for ii=1:length(k)
    Ck(ii)=(1/T)*trapz(t_period, g(t_period).*exp(-j*k(ii)*w0*t_period));
end

power_freq=sum(abs(Ck).^2)  

% figure
% stem(k,abs(Ck))


% %FT
W=linspace(-pi,pi,20*length(t_energy));  % discrete angular freq
w=W/dT;  % angular freq

G=fftshift(fft(g(t_energy),20*length(t_energy))*dT);
energy_freq=trapz(w,abs(G).^2)/2/pi




