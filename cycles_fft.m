close all
clear all
clc
set(0,'DefaultAxesFontSize',30);  % set the font size of plot window 
%%
dT=0.001;
t1 = 0:dT:2-dT; % Time vector 
t2=0:dT:1-dT;
f = 5; % Create a square wave of f Hz.
x1 = 2*cos(2*pi*t1*f);  % 10 cycles
x2 = 2*cos(2*pi*t2*f);  % 5 cycles

figure (1)
subplot(211)
plot(t1,x1);
xlabel('t');
title('10 cycles')

subplot(212)
plot(t2,x2);
xlabel('t');
title('5 cycle')



X1 = fft(x1,100*length(x1))*dT;  % fft() does not keep track of temporal information of signal
                                 % we need to multiply with dT 
X2 = fft(x2,100*length(x2))*dT;  % fft() does not keep track of temporal information of signal
                                 % we need to multiply with dT 

% Frequency vector
W1=linspace(-pi,pi,length(X1));  % discrete angular freq
w1=W1/dT;  % angular freq
f1=w1/2/pi;

W2=linspace(-pi,pi,length(X2));  % discrete angular freq
w2=W2/dT;  % angular freq
f2=w2/2/pi;



figure(2);
subplot(211)
plot(f1,abs(fftshift(X1)));
xlabel('frequency (Hz)');
title('X1: 10 cycles ');


subplot(212)
plot(f2,abs(fftshift(X2)));
xlabel('frequency (Hz)');
title('X2: 5 cycle');

