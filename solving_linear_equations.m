% solving linaer equations with Matrix opeariotn 

close all
clear all
clc

A=[1 -2 3;-sqrt(3) 1 -sqrt(5); 3 -sqrt(7) 1]

 b=[1 pi exp(1)]' % column matrix

 X=inv(A)*b
% 
 X1=A\b
