close all
clear all
clc

set(0,'DefaultAxesFontSize',30);  % set the font size of plot window 

%% single period defination
dT=0.001;
t1=dT:dT:1;
t2=1+dT:dT:2;

% t2=1+dT:dT:6;

x1=5*ones(size(t1));
x2=-5*ones(size(t2));
x=[x1 x2];
t=[t1 t2];
N0=length(t);

%% 
T=N0*dT;
w0=2*pi/T; 

%% exponential FS

Nk=length(t);

k=-floor(Nk/2):floor(Nk/2)-1; 

for ii=1:length(k)
    Ck(ii)=(1/T)*trapz(t, x.*exp(-j*k(ii)*w0*t));
end


figure(1)
title('FS analytical')
subplot(211)
stem(k,abs(Ck))
xlabel('k')
xlim([-50 50])
hold on

subplot(212)
stem(k,angle(Ck)*180/pi)
xlabel('k')
xlim([-50 50])
hold on



%% FS using fft()

Ckfft=fftshift(fft(x))*dT/T; % scaling factors fft():dT & FS coefficients:1/T 

k_fft=-floor(length(Ckfft)/2):floor(length(Ckfft)/2)-1;

figure(1)
subplot(211)
stem(k_fft,abs(Ckfft),'.--')
xlim([-50 50])
ylabel('|Ck|')

subplot(212)
stem(k,angle(Ckfft)*180/pi)
xlabel('k')
hold on
xlim([-50 50])
ylabel('\angleCk')

%%
x_reconstracted=zeros(1,length(t));

for ii=1:length(k)
    x_reconstracted=x_reconstracted+Ck(ii)*exp(j*k(ii)*w0*t);
end

figure (2)
plot(t,fftshift(ifft(ifftshift(T*Ckfft)))/dT);  % fft() values = T*FSCofficients
                                    % ifft() scaling factor= 1/T
hold on
plot(t,x_reconstracted,'--')

xlabel('time')
ylabel('x')

