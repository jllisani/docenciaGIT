function Y=mydct(X)
% MYDCT Discrete 1D Cosinus Transform

[m, n]=size(X);
if (~((m == 1) & (n > 1))) 
    error('Input must be a row vector')
end

Y=zeros(1, n);
for s=0:(n-1)
    for k=0:(n-1)
        termK=X(1+k)*cos(pi*s*(k+0.5)/n);
        Y(1+s)=Y(s+1)+termK;
    end
    if (s == 0) 
      Y(1+s)=Y(1+s)/sqrt(2); 
    end
end

