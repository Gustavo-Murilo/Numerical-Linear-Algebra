% //////////////////////////////////////////////////////////////////////////
% Variáveis de saída:
% x: solução do sistema Ax=b (assumimos que tal solução existe).
% C: Seja A=LU a decomposição LU de A.
% Então C(i,j)=L(i,j) para i>j e C(i,j)=U(i,j) para j>=i.
% //////////////////////////////////////////////////////////////////////////
function [x, C, P] = Gaussian_Elimination_3(A, b)
C = [A, b];
[n] = size(C, 1);
P = eye(n);

for j = 1:(n-1)
  % O pivô deve estar na posição (j,j).

  % Se, em vez disso, tivermos um 0, trocamos a linha j por uma linha k,
  % sendo esta a primeira linha sem 0 na posição de pivô.
  if C(j, j) == 0
    % Atribui a dist o índice do elemento com maior valor absoluto dentre 
    % os elementos da coluna j abaixo da linha j.
    [maior_pivo, dist] = max(abs(C(j+1:n,j)));

    % Caso onde a matriz A não é singular. Não existe decomposição LU.
    if maior_pivo == 0
      error("O sistema é indeterminado");
    end

    % Atribui a k o índice da linha com maior pivo em módulo.
    k = dist(1) + j;

    % Há a troca das linhas k e j da matriz de permutação na decomposição PLU.
    P([j k], :) = P([k j], :);

    % Troca os elementos das linhas k e j da matriz completa [A|b] 
    % a partir da coluna j, pois antes disso todos são 0.
    C([j k], j:n+1) = C([k j], j:n+1);
  end 

  % Processo de decomposição LU de A.
  for i = (j+1):n
    % O elemento C(i,j) é o elemento na posição (i,j) de L na 
    % decomposição LU de A.
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

end % Fim da função.
