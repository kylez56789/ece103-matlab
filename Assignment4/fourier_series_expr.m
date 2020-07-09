function [Ck]=fourier_series_exp(x,t,Nk,p)
    dT=t(2)-t(1);
    T= dT*length(t);
    w0=2*pi/T; 

    if nargin <2
        error('Not enough input argument!')
    elseif nargin == 2
        Nk=101;         
        p=0;      % not plots    
    elseif nargin ==3        
        p=0;      % not plots    
    end
    k=-floor(Nk/2):floor(Nk/2); % if Nk=11, k=-5:5; if Nk=12, k=-6:6
    for ii=1:length(k)
            Ck(ii)=(1/T)*trapz(t, x.*exp(-j*k(ii)*w0*t));
    end
    if p==1
        % plot abs(Ck) vs k and angle(Ck) vs k
        figure 
        subplot(211)
        stem(k,abs(Ck))
        xlabel('k')
        ylabel('|C_k|')
        subplot(2,1,2)
        stem(k,angle(Ck)*180/pi);  
        xlabel('k')
        ylabel('\angleC_k')

        % plot 3 cycles of the signal 'x' and the reconstructed signal
        x_extended=repmat(x,1,3);
        t_extended=t(1):dT:t(1)+(3*length(t)-1)*dT;
        x_reconstructed=zeros(size(t_extended));
        for ii=1:length(k)
            x_reconstructed=x_reconstructed+Ck(ii)*exp(j*k(ii)*w0*t_extended);
        end
        figure
        subplot(211)
        plot(t_extended,x_extended)
        xlabel('t');
        title('original signal x')
        subplot(2,1,2)
        plot(t_extended,x_reconstructed)
        xlabel('t');
        title('reconstructed signal')
    end
end 