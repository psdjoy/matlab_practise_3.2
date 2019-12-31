close,clear,clc

T=1/800;
tmin=-0.5;
tmax=0.5;
nmin=ceil(tmin/T);
nmax=floor(tmax/T);
n=nmin:nmax;
f=60;
x = cos((2^0.5)*pi*n);

k = 0:500;
w = (pi/500)*k;
% X = x * (exp(-1j*pi/500)) .^ (n'*k);
X = x * (exp(-1j*(n'*k)*pi/500));

magX = abs(X);
angX = angle(X);
realX = real(X);
imagX = imag(X);

subplot(221)
plot(k/500,magX);grid
title('magnitude part')

subplot(223)
plot(k/500,angX/pi);grid
title('angle part')

subplot(222)
plot(k/500,realX);grid
title('real part')

subplot(224)
plot(k/500,imagX);grid
title('imaginary part')
