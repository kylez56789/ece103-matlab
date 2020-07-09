clear all

t = -20:0.1:20;
x = @(t)t.*exp(-0.15*t);

xe = 1/2*(x(t)+x(-t));
xo = 1/2*(x(t)-x(-t));
y = xe + xo;
figure(1)
subplot(221)
plot(t, x(t));
xlabel('t')
ylabel('x(t)')
title('Signal x(t)')

subplot(222)
plot(t, xe);
xlabel('t')
ylabel('x_e(t)')
title('Even Decomposition')

subplot(223)
plot(t,xo);
xlabel('t')
ylabel('x_o(t)')
title('Odd Decomposition')

subplot(224)
plot(t,y);
xlabel('t')
ylabel('y(t) = x_e(t)+e_o(t)')
title('Even + Odd')
