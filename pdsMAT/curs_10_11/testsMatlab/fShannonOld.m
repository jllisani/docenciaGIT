function f=fShannon(X, T, t)
%FSHANNON Shannon interpolate of a discrete function

[m, n]=size(X);
if (~((m == 1) & (n > 1))) 
    error('Input must be a row vector')
end

f=0;
for k=0:(n-1)
    if (t == k*T) 
        f=f+X(1+k);
    else
        f=f+T*X(1+k)*sin(pi*(t-k*T)/T)/(pi*(t-k*T));    
    end
end

