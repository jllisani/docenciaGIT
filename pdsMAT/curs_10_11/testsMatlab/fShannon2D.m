function f=fShannon2D(X, Tx, Ty, x, y)
%FSHANNON2D Shannon interpolate of a 2D discrete function

[h, w]=size(X);

Nx=length(x);
Ny=length(y);

for mx=1:Nx
  for my=1:Ny
          
    for j=1:h
      Xj(j)=fShannon(double(X(j,:)), Tx, x(mx));
    end
    f(my, mx)=uint8(fShannon(Xj, Ty, y(my)));
       
  end
end

