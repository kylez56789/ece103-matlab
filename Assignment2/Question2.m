    clear all

t=-10:0.1:15;
signal1 = arrayfun(@signal, t);
signal2 = arrayfun(@signal, t+2);
signal3 = arrayfun(@signal, t-3);
signal4 = arrayfun(@signal, -t);
signal5 = -3*arrayfun(@signal, -t+4);

figure(1)
plot(t,signal1)
xlabel('t')
ylabel('x(t)')
title('x(t)')

figure(2)
subplot(221)
plot(t,signal2)
xlabel('t')
ylabel('x(t)')
title('x(t+2)')

subplot(222)
plot(t,signal3)
xlabel('t')
ylabel('x(t)')
title('x(t-3)')

subplot(223)
plot(t,signal4)
xlabel('t')
ylabel('x(t)')
title('x(-t)')

subplot(224)
plot(t,signal5)
xlabel('t')
ylabel('x(t)')
title('-3x(-t+4)')

function op=signal(time)
    if -5 <= time && time < 5
        op=-2*abs(time)+10;
    elseif 5 <= time && time < 10
        op=10;
    else
        op=0;
    end
end
