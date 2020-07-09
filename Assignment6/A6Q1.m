close all
clear all
clc

%a
f = 0:0.1:200;
w = 2*pi*f;
R = 10e3;
C = 133e-9;
m1 = 0.8;
m2 = 0.9;
H_1 = ((1+m1)*((2j*w*R*C).^2+1))./((2j*w*R*C).^2+4*(1-m1)*(j*w*R*C)+1);
H_2 = ((1+m2)*((2j*w*R*C).^2+1))./((2j*w*R*C).^2+4*(1-m2)*(j*w*R*C)+1);
figure()

subplot(411)
plot(f, abs(H_1))
title('Magnitude H(\omega) m = 0.8');
xlabel('f(Hz)')
ylabel('|H(\omega)|')

subplot(412)
plot(f, angle(H_1))
title('Phase H(\omega) m = 0.8');
xlabel('f(Hz)')
ylabel('\angleH(\omega)')

subplot(413)
plot(f, abs(H_2))
title('Magnitude H(\omega) m = 0.9');
xlabel('f(Hz)')
ylabel('|H(\omega)|')

subplot(414)
plot(f, angle(H_2))
title('Phase H(\omega) m = 0.9');
xlabel('f(Hz)')
ylabel('\angleH(\omega)')

%b

load ecg_signal.mat;
x_t = ecg;
dT = t(2)-t(1);
T = length(t)*dT;
%f = linspace(-250, 250, length(t));
%w = 2*pi*f;
W = linspace(-pi, pi, length(x_t));
w = W/dT;
f = w/2/pi;
dw = w(2)-w(1);
H_w = ((1+m2)*((2j*w*R*C).^2+1))./((2j*w*R*C).^2+4*(1-m2)*(j*w*R*C)+1);
X_w = fftshift(fft(x_t,length(x_t))*dT);
Z_w = X_w.*H_w;
z_t = ifft(ifftshift(Z_w))/dT;

figure()

subplot(411)
plot(t, x_t)
title('x(t)')
xlabel('t(s)')
ylabel('x(t)')

subplot(412)
plot(f, X_w)
title('X(f)')
xlabel('f(Hz)')
ylabel('X(f)')

subplot(413)
plot(f, Z_w);
title('Z(f)')
xlabel('f(Hz)')
ylabel('Z(f)')

subplot(414)
plot(t, z_t)
title('z(t)')
xlabel('t(s)')
ylabel('z(t)')
