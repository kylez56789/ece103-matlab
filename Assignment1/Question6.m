clear all
t = linspace(-2*pi,2*pi,100);

plot(t,sinc(t));

hold on

plot(t,MySinc(t));

legend('sinc(t)','MySinc(t)');

hold off

function [y] =  MySinc(x)
    if x == 0
        y = 1;
    else
        y = sin(x)./x;
    end
end