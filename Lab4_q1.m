clc;   % clc will clear your command window
clear all; %this will clear the variables that you have used on previous codes
close all; %this will close the figures that have been opened from the previous code
set(0,'DefaultFigureWindowStyle','docked')

function [Ck]=fourier(x,t,Nk,p) %function used to take a signal, its period interval, the amount of terms for the exp term, and the choice to plot or not

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
    T=floor(T); %used to round down the period value to an integer
    w0=2*pi/T;   

    % Check the number of inputs, 'nargin' returns number of input arguments 
    if nargin <2
        error('Not enough input argument!')
    elseif nargin == 2
        Nk=51;   % you can set any default value you like 
        p=0;      % not plots
    elseif nargin ==3
        p=0;      % not plots
    end
    k=-floor(Nk/2):floor(Nk/2); % if Nk=11, k=-5:5; if Nk=12, k=-6:6
 

    %% evaluate Ck
        x = x(t);   %evaluating the signal with its anon part and using the period interval for values
        
        %for loop used to evaluate the value of the exp format of our
        %series. Trapz in the format of the integral, and j as our
        %imaginary unit, meanwhile each value of k is evaluated with each
        %term of time to construct the sum of each term
     for a=1:length(k)
        Ck(a)=(1/T)*trapz(t, x.*exp(-j*k(a)*w0*t)); 
     end
     
%% plot spectrum and reconstructed signal     
    if p==1
        % plot abs(Ck) vs k and angle(Ck) vs k
        w0k=w0*k;  % different hermonic angular frequencies
        figure (2)
        subplot(211)
        stem(k,abs(Ck)) %specific plot for discrete data

        %%%%%%choose k interval%%%%%%%%%
        legend('Magnitude spectrum  k=-:')
        xlabel('\omega')
        ylabel('Magnitude')
        
        subplot(212)
        stem(w0k,angle(Ck)*180/pi);
        
        %%%%%%choose k interval%%%%%%%%%
        legend('Phase spectrum  k=-:')
        xlabel('\omega')
        ylabel('Degrees')

        
% plot n cycles of the signal 'x' and the reconstructed signal
%%%%%% choose n number_of_periods = %%%%%%; 
x_extended = repmat(x,1,number_of_periods);
t_extended = reshape(t(:) + (0:T:(number_of_periods-1)*T), 1, []);  %fitting the new time values for the repeated x values

figure(1)
subplot(211)
plot(t_extended,x_extended)

xlabel('t')
title('Original signal')
xlim([t_extended(1) t_extended(end)])   %creating a bound for the window size
%%%%%legend will tell how many units of time repeat for a period

x_reconstructed = zeros(1,length(t_extended));  %new array created for the signal that is made of terms 

%new for loop to do a geometric sum of the exp format calculated earlier
for a = 1:length(k)
    x_reconstructed = x_reconstructed + Ck(a)*exp(j*k(a)*w0*t_extended);
end

figure(1)
subplot(212)
plot(t_extended,x_reconstructed)
xlabel('t');
title(['Approximation with ',num2str(Nk),' terms'])
xlim([t_extended(1) t_extended(end)])

    end
     
end