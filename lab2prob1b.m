close all
clear all
clc
x=[1 2 3 4 5 6 7 6 5 4 3 2 1];
n=[-2:10];

[ y , n1 ] = sig_fold( x,n );
[ z , n2 ] = sig_shift( y,n,3 );

[ p , n3 ] = sig_shift( x,n,2 );
[ q , n4 ] = sig_mul( p,n3 , x,n );

[ m , n5 ] = sig_add( z,n2 ,q,n4 );
stem(n5,m)
