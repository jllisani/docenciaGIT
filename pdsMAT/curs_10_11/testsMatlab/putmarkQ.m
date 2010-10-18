function Y=putmarkQ(X,x,y,w,max)
%PUTMARKQ pone una marca (en forma de cuadrado de centro (x,y) y tamanyo w x w) 
%en el espectro X

[m,n]=size(X);

Y=X;
wmed=floor(w/2);
for i=x-wmed:x+wmed
    for j=y-wmed:y+wmed
        Y(j,i)=max;
        Y(m+2-j,n+2-i)=max;
    end
end

