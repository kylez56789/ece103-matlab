clc
clear

figure (1) % Create figure window and make visible on screen

x = @(t) 1.5*sin(pi*t).*(t>=0 & t<1);
h = @(t) 1.5*(t>=0 & t<1.5) - (t>=2&t<2.5);

dtau = 0.005; 
tau = -1:dtau:4;  % integration variable of convolution 

ti = 0; 
tvec = -.25:.1:3.75;  % time delay of convolution step
y = NaN(1, length (tvec)); % Pre-allocate memory

for t = tvec,
    ti = ti+1; % Time index
    xh = x(t-tau).*h(tau);
    lxh = length (xh);
    y(ti) = sum(xh.*dtau); % Trapezoidal approximation of interal
    
  
    subplot (2,1,1),
    plot(tau, h(tau), 'k-', tau, x(t-tau), 'k--', t, 0, 'ok');
    axis ([tau(1) tau(end) -2.0 2.5]);
    
    patch([tau(1:end-1); tau(1:end-1); tau(2:end); tau(2:end)],...
    [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
    [.8 .8 .8], 'edgecolor', 'none');

    c = get(gca, 'children'); set (gca, 'children', [c(2); c(3); c(4); c(1)]);
    subplot (2, 1, 2), plot (tvec, y, 'k', tvec (ti), y(ti), 'ok');
    xlabel ('t'); ylabel ('y(t) = \int h(\tau)x(t-\tau) d\tau');
    axis ([tau(1) tau(end) -1.0 2.0]); grid;
    drawnow;
    axis ([tau(1) tau(end) -1.0 2.0]); grid;
    drawnow;
  end