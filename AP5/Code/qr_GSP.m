% Entradas:
%   A - matriz (m x n)
% Saídas:
%   Q = matriz (m x n) ortogonal
%   R = matriz (n x n) triangular superior
function [Q,R,P] = qr_GSP(A)
  [m, n] = size(A);

  % Inicializa matrizes
  Q = zeros(m,n); 
  R = zeros(n); 
  P = eye(n);
  

  norm_cols = vecnorm(A,2,1); % norma 2 das colunas de A
  v = zeros(n,1);
  
  for j = 1 : n
   
    for j = 1 : n-i+1
    end

    v = A(:,j); % Coluna i de A
    
    for i = 1 : n
      R(i,j) = dot(Q(:,i), v); % Atualiza a cada iteraçao
      v = v - R(i,j) * Q(:,i);
    end
    
    R(j,j) = norm(v,2);
    Q(:,j) = v / R(j,j);
  end
end %endfunction




function [Q,R,pivot] = Fatoracao_QR_TrocaColunas(A)
  [m,n] = size(A)
  
  nainf = norm(A,’inf’); 
  eps = 1.0E-14;

  pivot = zeros(n); R = zeros(n,n); Q = zeros(m,n)
  posto = n;

  for i=1:n
    pivot(i) = i
  end
  
  V = A
  
  for i = 1:n
    [p,nmax] = DeterminaNormaMaxima(V,i,n)
    
    if (p <> i) then
      [R,V,pivot] = TrocaConteudoColunas(i,p,R,V,pivot)
    end
    
    R(i,i) = nmax
      
    if ((nmax < eps * nainf) & (posto == n)) then
      posto = i-1
    end

    Q(:,i) = V(:,i)/R(i,i)
  
    for j = (i+1):n
      R(i,j) = Q(:,i)’*V(:,j)
      V(:,j) = V(:,j) - R(i,j)*Q(:,i)
    end

  end

  printf("Rank num´erico detectado: %d \n",posto)
endfunction