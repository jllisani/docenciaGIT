function B=imtouint8(A)
%convert image to uint8 image (reescaled in the range [0, 255])

m=min(min(A));
M=max(max(A));

if (m == M) 
  if ((m >= 0) & (m <= 255))
    B=uint8(round(A));
  else
    B=255*ones(size(A));
  end
else
  C=(A-m*ones(size(A)))*255/(M-m);
  B=uint8(round(C));  
end