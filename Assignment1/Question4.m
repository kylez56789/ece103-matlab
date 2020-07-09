clear all
a=1;
for t=0:1/14:1
    x(a)=4*cos(2*pi*t+0.2)+3*sin((pi^2)*t);
    a = a + 1;
end
x
x_max = max(x)
x_min = min(x)
x_avg = mean(x)
a=1;
for t=1:15
    if x(t)>4
        xgreater4(a) = t;
        a = a + 1;
    end
end
xgreater4