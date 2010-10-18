function v=checkmark(X,x,y)
%GETMARK calcula el valor medio (en modulo) de una region del espectro X 


v=0;
v=v+abs(X(y,x));
v=v+abs(X(y-1,x));
v=v+abs(X(y+1,x));
v=v+abs(X(y-1,x-1));
v=v+abs(X(y+1,x-1));
v=v+abs(X(y-1,x+1));
v=v+abs(X(y+1,x+1));

v=v/9;

