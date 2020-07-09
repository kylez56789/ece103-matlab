close all
clear all
clc
set(0,'DefaultAxesFontSize',30);  % set the font size of plot window 

%%
dT=0.0001;
t1=-1:dT:0;
x1=2*ones(size(t1));

t2=0:dT:1;
x2=5*ones(size(t2));

%% time domain convolution
y=conv(x1,x2)*dT;  % conv() function do not keep track of temporal information
                   % we need to multiply with dT 
ty=min(t1)+min(t2):dT:max(t1)+max(t2);

figure(1)
subplot(411)
plot(t1,x1);
ylabel('x1')
xlim([-2.5 2.5])
subplot(412)
plot(t2,x2);
ylabel('x2')
xlim([-2.5 2.5])
subplot(413)
plot(ty,y);
ylabel('x1*x2')
xlim([-2.5 2.5])

%% frequency domain multiplication

X1=fft(x1,length(y))*dT;   % fft() does not keep track of temporal information of signal
                           % we need to multiply with dT 
X2=fft(x2,length(y))*dT;

% Frequency vector
W=linspace(-pi,pi,length(y));  % discrete angular freq
w=W/dT;  % angular freq

figure(2)
subplot(211)
stem(W,fftshift(abs(X1)));
xlabel('\Omega');
ylabel('X1(\omega)')
subplot(212)
stem(W,fftshift(abs(X2)));
xlabel('\Omega');
ylabel('X2(\omega)')

figure(1)


% H=(X1).*(X2);
H=fft(x1,length(y)).*fft(x2,length(y))*dT*dT;
subplot(414)
% converting freq domain signal back to time domain
plot(ty,ifft(H,length(y))/dT);    % we multiplied with dT while using fft()
                                  % now we need to divide with dT when using ifft()
ylabel('ifft(X1.X2)')
xlim([-2.5 2.5])