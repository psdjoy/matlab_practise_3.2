close all
clear all
clc
x=[];
n=-10:25;
k=1:length(n);
[ y , n1 ] = step_seq( -5,-10,25 );   %u(n+5)
[ z , n2 ] = step_seq( 6,-10,25 );    %u(n-6)
[ p , n3 ] = sig_diff( y,n1 , z,n2 ); % u(n+5)-u(n-6)

[ q , n4 ] = imp_seq( 0,-10,25 ); %del(n)

[  s, n5 ] = step_seq( 4,-10,25 );   %u(n-4)
[ t , n6 ] = step_seq( 10,-10,25 );    %u(n-10)

[ m , n7 ] = sig_diff( s,n5 , t,n6 ); % u(n-4)-u(n-10)
n10=[];
for k=1:length(n)
   x(k)=n(k)^2*(p(k))+10*q(k)+20*(0.5)^n(k)*(m(k));
end

stem(n,x)