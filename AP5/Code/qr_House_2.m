% Entradas:
%   A - matriz (m x n)
% Saídas:
%   U - matriz (m x n) contendo os vetores normais
%   R - matriz (m x k) triangular superior
function [U,R] = qr_House_2(A)
  [m, n] = size(A);
  
  % Determina a dimensão correta
  if m == n
    k = m - 1;
  else
    k = min(m,n); % Essa alteração abrange o caso onde m < n
  end

  % Inicializa matrizes
  R = A;
  U = zeros(m, k);
  
  for i = 1 : k
    x = A(i:m, i);
    
    % Obtém o vetor normal ao hiperplano de reflexão
    if x(1) > 0
      x(1) = x(1) + norm(x, 2);
    else
      x(1) = x(1) - norm(x, 2);
    end
    
    u = x / norm(x,2); % Normaliza o vetor
    U(i:m, i) = u;     % Armazena o vetor em U
    
    % Aplica a transformação de Householder à submatriz de A
    A(i:m, i:n) = A(i:m, i:n) - 2*u*(u'*A(i:m, i:n));
  end

  R = triu(A(1:k, 1:n)); % Para que coincida com
end
