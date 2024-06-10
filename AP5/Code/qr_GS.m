% A mxn, com m>=n 
function [Q,R] = qr_GS(A)
  
  m = size(A,1); n = size(A,2);

  % Inicializa matrizes
  Q = zeros(m,n); R = zeros(n);

  for j = 1 : n
    v = A(:,j); % Coluna i de A
    
    for i = 1 : n
      R(i,j) = dot(Q(:,i), A(:,j));
      v = v - R(i,j) * Q(:,i);
    end
    
    R(j,j) = norm(v,2);
    Q(:,j) = v / R(j,j);
  end
end
