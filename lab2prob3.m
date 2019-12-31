close all
clear all
clc
n=0:25;
z=[];
[ x , n ] = step_seq( 0,0,25 );
% for k=1:length(n)
%     z(k)=0.8^n(k)*(x(k));
% end
z=0.8.^n.*(x)
[ p,q ] = conv_m( z,n,z,n )
stem(q,p)