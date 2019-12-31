close,clear,clc

n = -100:100;
x = cos((2^0.5)*pi*n);


k = 0:500;
w = (pi/500)*k;

X = x * (exp(-1j*(n'*k)*pi/500));

magX = abs(X);
angX = angle(X);


subplot(211)
plot(k/500,magX);grid
title('magnitude part')

subplot(212)
plot(k/500,angX/pi);grid
title('angle part')