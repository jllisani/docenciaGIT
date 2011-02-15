function y=quantizeJL(x)
% quantitza els valors de X a valors enters

for m=1:length(x)
  a=abs(x(m))+0.5;
  q=int32(a);
  if (x(m) >= 0) y(m)=double(q);
  else y(m)=-double(q);
  end
end
