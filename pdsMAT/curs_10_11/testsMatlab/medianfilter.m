function Y=medianfilter(X, s, n)
%MEDIANFILTER Apply median filter of length s, repeat n times

s2=round((s-1)/2);
imin=s2+1;
imax=length(X)-s2;
Y=X;
Z=X;
for m=1:n
    for i=imin:imax
      Z(i)=median(Y(i-s2:i+s2));    
    end
    Y=Z;
end