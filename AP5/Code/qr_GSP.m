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
    % Encontrar o índice da coluna com a maior norma
    [~, indice_max] = max(vecnorm(A(:, j:n)));
    indice_max = indice_max + j - 1;

    % Trocar colunas de 
    if indice_max ~= j
      A(:, [j, indice_max]) = A(:, [indice_max, j]);
      P(:, [j, indice_max]) = P(:, [indice_max, j]);
    end
        
    % Aplicar o processo de Gram-Schmidt
    R(j, j) = norm(A(:, j));
    Q(:, j) = A(:, j) / R(j, j);
        
    for k = j+1:n
      R(j, k) = Q(:, j)' * A(:, k);
      A(:, k) = A(:, k) - Q(:, j) * R(j, k);
    end
  end

end