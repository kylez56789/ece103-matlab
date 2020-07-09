function [Ck]=fourier_series_exp(x,t,Nk,p)

% Ck = exponential fourier series cofficient  
% x = single period of a signal
% t = time corrosponding to 'x'
% Nk = (optional input) number of exponential terms
% p = plotting option ; p=0, no plots, p = 1 plot Ck vs k and reconstructed signal  
% dT = t(2)-t(1) = temporal resolution of signal (x)
% T = peiod of signal 'x'
% w0= angular frequency of signal 'x' 


    dT=t(2)-t(1);
    T= dT*length(t);
    w0=2*pi/T;   

    % Check the number of inputs, 'nargin' returns number of input arguments 
    if nargin <2
        error('Not enough input argument!')
    elseif nargin == 2
        Nk=101;   % you can set any default value you like 
        p=0;      % not plots
    elseif nargin ==3
        p=0;      % not plots
    end
    k=-floor(Nk/2):floor(Nk/2); % if Nk=11, k=-5:5; if Nk=12, k=-6:6


    %% evaluate Ck
        %
        % % % write this code segment
        %
%% plot spectrum and reconstructed signal     
    if p==1
        % plot abs(Ck) vs k and angle(Ck) vs k
        %
        % % % write this code segment
        %
        
        % plot 3 cycles of the signal 'x' and the reconstructed signal
        %
        % % % write this code segment
        %
    end
     
end