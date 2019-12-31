close,clear,clc

Fs=60e3;
dt=1/Fs;

T=1e-3;
t=-T/2:dt:T/2;

n=t/dt;
x=cos(pi*n/3);

figure(1)
subplot(211)
plot(t,x)
subplot(212)
stem(n,x)

N=length(x);
Nc=N;
if mod(Nc,2)==0
    k=-(Nc/2):(Nc/2)-1;
else
    k=-(Nc-1)/2:(Nc-1)/2;
end
c=zeros(1,length(k));
for i=1:length(k)
    for j=1:length(x)
        c(i)=c(i)+(1/N)*(x(j)*exp(-1j*2*pi*k(i)*n(j)/N));
    end
end

figure(2)
subplot(211)
stem(k,abs(c))
subplot(212)
stem(k,angle(c)*130/pi)

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
