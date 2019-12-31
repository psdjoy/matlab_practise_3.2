close,clear,clc

N=42;
p=1;
d=[1 -0.9];
x=[1 zeros(1 , N-1)];  %using this technique from manual page 18.
y=filter(p , d , x);
k=0:N-1;
stem(k,y)