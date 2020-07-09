close all
clear all
clc

%part a
w = -30:0.1:30; %given omega
H = @(w) (1+j.*w)./(1+w.^2); % defining H(w) 

figure();

% plotting Magnitude of H(w)
subplot(211)
plot(w, abs(H(w)))
title('Magnitude |H(\omega)|')
xlabel('\omega(rad/s)')
ylabel('|H(\omega)|')

% plotting Angle of H(w)
subplot(212)
plot(w, angle(H(w)))
title('Angle \angleH(\omega)')
xlabel('\omega(rad/s)')
ylabel('\angleH(\omega)')


%part b
t = -15:0.01:15; % given t

% finding h(t) using the trapz() function
for ii=1:length(t)
    h(ii) = trapz(w, H(w).*exp(j*w*t(ii)))/2/pi;
end

figure();

% plotting real part of h(t)
subplot(211)
plot(t, real(h))
title('Real of h(t)')
xlabel('t(s)')
ylabel('real(h(t))')

% plotting imaginary part of h(t)
subplot(212)
plot(t, imag(h))
title('Imag of h(t)')
xlabel('t(s)')
ylabel('imag(h(t))')

%part c
X = @(w)2*sinc(5*w/pi).*exp(-5*j*w); % defining X(w) to find Y(w)
Y = H(w).*X(w); % defining Y(w)

% finding y(t) using the trapz() function
for ii=1:length(t)
    y(ii) = trapz(w, Y.*exp(j*w*t(ii)))/2/pi;
end

figure();

% plotting real part of y(t)
subplot(211)
plot(t, real(y))
title('Real of y(t)')
xlabel('t(s)')
ylabel('real(y(t))')

% plotting imaginary part of y(t)
subplot(212)
plot(t, imag(y))
title('Imag of y(t)')
xlabel('t(s)')
ylabel('imag(y(t))')




