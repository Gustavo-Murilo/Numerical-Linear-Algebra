% //////////////////////////////////////////////////////////////////////////
% Variáveis de saída:
% x: Solução do sistema Ax=b (assumimos que tal solução existe).
% C: Seja A=LU a decomposição LU de A.
% Então C(i,j)=L(i,j) para i>j e C(i,j)=U(i,j) para j>=i.
% P: Matriz de permutação da decomposição PLU de A.
% //////////////////////////////////////////////////////////////////////////
function [x, C, P] = Gaussian_Elimination_4(A, b)
  C = [A, b];
  [n] = size(C, 1);
  P = eye(n);
  
  for j = 1:(n-1)
    % Obtem o valor do maior pivo e a distancia a coluna j
    [maior_pivo, dist] = max(abs(C(j:n,j)));
    
    % Caso onde a matriz A não é singular. Não existe decomposição LU.
    if maior_pivo == 0
      error("O sistema é indeterminado");
    end
    
    % Troca as linhas caso o maior pivo esteja abaixo da linha j
    if dist ~= 1
      k = j + dist - 1;
    
      P([j k], :) = P([k j], :);
      C([j k], :) = C([k j], :);
    end
  
    % Processo de decomposição LU de A.
    for i = (j+1):n
      % O elemento C(i,j) é o elemento na posição (i,j) de L na decomposição LU de A.
      C(i, j) = C(i, j) / C(j, j);
      % Linha i <- Linha i - C(i,j)*Linha j.
      % Somente os elementos da diagonal ou acima dela são computados
      % (aqueles que compõem a matriz U).
      C(i, j+1:n+1) = C(i, j+1:n+1) - C(i, j) * C(j, j+1:n+1);
    end
  end

  x = zeros(n, 1);
  
  % Calcula x, sendo Ux=C(1:n,n+1).
  
  x(n) = C(n, n+1) / C(n, n);
  for i = n-1:-1:1
    x(i) = (C(i, n+1) - C(i, i+1:n) * x(i+1:n)) / C(i, i);
  end
  C = C(1:n, 1:n);

end % Fim da função
