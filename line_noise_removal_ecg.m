close all;
clear all;
clc;
set(0,'DefaultAxesFontSize',30);  % set the font size of plot window 

%%
load ecg_signal.mat;

noisy_ecg=ecg;

dT=t(2)-t(1);
figure(1)
subplot(311)
plot(t,noisy_ecg);
xlabel('time (s)')
ylabel('noisy ecg(t)')

%% FT
Noisy_ECG=fft(noisy_ecg,length(noisy_ecg))*dT; % fftshift() not used
W=linspace(-pi,pi,length(Noisy_ECG)); % digital angular frequency
w=W/dT; % angular frequency (rad)
f=w/2/pi;  % frequency (Hz)


subplot(312)
plot(f,abs(fftshift(Noisy_ECG))); %% fftshift() used now
xlabel('frequency (Hz)');
ylabel('Noisy ECG(f)');


%% ideal 3 Hz band stop filter

for jj=1:length(f)
    
    if 59<abs(f(jj)) && abs(f(jj))<61
        HBS(jj)=0;
    else
        HBS(jj)=1;
    end
end
    

figure(2)
subplot(211)
plot(f,abs(HBS),'b');
xlabel('frequency (Hz)');
ylabel('|HBS(f)|');
legend('ideal 3 Hz band stop filter');

Filtered_ECG=HBS.*fftshift(Noisy_ECG);

subplot(212)
plot(f,abs(Filtered_ECG),'b');
xlabel('frequency (Hz)');
ylabel('|Filtered ECG(f)|');

figure(1)
subplot(312)
hold on
plot(f,abs(HBS),'g');
legend('ideal 3 Hz band stop filter');

%%

filterd_ecg=ifft(ifftshift(Filtered_ECG))/dT;
figure(1)
subplot(313)
plot(t,filterd_ecg)
xlabel('time(s)')
ylabel('filterd ecg(t)')



