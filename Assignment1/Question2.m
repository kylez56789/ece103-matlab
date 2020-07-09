clear all
a = 1;
for f=10:5:20
    b = 1;
    for t=0:0.1:0.4
        x(a,b) = 3*cos((2*pi*f*t)+0.1);
        b = b + 1;
    end
    a = a + 1;
end
x