function f=sinc(t, T)
%SINC sinc function

for m=1:length(t)
    if (t(m) == 0) 
        f(m)=1;
    else 
        f(m)=sin(pi*t(m)/T)/(pi*t(m)/T);
    end
end
