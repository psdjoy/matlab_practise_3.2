close all
clear all
clc
N=5;
L=2;
fo=0.1;
n=0:N-1;
x=sin(2*pi*fo*n);

y=zeros(1,L*length(x));
y([1:L:length(y)])=x;

subplot(211)
stem(n,x)
subplot(212)
stem(n,y(1:length(x)));