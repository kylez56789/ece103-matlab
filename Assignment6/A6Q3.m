close all
clear all
clc

m = [6, 0, 4, -6, 2]; %the message
fc = 500e3; %carrier frequency
fm = fc/10; %message frequency

fs = 10*fc;
dT = 1/fs;
t = 0:dT:(length(m)/fm)-dT;
last = (length(m)/fm);

xc = cos(2*pi*fc*t); %carrier signal
W = linspace(-pi, pi, length(xc));
w = W/dT;
f = w/2/pi;
lo = cos((2*pi*fc*t) + (pi/3)); %local oscillator

xm = [];
for ii=1:length(m)
    xm=[xm m(ii)*ones(1,length(t)/length(m))];
end

s = xm .* xc; %modulated signal - transmitted signal
S = fftshift(fft(s,length(s))*dT);
v = s .* lo; %modulated signal - receiving signal
V = fftshift(fft(v, length(v))*dT);

H = 2*(abs(f) < fc);
Vo_f = H.*V;
vo_t = ifft(fftshift(Vo_f))/dT;

figure()
subplot(411)
plot(t, s)
xlabel('t(s)')
ylabel('s(t)')
title('Modulated Carrier Signal in Time Domain')

subplot(412)
plot(f, abs(S))
xlabel('f(Hz)')
ylabel('|S(f)|')
title('Modulated Carrier Signal in Frequency Domain')

subplot(413)
plot(t,vo_t)
xlabel(t)
xlabel('t(s)')
ylabel('vo(t)')
title('Deodulated and Low-Pass Filtered Signal in Time Domain')

subplot(414)
plot(f,abs(Vo_f))
xlabel('f(Hz)')
ylabel('|Vo(f)|')
title('Deodulated and Low-Pass Filtered Signal in Frequency Domain')