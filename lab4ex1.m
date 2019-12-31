close,clear,clc
b=[1 2 1];
a=[1 -1 0.3651];
n=5;
b=[b zeros(1 , n-1)];
[x , r]=deconv(b , a);
disp(x)