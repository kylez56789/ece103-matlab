close all
clear all
clc

R=10e3; % (ohm)
C=133e-9; % (F)
m=0.99; % feedback

f=0:0.1:200;
w=2*pi*f;
HBS=((1+m)*((2j*w*R*C).^2+1))./((2j*w*R*C).^2+4*(1-m)*(j*w*R*C)+1);

subplot(211)
plot(f,abs(HBS));
subplot(212)
plot(f,angle(HBS));
