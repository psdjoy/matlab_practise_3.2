close all
clear all
clc
f=60;
tmin=-0.5;
tmax=0.5;
t=linspace(tmin,tmax,400);
x= cos(2*pi*f*t);
plot(t,x)

T=1/800;
nmin=ceil(tmin/T);
nmax=floor(tmax/T);
n=nmin:nmax;
x1=cos(2*pi*f*n*T);
hold on
plot(n*T,x1,'o');
hold off