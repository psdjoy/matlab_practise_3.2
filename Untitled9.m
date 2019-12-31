close,clear,clc

Fs = 100;
T=1/Fs;
n= -1:0.1:1;
x=cos(2*pi*50*n*T);
figure(1)
stem(n,x)

figure(2)
N = length(x);
k = 0:N-1;
X = dft(x , N);
magX = abs(X);
phaX = angle(X)*180/pi;
subplot(211)
stem(k , magX)
title('Magnitude of DFT: N=4')
ylabel('|x(k)|')
xlabel('k')
subplot(212)
stem(k , phaX)
title('Angle of DFT: N=4')
ylabel('Degrees')
xlabel('k')