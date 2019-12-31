close all
clear all
clc
N=5;
M=2;
fo=0.1;
n=0:N-1;
m=0:(N*M)-1;
x=sin(2*pi*fo*m);
y=x([1:M:length(x)]);
subplot(211)
stem(n,x(1:N));
subplot(212)
stem(n,y)