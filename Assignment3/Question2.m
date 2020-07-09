close all
clear all
clc

h=@(t) 3*(exp(-t/5).*sin(2*t)).*(t>=3);
dtau = 0.1;  
tau = -10:dtau:40;              
dT=0.5;  
t = -10:dT:40;

x1=@(t) 5*(t>=0 & t<10);
x2=@(t) 2*x1(t-10);
x_comb=@(t) x1(t)+2*x1(t-10);

figure(1)
y1 = NaN(1, length(t));

for ii=1:length(t)
    x1h = h(t(ii)-tau).*x1(tau);                           
    y1(ii)=trapz(tau,x1h); 
    
    subplot (211)
    plot(tau, x1(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('x1(\tau)','h(t-\tau)');
    
    subplot (212)
    plot (t, y1, 'k', t (ii), y1(ii), 'ok');
    xlabel ('t'); ylabel ('y1(t) = \int x1(\tau)h(t-\tau) d\tau');
    drawnow;
end

figure (2)
y2 = NaN(1, length (t)); 

for ii=1:length(t)
    x2h = h(t(ii)-tau).*x2(tau);                        
    y2(ii)=trapz(tau,x2h);
    
    subplot (211)
    plot(tau, x2(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('2\timesx1(\tau-10)','h(t-\tau)');
    
    subplot (212)
    plot (t, y2, 'k', t (ii), y2(ii), 'ok');
    xlabel ('t'); ylabel ('y2(t) = \int 2x1(\tau-10)h(t-\tau) d\tau');
    drawnow
end

figure (3)
y_comb = NaN(1, length (t));

for ii=1:length(t)
    x_combh = h(t(ii)-tau).*x_comb(tau);                           
    y_comb(ii)=trapz(tau,x_combh);
    subplot (211)
    plot(tau, x_comb(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('x1(\tau)+2x1(\tau-10)','h(t-\tau)');
    
    subplot (212)
    plot (t, y_comb, 'k', t (ii), y_comb(ii), 'ok');
    xlabel ('t'); ylabel ('y_comb(t) = \int x_comb(\tau)h(t-\tau) d\tau');
    drawnow
end

figure (4)
y3=y1+y2;
subplot(211)
plot(t,y3)

subplot(212)
plot(t,y_comb)