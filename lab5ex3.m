close,clear,clc

x = [1 3 -9 5 10];
n1 = -1;
n2 = 3;
n = n1:n2;
M = 500;

w = (-M/2:M/2)*2*pi/M;
W = exp(-1j*w'*n);
X = W*x';

subplot(211)
plot(w/(2*pi),abs(X),'k')
title('magnitude spectrum')

subplot(212)
plot(w/(2*pi),angle(X)*180/pi,'k')
title('phase spectrum')