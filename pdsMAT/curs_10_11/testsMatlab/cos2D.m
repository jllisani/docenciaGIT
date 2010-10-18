function Y=cos2D(w, h, A, T)
%COS2D imatge cosinus 2D
%rang entre 0 i A

for j=1:h 
    for i=1:w
        Y(j, i)=A/2+A/2*cos(2*pi*i/T);     
    end
end
