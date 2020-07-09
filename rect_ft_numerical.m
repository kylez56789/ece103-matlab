close all
clear all
clc
set(0,'DefaultAxesFontSize',30);  % set the font size of plot window 
%%
dT=0.01;
t_start=-2;
t_end=2;
tau=2;

t1=t_start:dT:-tau/2-dT;
t2=-tau/2:dT:tau/2;
t3=tau/2+dT:dT:t_end;

t = [t1 t2 t3]; % Time vector 
x = [zeros(size(t1)) ones(size(t2)) zeros(size(t3))];
figure (1)
subplot(211)
plot(t,x);
xlabel('t');
title('original signal')

%% numerial FT
w=linspace(-pi/dT,pi/dT,5*length(x));
dw=w(2)-w(1);

for ii=1:length(w)
    X(ii)=trapz(t,x.*exp(-j*w(ii)*t));
end


%% signal reconstruction FT
x_reconstracted=zeros(1,length(t));

for ii=1:length(w)
    x_reconstracted=x_reconstracted+X(ii)*exp(j*w(ii)*t)*dw/2/pi;
end

figure(1)
subplot(212)
plot(t,x_reconstracted)
xlabel('t');
title('reconstracted signal')

%%
figure (2)
subplot(311)
plot(w,abs(X));
xlabel('\omega')
ylabel('|X(\omega)|')

xlim([-8*pi/tau 8*pi/tau])
set(gca,'xtick',[-6*pi/tau -5*pi/tau -4*pi/tau -3*pi/tau -2*pi/tau ...
    -pi/tau 0 pi/tau 2*pi/tau 3*pi/tau 4*pi/tau 5*pi/tau 6*pi/tau],'xticklabels',...
    {'-6\pi/\tau','-5\pi/\tau','-4\pi/\tau','-3\pi/\tau','-2\pi/\tau',...
    '-\pi/\tau','0','\pi/\tau','2\pi/\tau','3\pi/\tau','4\pi/\tau','5\pi/\tau','6\pi/\tau'});


subplot(312)
stem(w,angle(X));
xlabel('\omega')
ylabel('\angle X(\omega)')
xlim([-8*pi/tau 8*pi/tau])
set(gca,'xtick',[-6*pi/tau -5*pi/tau -4*pi/tau -3*pi/tau -2*pi/tau ...
    -pi/tau 0 pi/tau 2*pi/tau 3*pi/tau 4*pi/tau 5*pi/tau 6*pi/tau],'xticklabels',...
    {'-6\pi/\tau','-5\pi/\tau','-4\pi/\tau','-3\pi/\tau','-2\pi/\tau',...
    '-\pi/\tau','0','\pi/\tau','2\pi/\tau','3\pi/\tau','4\pi/\tau','5\pi/\tau','6\pi/\tau'});

%% angle() vs phase()
% subplot(313)
% stem(w,phase(X));
% xlabel('\omega')
% ylabel('\angle X(\omega)')
% xlim([-8*pi/tau 8*pi/tau])
% set(gca,'xtick',[-6*pi/tau -5*pi/tau -4*pi/tau -3*pi/tau -2*pi/tau ...
%     -pi/tau 0 pi/tau 2*pi/tau 3*pi/tau 4*pi/tau 5*pi/tau 6*pi/tau],'xticklabels',...
%     {'-6\pi/\tau','-5\pi/\tau','-4\pi/\tau','-3\pi/\tau','-2\pi/\tau',...
%     '-\pi/\tau','0','\pi/\tau','2\pi/\tau','3\pi/\tau','4\pi/\tau','5\pi/\tau','6\pi/\tau'});
% 


