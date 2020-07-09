clear all

t = linspace(0, 200, 10000);

f1=159:0.04:161;
for ti=1:length(t)
   for fi=1:length(f1);
       a(fi) = 10*cos(2*pi*f1(fi)*t(ti));
   end
   y1(ti) = sum(a);
end

f2=159:0.02:161;
for ti=1:length(t)
   for fi=1:length(f2);
       a(fi) = 10*cos(2*pi*f2(fi)*t(ti));
   end
   y2(ti) = sum(a);
end

figure(1)

plot(t, y1);

hold on

plot(t, y2);
xlabel('t')
ylabel('y(t)')
legend('N = 51, delta = 0.04', 'N = 101, delta = 0.02');

hold off