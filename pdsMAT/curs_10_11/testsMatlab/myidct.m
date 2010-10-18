function Y=myidct(X)
% MYIDCT Inverse Discrete 1D Cosinus Transform

[m, n]=size(X);
if (~((m == 1) & (n > 1))) 
    error('Input must be a row vector')
end

Y=zeros(1, n);
for s=0:(n-1)
    for k=0:(n-1)
        termK=X(1+k)*cos(pi*k*(s+0.5)/n);
        if (k == 0) 
            termK=termK/sqrt(2); 
        end
        Y(1+s)=Y(s+1)+termK;
    end
end

Y=(Y.*2)/n;

