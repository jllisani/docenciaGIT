function Xf=passaalt(X, p)
%PASSAALT Filtre passa alt: passa un p% dels valors inicials

p=p/100;
Y=fft(X);
N=length(Y);
M=round(N*(1-p)/2);
Yf=zeros(size(Y));
Yf(M+1:N-M)=Y(M+1:N-M);
Xf=ifft(Yf);
Xf=abs(Xf);