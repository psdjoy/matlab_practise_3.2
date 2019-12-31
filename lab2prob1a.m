close all
clear all
clc
x=[1 2 3 4 5 6 7 6 5 4 3 2 1];
n=[-2:10];
m=[];
[ y , n1 ] = sig_shift( x,n,5 )    %x(n-5)
[ z , n2 ] = sig_shift( x,n,-4 )    %x(n+4)

[ p , n3 ] = sig_diff( 2*y,n1 , 3*z,n2 ) ;

stem(n3,p)