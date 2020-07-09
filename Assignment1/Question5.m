clear all
t = 0:0.1:10;
f_1=0.2;
f_2=0.425;

s_1 = sin(2*pi*f_1*t);

plot(t,s_1);

hold on

s_2 = sin(2*pi*f_2*t + 0.4);

plot(t,s_2);

hold on

s_3 = sin(2*pi*f_1*t) + sin(2*pi*f_2*t + 0.4);

plot(t,s_3);
xlabel('t');
ylabel('s');
legend('sin(2*pi*f_1*t)','sin(2*pi*f_2*t + 0.4)',...
    'sin(2*pi*f_1*t) + sin(2*pi*f_2*t + 0.4)');

hold off
