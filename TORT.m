function [A,U,beta] = TORT(A)
U=zeros(size(A));
    [m,n] = size(A);
    p = min(m-1,n);
    for k = 1:n%Ca minim intre m-1 si n(cazurile sistemelor subdeterminate, respectiv supradeterminate)
    sum = 0;
    for i = k:m
      sum = sum + A(i,k)^2;
    end
    sigma = sign(A(k,k))*sqrt(sum);
    if(sigma == 0)
      beta(k) = 0;
    else 
      U(k,k) = A(k,k) + sigma;
      for i = k+1:m
        U(i,k) = A(i,k);
      end
      beta(k) = sigma*U(k,k);
      A(k,k) = -sigma;
      for i = k+1:m
        A(i,k) = 0;
      end
      for j = k+1:n
        suma1 = 0;
        for i = k:m
            suma1 = suma1+U(i,k)*A(i,j);
        end
        tau = suma1/beta(k);
        for i = k:m
            A(i,j) = A(i,j) - tau*U(i,k);
        end
      end
    end
    end
end
