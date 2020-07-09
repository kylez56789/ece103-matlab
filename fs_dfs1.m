close all
clear all
clc

set(0,'DefaultAxesFontSize',30);  % set the font size of plot window 

%% single period defination
dT=0.001;
t1=dT:dT:1;
t2=1+dT:dT:2;
x1=5*ones(size(t1));
x2=-5*ones(size(t2));
x_single_period=[x1 x2];
t_single_period=[t1 t2];
N0=length(t_single_period);

%% 
T=N0*dT;
w0=2*pi/T; 

%% replicating single period
x_periodic=repmat(x_single_period,1,5);

t_extended=linspace(t_single_period(1),t_single_period(1)+(length(x_periodic)-1)*...
    (t_single_period(2)-t_single_period(1)),length(x_periodic));

figure (1)
subplot(211)
plot(t_extended,x_periodic);
xlabel('t')
title('original signal')
ylim([-10 10])


%% exponential FS

% k=-5:5; 
%   k=-50:500;
% k=-5000:5000;

 Nk=length(t_single_period);
%  Nk=2*length(t_single_period);
%  Nk=3*length(t_single_period);
   k=-Nk/2:Nk/2-1; 


for ii=1:length(k)
    Ck(ii)=(1/T)*trapz(t_single_period, x_single_period.*exp(-j*k(ii)*w0*t_single_period));
end

w0k=w0*k;  % different hermonic angular frequencies
figure (2)
subplot(211)
stem(w0k,abs(Ck))
xlabel('\omega')

subplot(212)
stem(w0k,angle(Ck)*180/pi);
xlabel('\omega')
ylabel('degrees')


%% signal reconstruction
x_reconstracted=zeros(1,length(t_extended));

for ii=1:length(k)
    x_reconstracted=x_reconstracted+Ck(ii)*exp(j*k(ii)*w0*t_extended);
end

figure(1)
subplot(212)
plot(t_extended,x_reconstracted)
xlabel('t');


%% discrete angular freq
Omega0k=w0*dT*k;  % different hermonic digital angular frequencies
figure (3)
subplot(211)
stem(Omega0k,abs(Ck));
xlabel('\Omega=\omegadT');
xlim([-3*pi 3*pi]);
set(gca,'xtick',[-3*pi -2*pi -pi 0 pi 2*pi 3*pi],'xticklabels',...
    {'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'});

subplot(212)
stem(Omega0k,angle(Ck)*180/pi);
xlabel('\Omega=\omegadT');
ylabel('degrees');
xlim([-3*pi 3*pi]);
set(gca,'xtick',[-3*pi -2*pi -pi 0 pi 2*pi 3*pi],'xticklabels',...
    {'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'});


