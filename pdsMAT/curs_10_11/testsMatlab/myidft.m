function Y=myidft(X)
% MYIDFT Inverse Discrete 1D Fourier Transform

[m, n]=size(X);
if (~((m == 1) & (n > 1))) 
    error('Input must be a row vector')
end

Y=zeros(1, n);
for s=0:(n-1)
    for k=0:(n-1)
        termK=X(1+k)*exp((-i*2*pi*k*s)/n);
        Y(1+s)=Y(s+1)+termK;
    end
end

