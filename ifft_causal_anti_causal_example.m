close all
clear all
clc

G=@(w) 2*(5<=abs(w) & abs(w)<=10);
Y=@(w) G(w-5);

w=-31.4:0.01:31.4-0.01;

dw=w(2)-w(1);

dT=0.1;
t=-100:dT:100;



%% time domain signal y(t) reconstruction using IFT defination 

y=zeros(1,length(t));

dw=w(2)-w(1);

for ii=1:length(w)
    y=y+Y(w(ii))*exp(j*w(ii)*t)*dw/2/pi;
end

figure
subplot(311)
plot(w*dT,Y(w));
xlabel('\Omega')
ylabel('|Y|')
xlim([-2*pi 2*pi]);
set(gca,'xtick',[-2*pi -pi 0 pi 2*pi],'xticklabels',...
    {'-2\pi','-\pi','0','\pi','2\pi'});
title('solving y(t) using definition of IFT')

subplot(312)
plot(t,real(y));
xlabel('t')
ylabel('Re(y)')
title('time domain signal range defined by arbitrary choice of time vector')

subplot(313)
plot(t,imag(y));
xlabel('t')
ylabel('Im(y)')


%% using ifft() to solve the second problem: y(t)
% if you want an anti-causal response we need to 
% use ifftshift() one additional time
% Y=fft(y)
% then the causal reconstruction: y_cr(t)=(ifft(ifftshift(Y)))
% and 

y_cr=(ifft(ifftshift(Y(w))))/dT;

y_acr=ifftshift(ifft(ifftshift(Y(w))))/dT;

% you would need to re-define the time vector because 
% ifft() returns a vector with a length equal to 'Y'
% but the the time step is 'dT'
t_anti_causal= -dT*length(y_cr)/2:dT:dT*length(y_cr)/2-dT;
t_causal= 0:dT:dT*length(y_acr)-dT;

figure
subplot(311)
plot(w*dT,Y(w));
xlabel('\Omega')
ylabel('|Y|')
xlim([-2*pi 2*pi]);
set(gca,'xtick',[-2*pi -pi 0 pi 2*pi],'xticklabels',...
    {'-2\pi','-\pi','0','\pi','2\pi'});
title('solving y(t) using ifft()')


subplot(312)
plot(t_causal,real(y_cr))
xlabel('t')
ylabel('Re(y)')
xlim([-100 700])
title('Causal signal')

subplot(313)
plot(t_anti_causal,real(y_acr))
xlabel('t')
ylabel('Re(y)')
title('Anti-causal signal')


