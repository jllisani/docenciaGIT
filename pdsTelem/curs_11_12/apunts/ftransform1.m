function y=ftransform1(a, w)
% calcula 1/(1-ae^{-jw})

for m=1:length(w)
  y(m)=1/(1-a*exp(-j*w(m)));
end
