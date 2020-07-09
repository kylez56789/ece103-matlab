%% diff eq of system: D2y+ 3Dy+ 2y= Dx, with BC y(0)=0 and vc(0)=5
% close all
% clear all
clc

%% impulse response: x=detla(t), B.C. y(0)=0, Dy(0)=1
y_n=dsolve('D2y+3*Dy+2*y=0','y(0)=0','Dy(0)=1','t');
h=diff(y_n);
disp(['impulse response h(t) = (',char(h),')u(t)']);

%%
h=@(t) (2*exp(-2*t)-exp(-t)).*(t>=0);

t=-1:0.01:5;
figure(2)
plot(t,h(t))
xlabel('time')
ylabel('impulse respons h(t)')

