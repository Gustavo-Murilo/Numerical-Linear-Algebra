function[x] = Resolve_LU(L,U,b) 
  n = size(L,1);
  y = zeros(n,1);
  x = zeros(n, 1);
  
  % Resolve o sistema triangular inferior
  % L*y = b, sendo a diagonal de L composta por 1's.
  y(1) = b(1);
  for i = 2 : n
    y(i) = b(i) - (L(i, 1 : i-1) * y(1 : i-1));
  end

  % Resolve o sistema triangular superior
  % U*x = y
  x(n) = y(n) / U(n,n);
  for j = n-1 : -1 : 1
    x(j) = (y(j) - U(j, j+1 : n) * x(j+1 : n)) / U(j,j);
  end

end % Finaliza a função
