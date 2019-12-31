function [ xn ] = idfs( Xk , N )

n = 0:1:N-1;
k = 0:1:N-1;
WN = exp(-1j*2*pi/N);
nk = n'*k;
WNnk = WN .^ (-nk);
xn = (Xk * WNnk)/N;

end
