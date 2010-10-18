function Xp=perioditza(X, M)
%PERIODITZA repeteix M vegades el vector X

n=length(X);
Xp=zeros(1, M*n);
for i=0:M-1
    Xp(i*n+1:(i+1)*n)=X;
end

    