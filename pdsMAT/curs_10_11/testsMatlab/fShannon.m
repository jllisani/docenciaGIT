function f=fShannon(X, T, t)
%FSHANNON Shannon interpolate of a discrete function

[m, n]=size(X);
if (~((m == 1) & (n > 1))) 
    error('Input must be a row vector')
end

s=length(t);

for m=1:s
  for k=0:(n-1)
    if (t(m) == k*T) 
        Y(1+k)=1;
    else 
        Y(1+k)=T*sin(pi*(t(m)-k*T)/T)/(pi*(t(m)-k*T));
    end
  end
  f(m)=X*Y';
end


