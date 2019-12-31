close all
clear all
clc
n=0:10;
x=[];
for k=1:length(n)
    if k<=5 x=[x n(k)];
    else x=[x (-n(k)+10)];
    end
end
stem(n,x)
hold on 
plot(n,x)