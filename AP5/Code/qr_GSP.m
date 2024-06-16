% Entradas:
%   A - matriz (m x n)
% Saídas:
%   Q = matriz (m x n) ortogonal
%   R = matriz (n x n) triangular superior
function [Q, R, P] = qr_GSP(A)
  [m, n] = size(A);
  Q = zeros(m, n);
  R = zeros(n, n);
  P = eye(n); % Matriz de permutação

  for j = 1:n
    % Encontra o índice da coluna com a maior norma
    [~, indice_max] = max(vecnorm(A(:, j:n)));
    indice_max = indice_max + j - 1;

    % Trocar colunas de A
    if indice_max ~= j
      A(:, [j, indice_max]) = A(:, [indice_max, j]);
      P(:, [j, indice_max]) = P(:, [indice_max, j]);
    end
    
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