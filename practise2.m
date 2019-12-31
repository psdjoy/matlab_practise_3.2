close all
clear all
clc
x=[];
t=0:1:2
for i=1:length(t)
    if i<=2;
        x(i)=i-1;
    else x(i)=3-i;
    end
end
 n=0:1:2
  plot(t,x)
  hold on
  stem(n,x)