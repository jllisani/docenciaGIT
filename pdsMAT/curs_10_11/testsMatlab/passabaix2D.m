function Y=passabaix2D(X, kxmax, kymax)
%PASSABAIX2D  deixa passar els valors de frequencia entre 0 i kmax 
%             (i frequencies simetriques)


[m, n]=size(X);
if ((kxmax > n/2) | (kymax > m/2)) 
    error('freq. max ha d esser inferior al tamany del costat menor / 2'); 
end

Y=X;
Y(kymax+1:m-kymax,:)=0;
Y(:,kxmax+1:n-kxmax)=0;
