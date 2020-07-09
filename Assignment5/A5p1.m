close all
clear all
clc

dw=0.01;
w=-31.4:dw:31.4;
dT=0.1;
t=-100:dT:100;
G=@(w) 2*(5<=abs(w) & abs(w)<=10);

g=zeros(1,length(t));
for ii=1:length(t)
    g(ii)=trapz(w,(1/(2*pi))*G(w).*exp(j*w*t(ii)));
end

figure (1)
subplot(311)
plot(w,G(w));
title('G(\omega)')
xlabel('\omega')
ylabel('|G|')

subplot(312)
plot(t,real(g));
title('Re(g(t))')
xlabel('t')
ylabel('Re(g)')

subplot(313)
plot(t,imag(g));
title('Im(g(t))')
xlabel('t')
ylabel('Im(g)')

Y=@(w) G(w-5);

figure (2)

y=zeros(1,length(t));

dw=w(2)-w(1);

for ii=1:length(w)
    y=y+Y(w(ii))*exp(j*w(ii)*t)*dw/2/pi;
end

subplot(311)
plot(w,Y(w));
title('Y(\omega)')
xlabel('\omega')
ylabel('|Y|')

subplot(312)
plot(t,real(y));
title('Re(y(t))')
xlabel('t')
ylabel('Re(y)')

subplot(313)
plot(t,imag(y));
title('Im(y(t))')
xlabel('t')
ylabel('Im(y)')
