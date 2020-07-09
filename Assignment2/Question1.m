g = @(t)3*pi*sin(8*pi*t+1.3).*cos(4*pi*t-0.8).*exp(sin(12*pi*t));
t1=-1:0.1:1;
t2=-1:0.01:1;
t3=-1:0.001:1;

figure(1)
subplot(311)
plot(t1,g(t1))
xlabel('t')
ylabel('g(t)')
title('step = 0.1')

subplot(312)
plot(t2,g(t2))
xlabel('t')
ylabel('g(t)')
title('step = 0.01')

subplot(313)
plot(t3,g(t3))
xlabel('t')
ylabel('g(t)')
title('step = 0.001')