close all
clear all
clc

h1=dsolve('100*D2y+20*Dy+1*y=0','y(0)=0','Dy(0)=1','t');
disp(['impulse response h(t) = (',char(h1),')u(t)']);
h2=dsolve('100*D2y+0.2*Dy+1*y=0','y(0)=0','Dy(0)=1','t');
disp(['impulse response h(t) = (',char(h2),')u(t)']);

clear h1
clear h2

h1=@(t) (t.*exp(-t/10)).*(t>=0);
h2=@(t) ((1000*1111^(1/2)*exp(-t/1000).*sin((3*1111^(1/2)*t)/1000))/3333).*(t>=0);

t=-10:0.1:300;
figure(1)
plot(t,h1(t));
xlabel('time')
ylabel('impulse response h1(t)')

figure(2)
plot(t,h2(t));
xlabel('time')
ylabel('impulse response h2(t)')