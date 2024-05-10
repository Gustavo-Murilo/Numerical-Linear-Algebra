function [A, b, x, tempo] = Criar_Sistema(n)
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
  for i = 1 : n
    A(i,i) = A(i,i) + 5*n;
  end
end
