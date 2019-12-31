close,clear,clc
b=[1 0 0];
a=[1 -0.9 0];

figure(1)
zplane(b,a);

figure(2)
freqz(b,a,256,500)