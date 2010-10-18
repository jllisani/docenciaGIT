function f=ftest2(t)
%FTEST2 funcio de prova

X=[20 10 15 12 6 0 0 3 8 10 12 6 4 2 0 1];
n=length(X);

for i=1:length(t)
    for k=0:(n-1)
        Y(1+k)=cos(2*pi*k*t(i)/(n/4));
    end
    f(i)=X*Y';
end
