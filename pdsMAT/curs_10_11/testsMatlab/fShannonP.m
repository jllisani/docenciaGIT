function f=fShannonP(X, T, t, M)
%FSHANNON Shannon interpolate of a discrete periodic function (M periods)

[m, n]=size(X);
if (~((m == 1) & (n > 1))) 
    error('Input must be a row vector')
end

s=length(t);

%consider M periods of the signal
Xp=perioditza(X, M);

for m=1:s
  %tp=t(m)+((M-1)/2)*n*T;
  tp=t(m);
  for k=0:M*n-1
    if (tp == k*T) 
        Y(1+k)=1;
    else 
        Y(1+k)=T*sin(pi*(tp-k*T)/T)/(pi*(tp-k*T));
    end
  end
  %take the interpolate for the central period
  f(m)=Xp*Y';
end


