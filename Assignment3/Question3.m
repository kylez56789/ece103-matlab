close all
clear all
clc

dT=1/20/400/pi;
t=-0.1:dT:0.1;
w=@(t)sin(400*pi*t);
h=@(t)400*exp(t*-200).*cos(400*pi*t).*(t>=0);
x=@(t)(cos(100*pi*t)+sin(400*pi*t)-cos(800*pi*t)).*(t>=0);

y=conv(x(t),h(t))*dT;
ty=min(t)+min(t):dT:max(t)+max(t);

figure(1)
subplot(411);
plot(t, w(t));
xlabel('t');
ylabel('w(t)');
grid;

subplot(412);
plot(t, x(t));
xlabel('t');
ylabel('x(t)');
grid;

subplot(413);
plot(t, h(t), 'b');
xlabel('t');
ylabel('h(t)');
grid;

subplot(414);
plot(ty, y, 'b');
xlabel('t');
ylabel ('y(t) =  x(t)*h(t)');
xlim([min(t) max(t)])
grid;