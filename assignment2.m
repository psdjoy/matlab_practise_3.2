close,clear,clc

n = 0:5;
x = cos(pi*n/3);

figure(1)
stem(n , x)
title('discrete signal')

N = length(x);
Nc = N;

k = 0:Nc-1;

c = zeros(1,length(k));
for i1=1:length(k)
    for i2=1:length(x)
        c(i1) = c(i1)+1/N*x(i2)*exp(-1i*2*pi*k(i1)*n(i2)/N);
    end
end

figure(2)
subplot(211)
stem(k,abs(c))
title('fourier series coefficients c_k')
subplot(212)
stem(k,angle(c)*180/pi)
xlabel('k')
ylabel('angle(c_k)')

