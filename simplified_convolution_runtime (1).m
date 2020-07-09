close all
clear all
clc

%% signal: x, impulse response: h
x1=@(t) 2*(t>=0 & t<3);

h=@(t) 3*(exp(-t/5).*sin(2*t)).*(t>=3);
%
dtau = 0.1;  
tau = -10:dtau:40;              
dT=0.5;  
t = -10:dT:40;  
%%
figure (1)
y1 = NaN(1, length (t)); 

for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
   
    x1h = h(t(ii)-tau).*x1(tau);                           
    y1(ii)=trapz(tau,x1h);   
  
% plotting 
    subplot (211)
    plot(tau, x1(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('x1(\tau)','h(t-\tau)');
    
    subplot (212)
    plot (t, y1, 'k', t (ii), y1(ii), 'ok');
    xlabel ('t'); ylabel ('y1(t) = \int x1(\tau)h(t-\tau) d\tau');
    drawnow;
    
end
  