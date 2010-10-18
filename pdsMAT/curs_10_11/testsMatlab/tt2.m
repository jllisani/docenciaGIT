function Z=tt2(ximax, xistep, t)
%TT2 test 2 

  k=1;
  for xi=-xistep:-xistep:-ximax
    Z(k)=exp(i*2*pi*xi*t);
    k=k+1;
  end

