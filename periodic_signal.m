close all
clear all
clc


t = -1:0.001:1;
f1=2;
f2=4;

%%
x = sawtooth(2*pi*f1*t); % default value of 'xmax' is 1
subplot(411)
plot(t,x)
title('xmax default value')

%%
subplot(412)
plot(t,sawtooth(2*pi*f2*t,0))
title('xmax=0')

subplot(413)
plot(t,sawtooth(2*pi*f2*t,0.5))
title('xmax=0.5')

subplot(414)
plot(t,sawtooth(2*pi*f2*t,1))
title('xmax=1')

%%

figure(2)

y = square(2*pi*f1*t); % default value of 'duty cycle' is 50%
subplot(411)
plot(t,y)
title('duty cycle default value')

%%
subplot(412)
plot(t,square(2*pi*f2*t,10))
title('duty cycle=10%')

subplot(413)
plot(t,square(2*pi*f2*t,25))
title('duty cycle=25%')

subplot(414)
plot(t,square(2*pi*f2*t,75))
title('duty cycle=75%')

%%

figure(3)
z=@(time) 2*time.*(time>0 & time<=2)+4*(time>2 & time<=3);  % defining a piecewise function
single_period=-4:0.001:4;  % time values for a single period

x_single_period=z(single_period);
subplot(211)
plot(single_period,x_single_period)
title('single period')

%% repeating the signal 5 times
number_of_periods=5;
x_extended=repmat(x_single_period,1,number_of_periods);   % 1 row, 5 column: number of periods
% generating new 'time' variable to match signal 'x_extended'
t_extended=linspace(single_period(1),single_period(1)+(length(x_extended)-1)*...
    (single_period(2)-single_period(1)),length(x_extended));

subplot(212)
plot(t_extended,x_extended)
xlim([t_extended(1) t_extended(end)])  % limiting plot within the range of 't_extended'
title('5 periods')


