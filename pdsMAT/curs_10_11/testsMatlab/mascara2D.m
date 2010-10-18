function Y=mascara2D(Xi,Mi)
%MASCARA2D  aplica la mascara M a la imatge X

[my, mx]=size(Mi);
[h, w]=size(Xi);

cx=round((mx-1)/2);
cy=round((my-1)/2);

X=double(Xi);
Y=X;
M=double(Mi);
for j=1:h
    for i=1:w
            
      if ((i+mx <= w) & (j+my <= h)) 
          
        Y(j+cy,i+cx)=0;
        for mj=0:my-1
          for mi=0:mx-1
    
            Y(j+cy,i+cx)=Y(j+cy,i+cx)+M(mj+1,mi+1)*X(j+mj,i+mi);  
          
          end
        end
        
      end
        
    end
end

