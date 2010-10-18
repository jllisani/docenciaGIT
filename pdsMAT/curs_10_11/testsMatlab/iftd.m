function XX=iftd(X, T, ximax, xistep, t)
%IFTD Inverse Fourier Transform of a Discrete Signal 

[m, n]=size(X);
if (~((m == 1) & (n > 1))) 
    error('Input must be a row vector')
end

s=length(t);
Y1=ftd(X, T, 0:xistep:ximax);
Y2=ftd(X, T, -xistep:-xistep:-ximax);
for m=1:s
  k=1;
  for xi=0:xistep:ximax
    Z1(k)=exp(i*2*pi*xi*t(m));
    k=k+1;
  end
  XX(m)=Y1*Z1';
  k=1;
  for xi=-xistep:-xistep:-ximax
    Z2(k)=exp(i*2*pi*xi*t(m));
    k=k+1;
  end
  XX(m)=XX(m)+Y2*Z2';
  
end

