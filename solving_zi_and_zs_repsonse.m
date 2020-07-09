%% diff eq of system: D2y+ 3Dy+ 2y= Dx, with BC y(0)=0 and vc(0)=5
close all
clear all
clc

%% zero-input response: x=0, from KVL Dy(0)=-5
y_zi=dsolve('D2y+3*Dy+2*y=0','y(0)=0','Dy(0)=-5','t');
disp(['zero-input response = (',char(y_zi),')u(t)']);

%% zero-state response: vc(0)=0, x=10exp(-3t), Dx=-30exp(-3t) and from KVL Dy(0)=10
y_zs=dsolve('D2y+3*Dy+2*y=-30*exp(-3*t)','y(0)=0','Dy(0)=10','t');
disp(['zero-state response = (',char(y_zs),')u(t)']);

%%
 y_zs_f=@(t) (20*exp(-2*t) - 5*exp(-t) - 15*exp(-3*t)).*(t>=0);
t=-1:0.01:5;
subplot(311)
plot(t,y_zs_f(t))
xlabel('time')
title('zero-state response for x(t)=10e^{-3t}u(t)')

%%
y_zi_f=@(t) (5*exp(-2*t) - 5*exp(-t)).*(t>=0);
t=-1:0.01:5;
subplot(312)
plot(t,y_zi_f(t))
xlabel('time')
title('zero-input response for x(t)=10e^{-3t}u(t)')

% total response

subplot(313)
plot(t,y_zs_f(t)+y_zi_f(t))
xlabel('time')
title('total response for x(t)=10e^{-3t}u(t)')
