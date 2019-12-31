close,clear,clc

fs = 2000;
ts = 1/fs;
to = 0.2;
t = -to:ts:to;
df = 0.01;

figure(1)
m1 = sinc(100*t);
subplot(221)
plot(t , m1)
title('message signal(1)')

fc1 = 250;
c1 = cos(2*pi*fc1*t);
subplot(222)
plot(t , c1)
title('carrier signal(1)')

m2 = (sinc(100*t)).^2;
subplot(223)
plot(t , m2)
title('message signal(2)')

fc2 = 750;
c2 = cos(2*pi*fc2*t);
subplot(224)
plot(t , c2)
title('carrier signal(2)')

figure(2)
[ M1 , m1 , df1 ] = fftseq( m1 , ts, df );
M1 = M1/fs;

[ C1 , c1 , df1 ] = fftseq( c1 , ts, df );
C1 = C1/fs;
C1 = fftshift(C1);

[ M2 , m2 , df1 ] = fftseq( m2 , ts, df );
M2 = M2/fs;

[ C2 , c2 , df1 ] = fftseq( c2 , ts, df );
C2 = C2/fs;
C2 = fftshift(C2);

f = [0:df1:df1*(length(m1)-1)]-fs/2;

subplot(221)
plot(f , abs(fftshift(M1)))
title('spectrum of message signal(1)')

subplot(222)
plot(f , abs((C1)))
title('spectrum of carrier signal(1)')

subplot(223)
plot(f , abs(fftshift(M2)))
title('spectrum of message signal(2)')

subplot(224)
plot(f , abs(C2))
title('spectrum of carrier signal(2)')

figure(3)
u1 = m1.*c1;
[ U1 , u1 , df1 ] = fftseq( u1 , ts, df );
U1 = U1/fs;
U1 = fftshift(U1);
subplot(311)
plot(f , abs(U1))
title('spectrum of modulated signal(1)')

u2 = m2.*c2;
[ U2 , u2 , df1 ] = fftseq( u2 , ts, df );
U2 = U2/fs;
U2 = fftshift(U2);
subplot(312)
plot(f , abs(U2))
title('spectrum of modulated signal(2)')

X = U1 + U2;

subplot(313)
plot(f , abs(X))
title('spectrum of frquency division multiplexed signal')



figure(4)
BPF1 = zeros(size(f));
for i=1:length(f)
    if f(i)>100 && f(i)<400
        BPF1(i) = 2;
    end
end

subplot(411)
plot(f , abs(BPF1))
title('spectrum of BPF(1)')

subplot(412)
Output_bpf1 = X.*BPF1;
plot(f , abs(Output_bpf1))
title('spectrum of output after passing BPF(1)')

BPF2 = zeros(size(f));
for i=1:length(f)
    if f(i)>500 && f(i)<900
        BPF2(i) = 2;
    end
end

subplot(413)
plot(f , BPF2)
title('spectrum of BPF(2)')

subplot(414)
Output_bpf2 = X.*BPF2;
plot(f , abs(Output_bpf2))
title('spectrum of output after passing BPF(2)')



figure(5)
subplot(211)
Z1 = conv(Output_bpf1,C1,'same');
plot(f , abs(Z1))
title('Output bpf1')

subplot(212)
Z2 = conv(Output_bpf2,C2,'same');
plot(f , abs(Z2))
title('Output bpf2')

figure(6)

LPF1 = zeros(size(f));
for i=1:length(f)
    if f(i)>-200 && f(i)<200
        LPF1(i) = 2;
    end
end

subplot(411)
plot(f , abs(LPF1))
title('Lowpass Filter 1')

Msg1 = Z1.*LPF1;
subplot(412)
plot(f , abs(Msg1))
title('Msg1')

LPF2 = zeros(size(f));
for i=1:length(f)
    if f(i)>-200 && f(i)<200
        LPF2(i) = 2;
    end
end
subplot(413)
plot(f , abs(LPF2))
title('Lowpass Filter 2')

Msg2 = Z2.*LPF2;
subplot(414)
plot(f , abs(Msg2))
title('Msg2')

figure(7)
Msg1 = fftshift(Msg1);
Reconstructed_msg1 = real(ifft(Msg1))*fs;
subplot(211)
plot(t , Reconstructed_msg1(1:length(t)))
title('Reconstructed msg1')

Msg2 = fftshift(Msg2);
Reconstructed_msg2 = real(ifft(Msg2))*fs;
subplot(212)
plot(t , Reconstructed_msg2(1:length(t)))
title('Reconstructed msg2')







