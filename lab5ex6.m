close,clear,clc

x=[1 1 1 1];
N = 4;
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