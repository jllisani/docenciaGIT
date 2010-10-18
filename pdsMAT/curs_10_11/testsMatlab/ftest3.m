function f=ftest3(t)
%FTEST3 funcio de prova

X=[0 0 0 0 6 0 0 0 0 0 0 0 0 0 0 0];
n=length(X);

for i=1:length(t)
    for k=0:(n-1)
        Y(1+k)=cos(2*pi*k*t(i)/n);
    end
    f(i)=X*Y';
end
