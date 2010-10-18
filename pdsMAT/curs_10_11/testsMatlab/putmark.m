function Y=putmark(X,x,y,max)
%PUTMARK pone una marca en el espectro X

[m,n]=size(X);

Y=X;
Y(y,x)=max;
Y(y-1,x)=0;
Y(y+1,x)=0;
Y(y-1,x-1)=0;
Y(y,x-1)=0;
Y(y+1,x-1)=0;
Y(y-1,x+1)=0;
Y(y,x+1)=0;
Y(y+1,x+1)=0;

Y(m-y+2,n-x+2)=max;
Y(m-(y-1)+2,n-x+2)=0;
Y(m-(y+1)+2,n-x+2)=0;
Y(m-(y-1)+2,n-(x-1)+2)=0;
Y(m-y+2,n-(x-1)+2)=0;
Y(m-(y+1)+2,n-(x-1)+2)=0;
Y(m-(y-1)+2,n-(x+1)+2)=0;
Y(m-y+2,n-(x+1)+2)=0;
Y(m-(y+1)+2,n-(x+1)+2)=0;
