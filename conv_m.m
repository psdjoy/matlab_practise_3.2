function [ y,n ] = conv_m( x,n1,h,n2 )

n=min(n1)+min(n2):max(n1)+max(n2);
y=conv(x,h);

end

