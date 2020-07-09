close all
clear all
clc

x=@(t) 0.6*((t>=-2)-(cos(pi*t)+1).*((t>=-1)-(t>=1))-(t>=2));
t_single_period=-5:0.01:5;
C_k=fourier_series_expr(x(t_single_period),t_single_period,51,1);