function Xf=passabaix(X, p)
%PASSABAIX Filtre passa baix: passa un p% dels valors inicials

p=p/100;
Y=fft(X);
N=length(Y);
M=round(N*p/2);
Yf=zeros(size(Y));
Yf(1:M)=Y(1:M);
Yf(N-M+1:N)=Y(N-M+1:N);
Xf=ifft(Yf);
Xf=abs(Xf);