% Entradas:
%   A - matriz (m x n)
% Saídas:
%   Q = matriz (m x n) ortogonal
%   R = matriz (n x n) triangular superior
function [Q,R] = qr_GSM(A)
  [m, n] = size(A);
  
  % Inicializa matrizes
  Q = zeros(m,n); 
  R = zeros(n); 

  for j = 1 : n
    v = A(:,j); % j-ésima coluna de A
    
    % Obtém, por Gram-Schmidt, v o j-ésimo vetor de uma base ortogonal
    for i = 1 : j-1
      R(i,j) = dot(Q(:,i), v); % Usa o vetor atualizado
      v = v - R(i,j) * Q(:,i);
    end
   
    R(j,j) = norm(v,2);  
    Q(:,j) = v / R(j,j); % j-ésimo vetor de uma base ortonormal
  end
end

