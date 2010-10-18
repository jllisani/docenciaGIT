function Z=tt1(ximax, xistep, t)
%TT1 test 1 

  k=1;
  for xi=0:xistep:ximax
    Z(k)=exp(i*2*pi*xi*t);
    k=k+1;
  end

