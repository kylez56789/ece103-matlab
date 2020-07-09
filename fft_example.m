close all
clear all
clc
set(0,'DefaultAxesFontSize',30);  % set the font size of plot window 

%%
dT=0.001;
t = 0:dT:2; % Time vector 
f = 5; % Create a square wave of f Hz.
x = 2*square(2*pi*t*f);

figure (1)
subplot(311)
plot(t,x);
xlabel('t');
title('original signal')

%% FT using fft()
N = length(x); % Length of FFT
X = fft(x,N)*dT;  % fft() does not keep track of temporal information of signal
                  % we need to multiply with dT 

% Frequency vector
W=linspace(-pi,pi,N);  % discrete angular freq
w=W/dT;  % angular freq


%% numerical FT
dw=w(2)-w(1);
for ii=1:length(w)
    X_n(ii)=trapz(t,x.*exp(-j*w(ii)*t));
end

%%
figure(2);
subplot(311)
plot(W,abs(X)); % without fftshift()
xlabel('\omega');
title('w/o fftshift');

X_corrected=fftshift(X);
subplot(312)
plot(W,abs(X_corrected)); % with fftshift()
xlabel('\omega');
title('corrected FFT')

subplot(313)
plot(W,abs(X_n)); % when we wrte our own FT, we do not need fftshift()
xlabel('\omega');
title('numerical FT');

%% signal reconstruction using ifft()
x_recon1=ifft(X)/dT;  % we multiplied with dT while using fft()
                      % now we need to divide with dT when using ifft()
x_recon2=ifft(X_corrected)/dT;

%% numerical FT reconstruction
x_recon_n=zeros(1,N);

for ii=1:length(w)
    x_recon_n=x_recon_n+X_n(ii)*exp(j*w(ii)*t)*dw/2/pi;
end

%%
figure(3)
subplot(311)
plot(t,x_recon1)  % we have not used fftshift() and ifftshift()
xlabel('t')
title('reconstructed w/o fftshift')

subplot(312)
plot(t,x_recon2)
xlabel('t')
title('reconstructed w/ fftshift')  % we have used fftshift() but not ifftshift()

subplot(313)
plot(t,x_recon_n)
xlabel('t')
title('numerical FT reconstructed')


figure(1)
subplot(312)
plot(t,x_recon1)
xlabel('t');
title('reconstracted signal using fft()')

subplot(313)
plot(t,x_recon_n)
xlabel('t');
title('numerical FT reconstracted')
