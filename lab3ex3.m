close all
clear all
clc
N=10;
L=2;
f1=0.043;
f2=0.031;
n=0:N-1;
x=sin(2*pi*f1*n)+sin(2*pi*f2*n);

y=interp(x,L); %L-1 number of zeros are in every output value
               %so it make an average value on that position 
subplot(211)
stem(n,x);
subplot(212)
m=0:N*L-1;
stem(m,y(1:N*L));