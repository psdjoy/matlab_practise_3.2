close all
clear all
clc
x=[3 11 7 0 -1 4 2];
n1=[-3:3];
h=[2 3 0 -5 2 1];
n2=[-2:3];
[ y,n ] = conv_m( x,n1,h,n2 )
stem(n,y)