function Y=applymask(X, u, n)
% APPLYMASK convoluciona X amb u i repeteix n vegades

Y=X;
for m=1:n
    Y=conv(Y, u);
end
