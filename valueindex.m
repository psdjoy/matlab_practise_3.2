function [ st,en ] = valueindex(y,x,fm,df1)
y=abs(y);
ymax=find(y == max(y));

st=ymax(2)-floor(1*floor((fm/df1)));
en=ymax(2)+floor(1*floor((fm/df1)));

end
