function [A, b, x, tempo] = Criar_Sistema_2(n)
  tempo = 0;
  tic;
  A = Criar_Dominante(n);
  x = randi(9,n,1);
  b = A*x;
  tempo = toc;
end

function [A] = Criar_Dominante(n)
  % Cria matriz nxn com inteiros aleatorios de 1 a 5
  A = randi(5,n,n);
  
  % a soma maxima de uma linha e 5(n-1)
  % para tornar uma matriz estritamente dominante, 
  % basta somar 5n a todos elementos da diagonal

  % Cria um vetor com a soma das linhas
  soma = sum(A,2);

  for i = 1 : n
    A(i,i) = soma(i) + 1;
  end
end
