close,clear,clc

Fs = 100e3;
dt = 1/Fs;

T = 1e-3;
D = 0.1;
PW = D*T;
f = 1/T;
t = -T/2:dt:T/2;
n = t/dt;
L = PW/dt;

x = zeros(1 , length(t));
x(find(abs(n) <= L/2)) = 1.1;

figure(1)
subplot(211)
plot(t , x)
title('continuous signal')
subplot(212)
stem(n , x)
title('discrete signal')

N = length(x);
Nc = N;
if mod(Nc,2) == 0
    k = -(Nc/2):(Nc/2)-1;
else 
    k = -(Nc-1)/2:(Nc-1)/2;
end
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

t_remax = T/2;
t_re = -t_remax:dt:t_remax;
n_re = t_re/dt;
x_re = zeros(1,length(n_re));
for i1=1:length(k)
    for i2=1:length(x_re)
        x_re(i2) = x_re(i2)+c(i1)*exp(1i*2*pi*k(i1)*n_re(i2)/N);
    end
end

figure(3)
subplot(211)
stem(n_re,x_re)
title('reconstructed signal')
subplot(212)
plot(t_re,x_re)
title('reconstructed signal')
