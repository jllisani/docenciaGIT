function f=ftest1(t)
% FTEST1 funcio de prova

X=[13 16 12 9 12 17 16 11 10 14 10 14 11 14 12 14 19 23 21 17 11 8 9 15 21 24 22 20 21 24 28 24];
T=2;

s=length(t);
for m=1:s
    if ((t(m) < 0) | (t(m) > 31*T)) 
        f(m)=0;
    else 
        f(m)=fShannon(X, T, t(m));
    end
end