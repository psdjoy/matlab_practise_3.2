close,clear,clc
N1=[1 -1.122346 1];
N2=[1 -0.437833 1];
N3=[1 1 0];

D1=[1 -1.433509 0.85811];
D2=[1 -1.293601 0.556929];
D3=[1 0.612159 1];

sos= [N1 D1; N2 D2; N3 D3];
[b , a]=sos2tf(sos);
[r, p, k]=residuez(b , a)
zplane(b,a)