close,clear,clc

Fs = 1500;
to = 0.1;
ts  = 1/Fs;
t = 0:ts:1;

f1 = 100;
f2 = 500;
x1 = cos(2*pi*f1*t);
x2 = cos(2*pi*f2*t);
x3 = x1 + x2;


x11 = fft(x1 , 1024);
x11 = x11(1:1024/2);
m = abs(x11);
f = (0:1024/2-1)*(Fs/1024);
subplot(411)
plot(f , m)

x12 = fft(x2 , 1024);
x12 = x12(1:1024/2);
m2 = abs(x12);
subplot(412)
plot(f , m2)

x13 = fft(x3 , 1024);
x13 = x13(1:1024/2);
m3 = abs(x13);
subplot(413)
plot(f , m3)

H=zeros(size(f));
H(1:200) = 1;



y = m3.*H;
subplot(414)
plot(f, y)
