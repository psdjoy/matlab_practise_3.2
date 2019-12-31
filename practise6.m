close,clear,clc

Fs=100e3;
dt=1/Fs;

T=2e-3;
D=0.2;
pw=T*D;
t=-T/2:dt:T/2;
f=1/T;
n=t/dt;
L=pw/dt;

x=zeros(1,length(t));
x(abs(n)<=L/2)= 2;
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







