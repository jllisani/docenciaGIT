function y=cosJL(F, x)
% cosinus de 2 pi F x

for m=1:length(x)
  y(m)=cos(2*pi*F*x(m));
end
