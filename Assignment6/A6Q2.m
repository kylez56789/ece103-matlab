close all
clear all
clc

load ecg_signal.mat;
R = 10e3;
C = 133e-9;
m = 0.9;
x_t = ecg;
dT = t(2)-t(1);
T = length(t)*dT;
f = linspace(-250, 250, length(t));
w = 2*pi*f;
dw = w(2)-w(1);
H_w = ((1+m)*((2j*w*R*C).^2+1))./((2j*w*R*C).^2+4*(1-m)*(j*w*R*C)+1);
X_w = fftshift(fft(x_t,length(x_t))*dT);
Z_w = X_w.*H_w;
z_t = ifft(ifftshift(Z_w))/dT;

energy_xt = trapz(t, abs(x_t).^2)
energy_Xw=trapz(w,abs(X_w).^2)/2/pi
energy_zt = trapz(t, abs(z_t).^2)
energy_Zw=trapz(w,abs(Z_w).^2)/2/pi

figure()
subplot(211)
plot(f, abs(X_w).^2)
title('Energy(X)')
xlabel('f(Hz)')
ylabel('E(J)')

subplot(212)
plot(f, abs(Z_w).^2)
title('Energy(Z)')
xlabel('f(Hz)')
ylabel('E(J)')

