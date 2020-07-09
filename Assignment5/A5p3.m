close all
clear all
clc

G=@(w) 2*(5<=abs(w) & abs(w)<=10);
H=@(w) 5*abs(w).*(abs(w)<=20);
w=-31.4:0.01:31.4;
t=-100:0.1:100;
M=G(w).*H(w);

for ii=1:length(t)
    m(ii)=trapz(w,(1/(2*pi))*M.*exp(j*w*t(ii)));
end

energy_time=trapz(t,abs(m).^2)
energy_frequency=trapz(w,abs(M).^2)/2/pi
