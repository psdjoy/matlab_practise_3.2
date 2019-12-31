close,clear,clc

b=[1 -1.6180 1];
a=[1 -1.5161 0.878];

zplane(b,a)

zk=roots(b)
pk=roots(a)

B=poly(zk)
A=poly(pk)