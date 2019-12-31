clear all; close all; clc;

fs=2000;
ts=1/fs;
t0=.2;
df=.01;

fm1=100;
fm2=100;
fc1=250;
fc2=750;
t=-t0/2:ts:t0/2;
m1=sinc(fm1*t);
m2=(sinc(fm2*t)).^2;
c1=cos(2*pi*fc1*t);
c2=cos(2*pi*fc2*t);
figure(1);

title('Signals In Time Domain');
subplot(221);
plot(t,m1); grid on;
title('Message 1');
subplot(222);
plot(t,m2); grid on;
title('Message 2');
subplot(223);
plot(t,c1); grid on;
title('Carrier 1');
subplot(224);
plot(t,c2); grid on;
title('Carrier 2');

figure(2);
[M1,m1,df1]=fftseq(m1,ts,df);
M1=M1/fs;
M1=fftshift(M1);
f=[0:df1:(df1*(length(m1)-1))]-fs/2;

subplot(241);
plot(f,abs(M1));
title('Message 1 spectrum');
[M2,m2,df1]=fftseq(m2,ts,df);

M2=M2/fs;
M2=fftshift(M2);
subplot(242);
plot(f,abs(M2));
title('Message 2 spectrum');
[C1,c1,df1]=fftseq(c1,ts,df);
C1=C1/fs;
C1=fftshift(C1);
subplot(243);
plot(f,abs(C1));
title('Carrier 1 Spectrum');
[C2,c2,df1]=fftseq(c2,ts,df);
C2=C2/fs;
C2=fftshift(C2);
subplot(244);
plot(f,abs(C2));
title('Carrier 2 Spectrum');
u1=m1.*c1;
[U1,u1,df1]=fftseq(u1,ts,df);
U1=U1/fs;
U1=fftshift(U1);
subplot(245);
plot(f,abs(U1));
title('Msg1 modulated Spectrum');
u2=m2.*c2;
[U2,u2,df1]=fftseq(u2,ts,df);
U2=U2/fs;
U2=fftshift(U2);
subplot(246);
plot(f,abs(U2));
title('Msg2 modulated Spectrum');


X1=U1+U2;



subplot(247);
plot(f,abs(X1)); 
title('FDM Spectrum');
[st,en] = valueindex(U1,f,fm1,df1);
BPF1=zeros(1,length(f));
BPF1(st:1:en)=2;
st
en
length(f)
figure(3);
subplot(231);
plot(f,abs(BPF1));
title('BPF1 spectrum');
Y1=X1.*BPF1;
subplot(232);
plot(f,abs(Y1));
title('BPF1 output');
Z1=conv(Y1,C1,'same');
subplot(233);
plot(f,abs(Z1));
title('BPF1 Output Multiplied By Carrier 1');
fcut=fm1;
ncut=floor(fcut/df1);
LPF1(1:ncut)=2*ones(1,ncut);
LPF1(length(f)-ncut+1:length(f))=2*ones(1,ncut);
LPF1=fftshift(LPF1);
subplot(234);
plot(f,LPF1);
title('LPF1 Spectrum');
MM1=Z1.*LPF1;
subplot(235);
plot(f,abs(MM1));
title('Message 1 Spectrum Reconstructed');
MM1=fftshift(MM1);
mm1=real(ifft(MM1))*fs;
subplot(236);
plot(t,mm1(1:length(t)));
title('Reconstructed Message 1');
[st,en] = valueindex(U2,f,fm2,df1);
BPF2=zeros(1,length(f));
BPF2(st:1:en)=2;
st
en
figure(4);
subplot(231);
plot(f,abs(BPF2));
title('BPF2 spectrum');
Y2=X1.*BPF2;
subplot(232);
plot(f,abs(Y2));
title('BPF2 output');
Z2=conv(Y2,C2,'same');
subplot(233);
plot(f,abs(Z2));
title('BPF2 Output Multiplied By Carrier 1');
fcut=fm2;
ncut=floor(fcut/df1);
LPF2(1:ncut)=2*ones(1,ncut);
LPF2(length(f)-ncut+1:length(f))=2*ones(1,ncut);
LPF2=fftshift(LPF2);
subplot(234);
plot(f,LPF2);
title('LPF2 Spectrum');
MM2=Z2.*LPF2;
subplot(235);
plot(f,abs(MM2));
title('Message 2 Spectrum Reconstructed');
MM2=fftshift(MM2);
mm2=real(ifft(MM2))*fs;
subplot(236);
plot(t,mm2(1:length(t)));
title('Reconstructed Message 2');
