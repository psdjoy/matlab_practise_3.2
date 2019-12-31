close,clear,clc
x=[1 2 1 3];
n=-1:2;
subplot(411)
stem(n,x);

[ y , n1 ] = sig_shift( x,n,-2 );
subplot(412)
stem(n1,y);

[ m , n2 ] = sig_fold( y,n1 );
subplot(413)
stem(n2,m);

N=length(m);
L=2;
n3=0:N-1;
y=zeros(1,L*length(m));
y([1:L:length(y)])=m;

subplot(414)
stem(n3,y(1:length(m)));


