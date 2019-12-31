close all
clear all
clc
x=[];
t=0:0.001:2
for i=1:length(t)
    if i<=2;
        x(i)=1;
    else x(i)=0;
    end
end
 n=0:0.001:2
  plot(t,x)
  hold on
  stem(n,x)