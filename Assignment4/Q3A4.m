close all
clear all
clc


%% single period defination
z=@(t) t.^3-2j*pi*t.^2;
t_single_period=0:0.01:5; % single period is from 0 to 2
z_single_period=z(t_single_period);

%% period and fundamental angular freq.
T=5;
w0=2*pi/T; 
k=-25:25;

for ii=1:length(k)
    C_k(ii)=(1/T)*trapz(t_single_period, z_single_period.*exp(-j*k(ii)*w0*t_single_period));
end

w0k=w0*k;  
figure (2)
subplot(211)
stem(w0k,abs(C_k))

legend('Magnitude spectrum |C_k| for k=-25:25')
xlabel('\omega')

subplot(212)
stem(w0k,angle(C_k)*180/pi);

legend('Phase spectrum \angleC_k for k=-25:25')
xlabel('\omega')
ylabel('degrees')

%% replicating single period
periods=2;
z_extended=repmat(z_single_period,1,periods);
t_extended=linspace(t_single_period(1),periods*(t_single_period(end)-t_single_period(1)),length(z_extended));


figure (1)
subplot(211)
plot(t_extended,real(z_extended));
xlabel('t')
hold on

subplot(212)
plot(t_extended,imag(z_extended));
xlabel('t')
hold on

%% signal reconstruction

t_reconstracted=linspace(t_single_period(1),periods*(t_single_period(end)-t_single_period(1)),...
    periods*length(z_single_period));
x_reconstracted=zeros(1,length(t_reconstracted));  


for ii=1:length(k)
    x_reconstracted=x_reconstracted+C_k(ii)*exp(j*k(ii)*w0*t_reconstracted);
end

figure(1)
subplot(211)
plot(t_reconstracted,real(x_reconstracted))
xlabel('t');
ylabel('real part of z')
title('approximation with 51 terms')
legend('original signal','reconstracted signal')

subplot(212)
plot(t_reconstracted,imag(x_reconstracted))
xlabel('t');
ylabel('imaginary part of z')
title('approximation with 51 terms')
legend('original signal','reconstracted signal')

