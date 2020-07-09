% x_single_period(t)= 1, 0<t<1  
%                    0, 1<t<t_end  

close all
clear all
clc

set(0,'DefaultAxesFontSize',30);  % set the font size of plot window 

%% single period defination
dT=0.001;

t_high_end=1;
T_end_short=t_high_end*2;  % duty cycle of 50%
T_end_long=T_end_short*10; % duty cycle of 10%

t1=dT:dT:t_high_end;  % high state 
t2_short=t1(end)+dT:dT:T_end_short;  % low state
t2_long=t1(end)+dT:dT:T_end_long;

x1=5*ones(size(t1));  % magnitude 0f 5
x2_short=zeros(size(t2_short)); % low state
x2_long=zeros(size(t2_long));

x_short=[x1 x2_short]; % [high_state low_state]
x_long=[x1 x2_long];

t_short=[t1 t2_short]; 
t_long=[t1 t2_long];

N0_short=length(t_short);  % number of sample in a single period
N0_long=length(t_long);  % number of sample in a single period

%% 
T_short=N0_short*dT;
w0_short=2*pi/T_short;

T_long=N0_long*dT;
w0_long=2*pi/T_long;

%% replicating single period
x_long_periodic=repmat(x_long,1,2);  % 2 cycles
t_long_periodic=linspace(0,T_end_long*2,length(x_long_periodic)); % this 
                 % method of creating multi-cycle time vector only works
                 % if the signal starts from time=0

x_short_periodic=repmat(x_short,1,T_end_long/T_end_short*2);  % multiple cycles
t_short_periodic=linspace(0,T_end_long*2,length(x_short_periodic));  % this 
                 % method of creating multi-cycle time vector only works
                 % if the signal starts from time=0

figure
subplot(2,1,1)
plot(t_short_periodic,x_short_periodic);
xlabel('t')
title('original signal short period')

subplot(2,1,2)
plot(t_long_periodic,x_long_periodic,'r');
xlabel('t')
title('original signal long period')

%% exponential FS,
k=-35:35;    % 71 FS coefficients

for ii=1:length(k)
    Ck_short(ii)=(1/T_short)*trapz(t_short, x_short.*exp(-j*k(ii)*w0_short*t_short));
    Ck_long(ii)=(1/T_long)*trapz(t_long, x_long.*exp(-j*k(ii)*w0_long*t_long));
end

w0k_short=w0_short*k;
w0k_long=w0_long*k;

figure (2)
stem(w0k_short,abs(Ck_short));
xlabel('\omega');
% % xlim([w0k_long(1) w0k_long(end)]);
hold on

figure(3)
subplot(211)
stem(w0k_short,angle(Ck_short));
xlabel('\omega');
% % xlim([w0k_long(1) w0k_long(end)]);
ylabel('\angleX')

figure (2)
stem(w0k_long,abs(Ck_long),'r');
xlabel('\omega');
% % xlim([w0k_long(1) w0k_long(end)]);
ylabel('|C_k|')
title('71 Fourier Series coefficients')

figure(3)
subplot(212)
stem(w0k_short,angle(Ck_long),'r');
xlabel('\omega');
% % xlim([w0k_long(1) w0k_long(end)]);
ylabel('\angleX')