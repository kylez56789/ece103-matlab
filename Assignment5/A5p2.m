close all
clear all
clc

G=@(w) 2*(5<=abs(w) & abs(w)<=10);
H=@(w) 5*abs(w).*(abs(w)<=20);
w=-31.4:0.01:31.4;
t=-100:0.1:100;
M=G(w).*H(w);

figure
subplot(211)
plot(w,abs(M))
title('Magnitude |M|')
ylabel('|M|')
xlabel('\omega')

subplot(212)
plot(w, angle(M)*180/pi)
title('Phase \angleM')
ylabel('\angleM')
xlabel('\omega')

for ii=1:length(t)
    m(ii)=trapz(w,(1/(2*pi))*M.*exp(j*w*t(ii)));
end

figure
subplot(211)
plot(t,real(m));
title('Re(m(t))')
xlabel('t')
ylabel('Re(m)')

subplot(212)
plot(t,imag(m));
title('Im(m(t))')
xlabel('t')
ylabel('Im(m)')