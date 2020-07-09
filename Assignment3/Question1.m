close all
clear all
clc

y_n=dsolve('(2*D2y)+Dy+(4*y)=0','y(0)=0','Dy(0)=1','t');
h=diff(y_n);
disp(['impulse response h(t) = (',char(h),')u(t)']);

h=@(t) (exp(-t/4).*cos((31^(1/2)*t)/4) - (31^(1/2)*exp(-t/4).*sin((31^(1/2)*t)/4))/31).*(t>=0);
t = -10:0.1:30;
figure(1)
plot(t,h(t));
xlabel('time')
ylabel('impulse response h(t)')