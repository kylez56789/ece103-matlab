close all
clear all
clc


%% exponentially growing signal/system impulse response :unbound-can't do
% Fourier (series/transformation) anlysis
x=@(t) exp(2*t).*(t>=0);
t=-10:0.01:10;

plot(t,x(t))
xlabel('t')
ylabel('x(t)')
grid on


%% in order to do Fourier like analysis: we multiply 
% the signal/system response with an exponentially decaying signal
% here we are using exp(-2.35*t) as the decay factor
z=@(t) x(t).*exp(-2.35*t);
figure
plot(t,z(t))
xlabel('t')
ylabel('z(t)')
grid on

%% performing Fourier Transformation on the forced-bound signal
dT=t(2)-t(1);
w=linspace(-pi/dT,pi/dT,length(z(t)));
dw=w(2)-w(1);

for ii=1:length(w)
    Z(ii)=trapz(t,z(t).*exp(-j*w(ii)*t));
end

figure
subplot(211)
plot(w,abs(Z))
xlabel('\omega (rad/s)')
ylabel('|Z|')
grid on

subplot(212)
plot(w,angle(Z))
xlabel('\omega (rad/s)')
ylabel('\angleZ')
grid on

%% time-domain reconstruction of forced-bound signal
z_r=zeros(1,length(t));

for ii=1:length(w)
    z_r=z_r+Z(ii)*exp(j*w(ii)*t)*dw/2/pi;
end

figure
subplot(212)
plot(t,z_r)
xlabel('t');
ylabel('$$\hat{z}$$','Interpreter','Latex')
title('reconstracted fourced-bound signal')
grid on

subplot(211)
plot(t,z(t))
xlabel('t')
ylabel('z(t)')
grid on

%% time-domain reconstruct of unbound signal by dividing with the decay factor
x_r=real(z_r).*exp(2.35*t);
figure
subplot(212)
plot(t,x_r)
xlabel('t')
ylabel('$$\hat{x}$$','Interpreter','Latex')
title('reconstracted original unbound signal')
grid on

subplot(211)
plot(t,x(t))
xlabel('t')
ylabel('x(t)')
grid on