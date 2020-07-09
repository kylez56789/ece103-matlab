close all
clear all
clc

%part a
w = -10:0.01:10; % given w
t = -20:0.1:20; % given t
x = sinc(pi*t); % defining x

% finding X(w)
for ii=1:length(w)
    Xw(ii)= trapz(t, x.*exp(-j*w(ii)*t));
end

figure();

%plotting Magnitude of X(w)
subplot(211)
plot(w, abs(Xw))
title('Magnitude |X(\omega)|')
xlabel('\omega(rad/s)')
ylabel('|X(\omega)|')

%plotting Angle of X(w)
subplot(212)
plot(w, angle(Xw))
title('Angle \angleX(\omega)')
xlabel('\omega(rad/s)')
ylabel('\angleX(\omega)')

%part b
% finding energy in time domain
E_t = trapz(t,abs(x).^2)

%part c
% finding energy in frequency domain
E_w = trapz(w,abs(Xw).^2)/2/pi