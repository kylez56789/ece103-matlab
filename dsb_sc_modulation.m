close all
clear all
clc


fc=100e3;         % 100 kHz carrier    
fs=10*fc;         % sampling frequency (10 times higher than the highest frequency) 
dT=1/fs;
m=[1 0 2 1 1.5];  % message
fm=fc/10;         % message frequency (10 kHz)
t=0:1/fs:length(m)/fm-1/fs; % itme vector (s)


%% modulating message with carrier

xc=cos(2*pi*fc*t);% carrier signal
xm=[];  % message signal initiation
for ii=1:length(m)
    xm=[xm m(ii)*ones(1,length(t)/length(m))];
end


figure(1)
subplot(211)
plot(t,xc);
title('carrier signal of 100 khz');
xlabel('time (sec)');
ylabel('amplitude');

subplot(212)
% stem(t,xm);
plot(t,xm);
title('message signal of 10 khz');
xlabel('time (sec)');
ylabel('amplitude');


%% DSB-SC Modulation
s= xm.*xc;  % modulated signla
figure(2)
subplot(311)
plot(t,s);
title('DSB-SC Modulation in Time Domain');
xlabel('time (sec)');
ylabel('amplitude');

% frequency domain
S=fftshift(fft(s,length(s))*dT);
W=linspace(-pi,pi,length(S)); % digital angular frequency
w=W/dT; % angular frequency (rad)
f=w/2/pi;  % frequency (Hz)
figure(2)
subplot(312)
plot(f,abs(S));
title('DSB-SC Modulation in Frequency Domain');
xlabel('frequency(Hz)');
ylabel('amplitude');



XC=fftshift(fft(xc,length(xc))*dT);
W=linspace(-pi,pi,length(XC)); % digital angular frequency
w=W/dT; % angular frequency (rad)
f=w/2/pi;  % frequency (Hz)
figure(2)
subplot(313)
plot(f,abs(XC));
title('Magnitude spectrum of carrier signal')

%% Demodulation 
v=s.*xc;
V=fftshift(fft(v,length(v))*dT);
figure(3)
subplot(211)
plot(f,abs(V));
title(' Demodulated Signal in Frequency Domain before filtring');
xlabel('frequency(Hz)');
ylabel('amplitude');
hold on

%% low pass filter

for jj=1:length(f)
    
    if -fc<f(jj) && f(jj)<fc
        Hlp(jj)=2;      % during the demodulation process, the 
                        % magnitude of the signal drops to half
                        % low pass filter with magnitude of 2 
                        % restores the correct magnitude
    else
        Hlp(jj)=0;
    end
end
    
% Hlp=1./sqrt(1+(f./fc).^(2*100)); % 100th order low pass filter
subplot(212)
plot(f,Hlp,'g');
title(' Frequency Response of Low Pass Filter');
xlabel('frequency(hz)');
ylabel('amplitude');

%% frequency domain demodulation 

V0=Hlp.*V;
figure(4)
subplot(211)
plot(f,V0);
title(' Signal in Frequency Domain After Filtring');
xlabel('frequency(Hz)');
ylabel('amplitude');


%% time domain demodulation 
v0=(ifft(ifftshift(V0)))/dT;
subplot(212)
plot(t,v0);
title(' Signal in Time Domain After Filtring');
xlabel('time(sec)');
ylabel('amplitude');