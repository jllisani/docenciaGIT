function Y=ftd(X, T, xi)
%FTD Fourier Transform of a Discrete Signal

[m, n]=size(X);
if (~((m == 1) & (n > 1))) 
    error('Input must be a row vector')
end

s=length(xi);
for m=1:s
  for k=0:(n-1)
    Z(1+k)=exp(-i*2*pi*k*T*xi(m));      
  end
  Y(m)=X*Z';
end

