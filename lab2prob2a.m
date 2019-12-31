close all
clear all
clc
x=[];
n=0:25;
m=0:10;

for k=1:length(n)
    x1=0;
    for q=1:length(m) 
    [ y , n1 ] = imp_seq( 2*m(q),0,25 );   %del(n-2m)
    [  z, n2 ] = imp_seq( (2*m(q)+1),0,25 );   %del(n-2m-1)
    [ l , n3 ] = sig_diff( y,n1 , z,n2 );
    
    x1=x1+(m(q)+1)*(l(k));
    
    end
    
    x=[x x1];
end
stem(n,x)